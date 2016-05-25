USE [SR28]
GO

DECLARE	@return_value Int

EXEC	@return_value = [Health].[sp_daily_summary]
		@RepDate = '2/11/2016'

SELECT	@return_value as 'Return Value'

GO
