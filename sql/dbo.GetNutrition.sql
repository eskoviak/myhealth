CREATE FUNCTION [dbo].[GetNutrition]
(
	@NDB_No char(12),
	@Nutr_No char(23),
	@Amt numeric(18,3)
)
RETURNS numeric(18,3)
WITH EXECUTE AS OWNER
AS
BEGIN
	DECLARE @GetNutrition numeric(18,3);
	DECLARE @StdVal numeric(18,3);
	SET @StdVal= (SELECT Nutr_Val FROM dbo.NUT_DATA WHERE NDB_No=@NDB_No AND Nutr_No = @Nutr_No);
	SET @GetNutrition = @StdVal*(@Amt/100);
	RETURN (@GetNutrition);
END
