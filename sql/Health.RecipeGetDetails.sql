/* Updates/fills in the recipe table 

*/
DECLARE
	@NDB_No		CHAR(14),
	@Long_Desc	VARCHAR(200),
	@Amount		NUMERIC(5,1),
	@Measure	CHAR(14),
	@Sodium		NUMERIC(12,3),
	@Energy		NUMERIC(12,3),
	@K			NUMERIC(12,3),
	@Protein	NUMERIC(12,3),
	@Carbs		NUMERIC(12,3),
	@Lipids		NUMERIC(12,3),
	@Cholesterol NUMERIC(12,3);

DECLARE cursor_Recipe CURSOR FOR
SELECT NDB_No, Long_Desc, Amount, Measure, Sodium, Energy, K, Protein, Carbs, Lipids, Cholesterol
FROM Health.Recipe
FOR UPDATE OF Long_Desc, Sodium, Energy, K, Protein, Carbs, Lipids, Cholesterol;

OPEN cursor_Recipe;

FETCH NEXT FROM cursor_Recipe
INTO
@NDB_No, @Long_Desc, @Amount, @Measure, @Sodium, @Energy, @K, @Protein, @Carbs, @Lipids, @Cholesterol;

/* Loop through and fill in details */
WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE Health.Recipe SET Long_Desc = (SELECT Long_Desc FROM SR28.FOOD_DES WHERE NDB_No = @NDB_No) WHERE CURRENT OF cursor_Recipe;

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

    UPDATE Health.Recipe 
	SET Sodium = @Sodium,
		Energy = @Energy,
		K = @K,
		Protein = @Protein,
		Carbs = @Carbs,
		Lipids = @Lipids,
	    Cholesterol = @Cholesterol
	WHERE CURRENT OF cursor_Recipe;   

	FETCH NEXT FROM cursor_Recipe
	INTO
	@NDB_No, @Long_Desc, @Amount, @Measure, @Sodium, @Energy, @K, @Protein, @Carbs, @Lipids, @Cholesterol;
END
CLOSE cursor_Recipe;
DEALLOCATE cursor_Recipe;