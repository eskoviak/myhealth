-- Function GetNutr Values
--
-- Gets data for the input NDB_No and the Amount
--
-- Version 2 1/16/2015 ELS Changed to using a cursor
-- Version 3  1/20/2015 ELS Changed to accepting a table
--   of structure [<NDB_No>, <Amount>]
--
CREATE FUNCTION [SR28].[GetNutrValuesTable]
(
	@intable TABLE
    (
        NDB_No  CHAR(14),
        Amount  NUMERIC(18,3)
    )
)
RETURNS @returntable TABLE
(
	Long_Desc VARCHAR(200),
	Sodium NUMERIC(18,3),
	Energy NUMERIC(18,3),
	K NUMERIC(18,3),
	Protein NUMERIC(18,3),
	Carbs NUMERIC(18,3),
	Fat NUMERIC(18,3),
	Cholesterol NUMERIC(18,3)
)
AS
BEGIN
	DECLARE @Long_Desc varchar(200);
	DECLARE @sodium numeric(18,3);
	DECLARE @energy numeric(18,3);
	DECLARE @k numeric(18,3);
	DECLARE @protein numeric(18,3);
	DECLARE @carbs numeric(18,3);
	DECLARE @fat numeric(18,3);
	DECLARE @cholesterol numeric(18,3);
	DECLARE @scale numeric(18,3),
      @NDB_No   CHAR(14),
      @Amount   NUMERIC(18,3);

    DECLARE cursor_ingredient CURSOR SCROLL FOR
        SELECT NDB_No, Amount
        FROM @intable;
        
    OPEN cursor_ingredient
    FETCH NEXT FROM cursor_ingredient
      INTO @NDB_No, @Amount;

    WHILE @@FETCH_STATUS = 0
    BEGIN      
        SET @scale = @Amount/100.0;
        SET @Long_Desc = (SELECT Long_Desc FROM FOOD_DES WHERE NDB_No = @NDB_No);

        DECLARE nutrient_cursor CURSOR SCROLL FOR
            SELECT dbo.NUT_DATA.Nutr_Val FROM dbo.NUT_DATA WHERE NDB_No = @NDB_No
            AND Nutr_No IN ('307', '208', '306', '203', '205', '204', '601')
            ORDER BY Nutr_No;

        OPEN nutrient_cursor
        FETCH NEXT FROM nutrient_cursor INTO @protein;
        FETCH NEXT FROM nutrient_cursor	INTO @fat;
        FETCH NEXT FROM nutrient_cursor	INTO @carbs;
        FETCH NEXT FROM nutrient_cursor	INTO @energy;
        FETCH NEXT FROM nutrient_cursor	INTO @k;
        FETCH NEXT FROM nutrient_cursor	INTO @sodium;
        FETCH NEXT FROM nutrient_cursor INTO @cholesterol;
        CLOSE nutrient_cursor;
        DEALLOCATE nutrient_cursor;

        INSERT @returntable
        SELECT @Long_Desc, @sodium*@scale, @energy*@scale, @k*@scale, @protein*@scale, @carbs*@scale, @fat*@scale, @cholesterol*@scale
	
    END

	RETURN
END