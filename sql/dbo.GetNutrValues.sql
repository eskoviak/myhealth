-- Function GetNutr Values
--
-- Gets data for the input NDB_No and the Amount
--
-- Version 2 1/16/2015 ELS Changed to using a cursor
--
CREATE FUNCTION [dbo].[GetNutrValues]
(
	@NDB_No char(14),
	@Amount numeric(18,3)
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
	DECLARE @scale numeric(18,3);

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
	

--	SET @sodium = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '307') * @amount/100;
--	SET @energy = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '208') * @amount/100;
--	SET @k = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '306') * @amount/100;
--	SET @protein = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '203') * @amount/100;
--	SET @carbs = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '205') * @amount/100;
--	SET @fat = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '204') * @amount/100;
--	SET @cholesterol = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '601') * @amount/100;


	INSERT @returntable
	SELECT @Long_Desc, @sodium*@scale, @energy*@scale, @k*@scale, @protein*@scale, @carbs*@scale, @fat*@scale, @cholesterol*@scale
	RETURN
END