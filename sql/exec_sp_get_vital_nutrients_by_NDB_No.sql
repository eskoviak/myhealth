DECLARE	@return_value int

EXEC	@return_value = [Health].[sp_get_vital_nutrients_by_NDB_No]
		@NDB_No = N'99041'

SELECT	'Return Value' = @return_value

GO
