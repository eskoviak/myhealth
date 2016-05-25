CREATE VIEW [dbo].[HealthCrossTab]
	AS
	SELECT HealthObs.ObsDate AS 'Date',
	       HealthDailySummary.Calories AS 'Calories',
		   HealthDailySummary.Protein AS 'Protein',
		   HealthDailySummary.Carbohydrates AS 'Carbs',
		   HealthDailySummary.Fat,
		   HealthObs.Weight,
		   (HealthObs.Weight*(1-HealthObs.BodyFat)) AS 'LBM'
--		   HealthExternalData.Rest_Cal+HealthExternalData.Active_Cal AS 'Budget'
--	FROM HealthDailySummary, HealthObs, HealthExternalData
--	WHERE HealthDailySummary.ObsDate = HealthObs.ObsDate
--	  AND HealthDailySummary.ObsDate = HealthExternalData.ObsDate;
    FROM HealthObs LEFT OUTER JOIN HealthDailySummary
--	     HealthObs LEFT OUTER JOIN HealthExternalData
	ON  HealthObs.ObsDate = HealthDailySummary.ObsDate
--  AND HealthObs.ObsDate = HealthExternalData.ObsDate
--  ORDER BY HealthObs.ObsDate;