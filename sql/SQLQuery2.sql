--DECLARE @Sodium  NUMERIC(12,3);
SELECT * FROM Health.sp_Get_Nutrients @NDB_No=N'10205', @Nutr_No=N'307', @Amount=100, @Measure=N'g';
--SELECT @Sodium;