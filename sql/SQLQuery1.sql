--SELECT *
--FROM health.DailyDetail
--WHERE ObsDate = '01/30/2016';

--SELECT SUM(Energy), SUM(Protein)
--FROM health.DailyDetail
--WHERE ObsDate = '01/30/2016';

UPDATE Health.DailyDetail
SET Amount = 207
WHERE DetailID = 275;