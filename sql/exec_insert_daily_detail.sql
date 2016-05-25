USE [SR28]
GO

DECLARE	@return_value Int

EXEC	@return_value = [Health].[sp_Insert_Daily_Detail]
		@NDB_No = N'04053',
		@Amount = 15,
		@Measure = N'g',
		@Meal = N'Lunch'

SELECT	@return_value as 'Return Value'

GO
