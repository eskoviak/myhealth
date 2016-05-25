-- Function GetDetailsByDay
--
-- Gets data for the input date; returns a table
--
-- Version 1 1/19/2015 ELS Original
--
CREATE FUNCTION [health].[GetDetailsByDate]
(
	@ObsDate	DATETIME
)
RETURNS @details TABLE
(
	ObsDate		DATETIME,
	NDB_No		CHAR(14),
	Meal		CHAR(20),
	Long_Desc	VARCHAR(200),
	Amount		NUMERIC(18,3),
	Measure		CHAR(14),
	Sodium		NUMERIC(18,3),
	Energy		NUMERIC(18,3),
	K			NUMERIC(18,3),
	Protein		NUMERIC(18,3),
	Carbs		NUMERIC(18,3),
	Lipids		NUMERIC(18,3),
	Cholesterol	NUMERIC(18,3)
)
AS
BEGIN
	DECLARE @NDB_No CHAR(14),
	  @Amount NUMERIC(18,3),
	  @Meal CHAR(20);
	DECLARE @Long_Desc varchar(200);
	DECLARE @sodium numeric(18,3);
	DECLARE @energy numeric(18,3);
	DECLARE @k numeric(18,3);
	DECLARE @protein numeric(18,3);
	DECLARE @carbs numeric(18,3);
	DECLARE @fat numeric(18,3);
	DECLARE @cholesterol numeric(18,3);

	-- Get the details from Health.DailyDetails
    DECLARE cursor_DailyDetail CURSOR SCROLL
      FOR
	    SELECT NDB_No, Amount, Meal
	    FROM Health.DailyDetail
	    WHERE ObsDate = @ObsDate;

    OPEN cursor_DailyDetail;

    FETCH NEXT FROM cursor_DailyDetail
      INTO @NDB_No, @Amount, @Meal;
	  
	  SET @Long_Desc = (SELECT Long_Desc FROM FOOD_DES WHERE NDB_No = @NDB_No);

	  DECLARE nutrient_cursor CURSOR SCROLL FOR
		SELECT dbo.NUT_DATA.Nutr_Val FROM dbo.NUT_DATA WHERE NDB_No = @NDB_No
		  AND Nutr_No IN ('307', '208', '306', '203', '205', '204', '601')
		  ORDER BY Nutr_No;

	  OPEN nutrient_cursorI
	  FETCH NEXT FROM nutrient_cursor INTO @protein;
	  FETCH NEXT FROM nutrient_cursor	INTO @fat;
	  FETCH NEXT FROM nutrient_cursor	INTO @carbs;
	  FETCH NEXT FROM nutrient_cursor	INTO @energy;
	  FETCH NEXT FROM nutrient_cursor	INTO @k;
	  FETCH NEXT FROM nutrient_cursor	INTO @sodium;
	  FETCH NEXT FROM nutrient_cursor INTO @cholesterol;
	  CLOSE nutrient_cursor;
	  DEALLOCATE nutrient_cursor;


	INSERT @details
	SELECT @Long_Desc, @sodium, @energy, @k, @protein, @carbs, @fat, @cholesterol
	RETURN
END