USE [SR28]
GO

/****** Object:  StoredProcedure [Health].[sp_get_details]    Script Date: 2/1/2016 7:30:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
    PROCEDURE Health.sp_get_details
    
    Gets the Long_Desc, and Sodium, et. al. data in Health.DailyDetail for the current date.
    
    INPUTS:  None
    OUTPUTS: Updated Health.DailyDetail table
    
    V1.0    01/26/2016 ELS Converted from TSQL
    
*/
CREATE PROCEDURE [Health].[sp_get_details]
AS
DECLARE @Date           DATE,
        @NDB_No         CHAR(14),
        @Amount         NUMERIC(18,3),
        @Measure           CHAR(20),
        @Long_Desc	    VARCHAR(200),
		@Sodium		    Numeric(12,3),
		@Energy		    Numeric(12,3),
		@K			    Numeric(12,3),
		@Protein	    Numeric(12,3),
		@Carbs		    Numeric(12,3),
		@Lipids		    Numeric(12,3),
		@Cholesterol	Numeric(12,3);

SET @Date = FORMAT(GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'Eastern Standard Time', 'd');

-- Get the details from Health.DailyDetails
DECLARE cursor_DailyDetail CURSOR SCROLL
  FOR
	SELECT NDB_No, Long_Desc, Amount, Measure, Sodium, Energy, K, Protein, Carbs, Lipids, Cholesterol
	FROM Health.DailyDetail
    WHERE ObsDate = @Date
  FOR UPDATE OF Long_Desc, Sodium, Energy, K, Protein, Carbs, Lipids, Cholesterol;

OPEN cursor_DailyDetail;

FETCH NEXT FROM cursor_DailyDetail
  INTO @NDB_No, @Long_Desc, @Amount, @Measure, @Sodium, @Energy, @K, @Protein, @Carbs, @Lipids, @Cholesterol;

-- Loop through filling in values
WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE Health.DailyDetail SET Long_Desc = (SELECT Long_Desc FROM SR28.FOOD_DES WHERE NDB_No = @NDB_No) WHERE CURRENT OF cursor_DailyDetail;

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Amount = @Amount,
			@Measure = @Measure,
			@Sodium_Amt = @Sodium OUTPUT,
			@Energy_Amt = @Energy OUTPUT,
			@K_Amt = @K OUTPUT,
			@Protein_Amt = @Protein OUTPUT,
			@Carbs_Amt = @Carbs OUTPUT,
			@Lipids_Amt = @Lipids OUTPUT,
			@Cholesterol_Amt = @Cholesterol OUTPUT;

    UPDATE Health.DailyDetail 
	SET Sodium = @Sodium,
		Energy = @Energy,
		K = @K,
		Protein = @Protein,
		Carbs = @Carbs,
		Lipids = @Lipids,
	    Cholesterol = @Cholesterol
	WHERE CURRENT OF cursor_DailyDetail;       

	FETCH NEXT FROM cursor_DailyDetail
      INTO @NDB_No, @Long_Desc, @Amount, @Measure, @Sodium, @Energy, @K, @Protein, @Carbs, @Lipids, @Cholesterol;
END
CLOSE cursor_DailyDetail;
DEALLOCATE cursor_DailyDetail;    

GO

