/* Creates a blank temp table to be used for recipes

*/
CREATE TABLE Health.Recipe 
(
	NDB_No		CHAR(14),
	Long_Desc	VARCHAR(200),
	Amount		NUMERIC(5,1),
	Measure		CHAR(14),
	Sodium		NUMERIC(12,3),
	Energy		NUMERIC(12,3),
	K			NUMERIC(12,3),
	Protein		NUMERIC(12,3),
	Carbs		NUMERIC(12,3),
	Lipids		NUMERIC(12,3),
	Cholesterol	NUMERIC(12,3)
)
