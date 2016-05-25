DECLARE @Date DATE =  FORMAT(GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'Eastern Standard Time', 'd');
INSERT INTO Health.DailyDetail
(ObsDate, NDB_No, Amount, Measure, Meal, Commited)
VALUES
--Template Line
--('01/25/2016','12061',30,'g','Lunch',0),
(@Date, '99014',58,'g','Breakfast',0),
(@Date, '04674',13,'g','Breakfast',0),
(@Date, '16399',27,'g','Breakfast',0),
(@Date, '09040',131,'g','Breakfast',0);
;

EXEC Health.sp_daily_report @Date;
EXEC Health.sp_daily_summary @Date;