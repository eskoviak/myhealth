SELECT dbo.GetNutrition('99001', '307', 100.0) as NaCl,
  dbo.GetNutrition('99001', '208', 100.0) as Cal,
  dbo.GetNutrition('99001', '306', 100.0) as K,
  dbo.GetNutrition('99001', '203', 100.0) as Protein,
  dbo.GetNutrition('99001', '205', 100.0) as Carb,
  dbo.GetNutrition('99001', '204', 100.0) as Fat,
  dbo.GetNutrition('99001', '601', 100.0) as Cholesterol;