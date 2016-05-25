CREATE TRIGGER UpdateNutrients
ON Health.DailyDetail
AFTER INSERT
AS
EXEC [Health].[sp_get_Details];

