--Get Nutrient Data for Detail
-- Use 1/16/2016 for testing

DECLARE @ObsDate DATETIME, @NDB_No CHAR(14), @Amount NUMERIC(18,3), @Meal CHAR(20);

SET @ObsDate = '1/16/2016';

DECLARE @report TABLE
(
	ObsDate DATETIME,
	NDB_No CHAR(14),
	Food VARCHAR(200),
	Amount NUMERIC(18,3),
	Sodium NUMERIC(18,3),
	Energy NUMERIC(18,3),
	K NUMERIC(18,3),
	Carbs NUMERIC(18,3),
	Fat NUMERIC(18,3),
	Cholesterol NUMERIC(18,3)
);



DECLARE cursor_DailyDetail CURSOR SCROLL
  FOR
	SELECT NDB_No, Amount, Meal
	FROM Health.DailyDetail
	WHERE ObsDate = @ObsDate

OPEN cursor_DailyDetail
FETCH NEXT FROM cursor_DailyDetail INTO @NDB_no, @AMount, @Meal;

SELECT * from dbo.GetNutrValues(@NDB_No, @Amount);

WHILE @@FETCH_STATUS = 0
BEGIN
  FETCH NEXT FROM cursor_DailyDetail INTO @NDB_no, @AMount, @Meal;
  SELECT * from dbo.GetNutrValues(@NDB_No, @Amount);	
END

CLOSE cursor_DailyDetail;
DEALLOCATE cursor_DailyDetail;

--UPDATE HealthDailyDetail
--SET ObsDate = '1/16/2016'
--WHERE ObsDate = '12/16/2016';