SELECT StepNo, RTRIM(NDB_No) AS NDB_No, RTRIM(Long_Desc) AS Ingredient, Amount, RTRIM(Measure) AS Measure
FROM Health.RecipeDetail
WHERE RecipeID = 26;