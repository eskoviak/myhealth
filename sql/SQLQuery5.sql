SELECT * FROM Health.DailyDetail
WHERE ObsDate = '01/24/2016';

UPDATE Health.DailyDetail
SET Amount = 329
WHERE NDB_No = '99001'
  AND ObsDate = '01/24/2016';

SELECT * FROM Health.DailyDetail
WHERE ObsDate = '01/24/2016';