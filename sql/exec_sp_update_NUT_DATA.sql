USE [SR28]
GO

DECLARE	@return_value Int

EXEC	@return_value = [Health].[sp_update_NUT_DATA]
		@NDB_No = N'99057'

SELECT	@return_value as 'Return Value'

GO

