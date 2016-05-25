CREATE PROCEDURE [dbo].sp_Get_Client_Age
	@clientID UNIQUEIDENTIFIER,
	@age INTEGER OUTPUT
AS
	DECLARE @temp as DATE;
	SELECT @temp = dbo.HealthClients.BirthDate FROM dbo.HealthClients
	WHERE ClientID = @clientID;
	SET @age = DATEDIFF(year, @temp, GETDATE());
RETURN 0