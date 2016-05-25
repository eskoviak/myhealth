SELECT * FROM Health.DailyDetail
WHERE ObsDate = FORMAT(GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'Eastern Standard Time', 'd');

SELECT
	meal,
	FORMAT(SUM(Sodium), 'N2') AS 'mg NA',
	FORMAT(SUM(Energy), 'N2') AS 'Cal', 
	FORMAT(SUM(K), 'N2') AS 'mg K', 
	FORMAT(SUM(Protein), 'N2') AS 'g Protein', 
	FORMAT(SUM(Carbs), 'N2') AS 'g Carbs', 
	FORMAT(SUM(Lipids), 'N2') AS 'g Lipids', 
	FORMAT(SUM(Cholesterol), 'N2') AS 'mg Cholesterol',
	FORMAT(SUM(Protein)/(SUM(Carbs)+SUM(Lipids)), 'N2') AS 'Pindex'
FROM Health.DailyDetail
WHERE ObsDate = FORMAT(GETDATE() AT TIME ZONE 'UTC' AT TIME ZONE 'Eastern Standard Time', 'd')
GROUP BY ROLLUP(meal);