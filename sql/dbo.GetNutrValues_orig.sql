CREATE FUNCTION [dbo].[GetNutrValues]
(
	@NDB_No char(14),
	@Amount numeric(18,3)
)
RETURNS @returntable TABLE
(
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
	DECLARE @sodium numeric(18,3);
	DECLARE @energy numeric(18,3);
	DECLARE @k numeric(18,3);
	DECLARE @protein numeric(18,3);
	DECLARE @carbs numeric(18,3);
	DECLARE @fat numeric(18,3);
	DECLARE @cholesterol numeric(18,3);

	SET @sodium = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '307') * @amount/100;
	SET @energy = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '208') * @amount/100;
	SET @k = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '306') * @amount/100;
	SET @protein = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '203') * @amount/100;
	SET @carbs = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '205') * @amount/100;
	SET @fat = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '204') * @amount/100;
	SET @cholesterol = (SELECT dbo.NUT_DATA.Nutr_Val FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '601') * @amount/100;


	INSERT @returntable
	SELECT @sodium, @energy, @k, @protein, @carbs, @fat, @cholesterol
	RETURN
END