DECLARE @Date DATE =  FORMAT(GETDATE(), 'd');

SELECT *
FROM Health.DailyDetail
WHERE ObsDate = @Date;

SELECT *
FROM Health.DailySummary
WHERE ObsDate = @Date;

