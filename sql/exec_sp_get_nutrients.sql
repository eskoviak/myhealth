USE [SR28]
GO

DECLARE	@return_value Int,
		@Sodium_Amt decimal(12, 3),
		@Energy_Amt decimal(12, 3),
		@K_Amt decimal(12, 3),
		@Protein_Amt decimal(12, 3),
		@Carbs_Amt decimal(12, 3),
		@Lipids_Amt decimal(12, 3),
		@Cholesterol_Amt decimal(12, 3)

EXEC	@return_value = [Health].[sp_get_nutrients]
		@NDB_No = N'99009',
		@Amount = 1,
		@Measure = N'tablespoon',
		@Sodium_Amt = @Sodium_Amt OUTPUT,
		@Energy_Amt = @Energy_Amt OUTPUT,
		@K_Amt = @K_Amt OUTPUT,
		@Protein_Amt = @Protein_Amt OUTPUT,
		@Carbs_Amt = @Carbs_Amt OUTPUT,
		@Lipids_Amt = @Lipids_Amt OUTPUT,
		@Cholesterol_Amt = @Cholesterol_Amt OUTPUT

SELECT	@Sodium_Amt as N'@Sodium_Amt',
		@Energy_Amt as N'@Energy_Amt',
		@K_Amt as N'@K_Amt',
		@Protein_Amt as N'@Protein_Amt',
		@Carbs_Amt as N'@Carbs_Amt',
		@Lipids_Amt as N'@Lipids_Amt',
		@Cholesterol_Amt as N'@Cholesterol_Amt'

SELECT	@return_value as 'Return Value'

GO
