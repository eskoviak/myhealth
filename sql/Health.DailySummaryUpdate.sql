/* Script Health.DailySummaryUpdate

   Updates the DailySummary table for the input date

   V1.0 01/25/2016 ELS  Original.  Uses current date.  TODO: Change into a Function or Stored Proc--Tie into update/insert trigger 
                                   on Health.DailyDetail.
*/
DECLARE @DetailDate		DATE = FORMAT(GETDATE(), 'd');



--Check to see if record exists
IF EXISTS (SELECT ObsDate FROM Health.DailySummary WHERE ObsDate = @DetailDate)
BEGIN
	/* Record exists, UPDATE */
	UPDATE Health.DailySummary
	SET
		TotSodium = (SELECT SUM(Sodium) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		TotEnergy = (SELECT SUM(Energy) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		TotK = (SELECT SUM(K) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		TotProtein = (SELECT SUM(Protein) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		TotCarbs = (SELECT SUM(Carbs) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		TotLipids = (SELECT SUM(Lipids) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		TotColesterol = (SELECT SUM(Cholesterol) FROM Health.DailyDetail WHERE ObsDate = @DetailDate)
	WHERE ObsDate = @DetailDate;
END
ELSE
BEGIN
	/* Record doesn't exist, INSERT */
    INSERT INTO Health.DailySummary (ObsDate, TotSodium, TotEnergy, TotK, TotProtein, TotCarbs, TotLipids, TotColesterol)
	VALUES
	(
		@DetailDate,
		(SELECT SUM(Sodium) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		(SELECT SUM(Energy) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		(SELECT SUM(K) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		(SELECT SUM(Protein) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		(SELECT SUM(Carbs) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		(SELECT SUM(Lipids) FROM Health.DailyDetail WHERE ObsDate = @DetailDate),
		(SELECT SUM(Cholesterol) FROM Health.DailyDetail WHERE ObsDate = @DetailDate)
	);
END

