DECLARE	@return_value int

EXEC	@return_value = [Health].[sp_Insert_Daily_Detail]
		@NDB_No = N'04638',
		@Amount = 2,
		@Measure = N'tablespoon',
		@Meal = N'Dinner'

SELECT	'Return Value' = @return_value

GO
