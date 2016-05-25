--Get Nutrient Data for Detail
-- Use 1/16/2016 for testing
--
-- Version 1.9 01/24/2016  ELS Changed to using SP for lookups.  The previous verison
--                             Took about 20 secs to run.
--
DECLARE @ObsDate DATETIME, @NDB_No CHAR(14), @Amount NUMERIC(18,3), @Meal CHAR(20);

SET @ObsDate = '1/24/2016';

-- declare variables
DECLARE @Long_Desc	VARCHAR(200),
		@Sodium		Numeric(12,3),
		@Energy		Numeric(12,3),
		@K			Numeric(12,3),
		@Protein	Numeric(12,3),
		@Carbs		Numeric(12,3),
		@Lipids		Numeric(12,3),
		@Cholesterol	Numeric(12,3),
		@Scale		Numeric(12,3);


-- Check to see if the temp table exists
IF (EXISTS (SELECT * FROM tempdb.INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME LIKE '#Details%'))
BEGIN
	DROP TABLE tempdb.#Details
END

-- create a temporary table to hold data
CREATE TABLE #Details (
	ObsDate		DATETIME,
	NDB_No		CHAR(14),
	Meal		CHAR(20),
	Food		VARCHAR(200),
	Amount		NUMERIC(18,3),
	Measure		CHAR(14),
	Sodium		NUMERIC(18,3),
	Energy		NUMERIC(18,3),
	K			NUMERIC(18,3),
	Protein		NUMERIC(18,3),
	Carbs		NUMERIC(18,3),
	Lipids		NUMERIC(18,3),
	Cholesterol	NUMERIC(18,3)
);

-- Get the details from Health.DailyDetails
DECLARE cursor_DailyDetail CURSOR SCROLL
  FOR
	SELECT NDB_No, Amount, Meal
	FROM Health.DailyDetail
	WHERE ObsDate = @ObsDate;

OPEN cursor_DailyDetail;

FETCH NEXT FROM cursor_DailyDetail
  INTO @NDB_No, @Amount, @Meal;

WHILE @@FETCH_STATUS = 0
BEGIN
--	SET @scale = @Amount/100.0;

	SET @Long_Desc = (SELECT Long_Desc FROM FOOD_DES WHERE NDB_No = @NDB_No);

--	DECLARE nutrient_cursor CURSOR SCROLL FOR
--		SELECT SR28.NUT_DATA.Nutr_Val FROM SR28.NUT_DATA WHERE NDB_No = @NDB_No
--		  AND Nutr_No IN ('307', '208', '306', '203', '205', '204', '601')
--		  ORDER BY Nutr_No;
--
--	OPEN nutrient_cursor
--	FETCH NEXT FROM nutrient_cursor INTO @Protein;
--	FETCH NEXT FROM nutrient_cursor	INTO @Lipids;
--	FETCH NEXT FROM nutrient_cursor	INTO @Carbs;
--	FETCH NEXT FROM nutrient_cursor	INTO @Energy;
--	FETCH NEXT FROM nutrient_cursor	INTO @K;
--	FETCH NEXT FROM nutrient_cursor	INTO @Sodium;
--	FETCH NEXT FROM nutrient_cursor INTO @Cholesterol;
--	CLOSE nutrient_cursor;
--	DEALLOCATE nutrient_cursor;

-- New Code For V1.9

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'307',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @Sodium OUTPUT;

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'208',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @Energy OUTPUT;

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'306',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @K OUTPUT;

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'203',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @Protein OUTPUT;

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'205',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @Carbs OUTPUT;

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'204',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @Lipids OUTPUT;

	EXEC	[Health].[sp_get_nutrients]
			@NDB_No = @NDB_No,
			@Nutr_no = N'601',
			@Amount = @Amount,
			@Measure = N'g',
			@Scaled_Amt = @Cholesterol OUTPUT;

	INSERT INTO #Details
	VALUES(@ObsDate,@NDB_No,@Meal,@Long_Desc,@Amount,'g', @Sodium,@Energy,@K,@Protein,@Carbs,@Lipids,@Cholesterol);

	FETCH NEXT FROM cursor_DailyDetail
      INTO @NDB_no, @Amount, @Meal;
END

CLOSE cursor_DailyDetail;
DEALLOCATE cursor_DailyDetail;    
SELECT * FROM #Details;
SELECT sum(Sodium) as Sodium,
	   Sum(Energy) as Energy,
	   sum(K) as K,
	   sum(Protein) as Protein,
	   sum(Carbs) as Carbs,
	   sum(Lipids) as Lipids,
	   sum(Cholesterol) as Cholesterol,
	   (sum(Protein)/(sum(Carbs)+sum(Lipids))) as EdDex
FROM #Details;