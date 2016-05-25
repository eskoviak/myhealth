DECLARE @Sodium numeric(18,3);
DECLARE @amount numeric(18,3);
DECLARE @NDB_No char(14);

SET @amount=100.0;
SET @NDB_No='99001';

SELECT @Sodium = (SELECT dbo.NUT_DATA.Nutr_No FROM NUT_DATA WHERE NDB_No = @NDB_No AND Nutr_No = '307') * @amount/100;
