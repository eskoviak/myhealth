-- Compare Foods
-- DECLARE Variables
DECLARE
	@NDB_No		CHAR(14),
	@Tagname	CHAR(20),
	@Nutr_Val	NUMERIC(18,3);

-- Check to see if the temp table exists
IF (EXISTS (SELECT * FROM tempdb.INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME LIKE '#NutData%'))
BEGIN
	DROP TABLE tempdb.#NutData
END

-- Create Temp Table
CREATE TABLE #NutData
(
	Long_Desc		VARCHAR(200),
	Sodium			NUMERIC(18,3),
	Energy			NUMERIC(18,3),
	K				NUMERIC(18,3),
	Protein			NUMERIC(18,3),
	Carbs			NUMERIC(18,3),
	Lipids			NUMERIC(18,3),
	Cholesterol		NUMERIC(18,3));

--Declare Cursor
DECLARE cursor_Nutrition_Snap CURSOR
FOR SELECT fd.Long_Desc, nud.Tagname, nd.Nutr_Val
  FROM NUT_DATA nd, NUTR_DEF nud, FOOD_DES fd
  WHERE nd.NDB_No IN ('20120', '16144')
    AND nud.Nutr_No IN ('307', '208', '203')
	AND fd.NDB_No = nd.NDB_NO
	AND nd.Nutr_No = nud.Nutr_No;

OPEN cursor_Nutrition_Snap;

FETCH NEXT FROM cursor_Nutrition_Snap
INTO @Ndb_No, @Tagname, @Nutr_Val;

WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @NDB_No, @Tagname, @Nutr_Val;

	FETCH NEXT FROM cursor_Nutrition_Snap
	INTO @Ndb_No, @Tagname, @Nutr_Val;

END

CLOSE cursor_Nutrition_Snap;
DEALLOCATE cursor_Nutrition_Snap;

  