USE [SR28]
GO

DECLARE	@return_value Int

EXEC	@return_value = [Health].[sp_update_recipe_detail_byID]
		@RecipeID = 21

SELECT	@return_value as 'Return Value'

GO
