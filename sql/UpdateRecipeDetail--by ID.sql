DECLARE
	@NDB_No			CHAR(12),
	@Long_Desc		VARCHAR(200),
	@Amount			NUMERIC(13,3),
	@Measure		CHAR(20),
	@Sodium			NUMERIC(13,3),
	@Energy			NUMERIC(13,3),
	@K				NUMERIC(13,3),
	@Protein		NUMERIC(13,3),
	@Carbs			NUMERIC(13,3),
	@Lipids			NUMERIC(13,3),
	@Cholesterol	NUMERIC(13,3);

	DECLARE cursor_recipedetail CURSOR FOR 
	SELECT NDB_No, Long_Desc, Amount, Measure, Sodium, Energy, K, Protein, Carbs, Lipids, Cholesterol
	FROM Health.RecipeDetail
	WHERE RecipeID = 1
	FOR UPDATE OF  Long_Desc, Sodium, Energy, K, Protein, Carbs, Lipids, Cholesterol;

OPEN cursor_recipedetail;

FETCH FROM cursor_recipedetail
INTO
	@NDB_No, @Long_Desc, @Amount, @Measure, @Sodium, @Energy, @K, @Protein, @Carbs, @Lipids, @Cholesterol;

WHILE @@FETCH_STATUS = 0
BEGIN
	UPDATE Health.RecipeDetail SET Long_Desc = (SELECT Long_Desc FROM SR28.FOOD_DES WHERE NDB_No = @NDB_No) WHERE CURRENT OF cursor_RecipeDetail;
	
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

	    UPDATE Health.RecipeDetail 
		SET Sodium = @Sodium,
			Energy = @Energy,
			K = @K,
			Protein = @Protein,
			Carbs = @Carbs,
			Lipids = @Lipids,
			Cholesterol = @Cholesterol
			WHERE CURRENT OF cursor_RecipeDetail; 

		FETCH FROM cursor_recipedetail
		INTO
		@NDB_No, @Long_Desc, @Amount, @Measure, @Sodium, @Energy, @K, @Protein, @Carbs, @Lipids, @Cholesterol;
END

CLOSE cursor_recipedetail;
DEALLOCATE cursor_recipedetail;