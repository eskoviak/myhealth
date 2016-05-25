USE [SR28]
GO

DECLARE	@return_value Int

EXEC	@return_value = [Health].[sp_search_food_index]
		@keywords = N'tuna AND canned'

SELECT	@return_value as 'Return Value'

GO
