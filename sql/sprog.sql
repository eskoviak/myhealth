/*
    PROCEDURE Health.sp_get_details
    
    Gets the Long_Desc, and Sodium, et. al. data in Health.DailyDetail for the current date.
    
    INPUTS:  None
    OUTPUTS: Updated Health.DailyDetail table
    
    V1.0    01/26/2016 ELS Converted from TSQL
    
*/
CREATE PROCEDURE Health.sp_get_details
AS
DECLARE @Date           DATE,
        @NDB_No         CHAR(14),
        @Amount         NUMERIC(18,3),
        @Meal           CHAR(20),
        @Long_Desc	    VARCHAR(200),
		@Sodium		    Numeric(12,3),
		@Energy		    Numeric(12,3),
		@K			    Numeric(12,3),
		@Protein	    Numeric(12,3),
		@Carbs		    Numeric(12,3),
		@Lipids		    Numeric(12,3),
		@Cholesterol	Numeric(12,3),
		@OutVal		    Numeric(12,3);

SET @Date = FORMAT(GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'Eastern Standard Time', 'd');

-- Get the details from Health.DailyDetails
DECLARE cursor_DailyDetail CURSOR SCROLL
  FOR
	SELECT NDB_No, Long_Desc, Amount, Meal, Sodium, Energy, K, Protein, Carbs, Lipids, Cholesterol
	FROM Health.DailyDetail
    WHERE ObsDate = @Date
  FOR UPDATE OF Long_Desc, Sodium, Energy, K, Protein, Carbs, Lipids, Cholesterol;

OPEN cursor_DailyDetail;

FETCH NEXT FROM cursor_DailyDetail
  INTO @NDB_No, @Long_Desc, @Amount, @Meal, @Sodium, @Energy, @K, @Protein, @Carbs, @Lipids, @Cholesterol;

-- Loop through filling in values
WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE Health.DailyDetail SET Long_Desc = (SELECT Long_Desc FROM FOOD_DES WHERE NDB_No = @NDB_No) WHERE CURRENT OF cursor_DailyDetail;

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'307',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @OutVal OUTPUT;
    UPDATE Health.DailyDetail SET Sodium = @OutVal WHERE CURRENT OF cursor_DailyDetail;       

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'208',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @OutVal OUTPUT;
    UPDATE Health.DailyDetail SET Energy = @OutVal WHERE CURRENT OF cursor_DailyDetail;       

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'306',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @OutVal OUTPUT;
    UPDATE Health.DailyDetail SET K = @OutVal WHERE CURRENT OF cursor_DailyDetail;       

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'203',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @OutVal OUTPUT;
    UPDATE Health.DailyDetail SET Protein = @OutVal WHERE CURRENT OF cursor_DailyDetail;       

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'205',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @OutVal OUTPUT;
    UPDATE Health.DailyDetail SET Carbs = @OutVal WHERE CURRENT OF cursor_DailyDetail;       

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'204',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @OutVal OUTPUT;
    UPDATE Health.DailyDetail SET Lipids = @OutVal WHERE CURRENT OF cursor_DailyDetail;       

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'601',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @OutVal OUTPUT;
    UPDATE Health.DailyDetail SET Cholesterol = @OutVal WHERE CURRENT OF cursor_DailyDetail;       

	FETCH NEXT FROM cursor_DailyDetail
      INTO @NDB_No, @Long_Desc, @Amount, @Meal, @Sodium, @Energy, @K, @Protein, @Carbs, @Lipids, @Cholesterol;
END
CLOSE cursor_DailyDetail;
DEALLOCATE cursor_DailyDetail;    
