--Function Get Nutrient Data for Detail
--
-- Populates a temp table NutrDetails (dropping/creating if the table
--   already exists).
--
-- 01/22/2016 ELS Original
--
CREAte FUNCTION CreateDetailTable
(
    @ObsDate    DATETIME
)
RETURNS INT
BEGIN

    -- declare variables
    DECLARE @Long_Desc	VARCHAR(200),
            @Sodium		Numeric(18,3),
            @Energy		Numeric(18,3),
            @K			Numeric(18,3),
            @Protein	Numeric(18,3),
            @Carbs		Numeric(18,3),
            @Lipids		Numeric(18,3),
            @Cholesterol	Numeric(18,3),
            @Scale		Numeric(18,3);


    -- Check to see if the temp table exists
    IF (EXISTS (SELECT * FROM tempdb.INFORMATION_SCHEMA.TABLES WHERE  TABLE_NAME LIKE '#NutrDetails%'))
    BEGIN
        DROP TABLE tempdb.#NutrDetails
    END

    -- create a temporary table to hold data
    CREATE TABLE #NutrDetails (
        ObsDate		DATETIME,
        NDB_No		CHAR(14),
        Meal		CHAR(20),
        Food		VARCHAR(200),
        Amount		NUMERIC(18,3),
        Measure		CHAR(14),
        Sodium		NUMERIC(18,3),
        Energy		NUMERIC(18,3),
        K			NUMERIC(18,3),
        Protein		NUMERIC(18,3),
        Carbs		NUMERIC(18,3),
        Lipids		NUMERIC(18,3),
        Cholesterol	NUMERIC(18,3)
    );

    -- Get the details from Health.DailyDetails
    DECLARE cursor_DailyDetail CURSOR SCROLL
    FOR
        SELECT NDB_No, Amount, Meal
        FROM Health.DailyDetail
        WHERE ObsDate = @ObsDate;

    OPEN cursor_DailyDetail;

    FETCH NEXT FROM cursor_DailyDetail
      INTO @NDB_No, @Amount, @Meal;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @scale = @Amount/100.0;

        SET @Long_Desc = (SELECT Long_Desc FROM FOOD_DES WHERE NDB_No = @NDB_No);

        -- Get the data for the item from NUT_DATA
        DECLARE nutrient_cursor CURSOR SCROLL FOR
            SELECT dbo.NUT_DATA.Nutr_Val FROM dbo.NUT_DATA WHERE NDB_No = @NDB_No
            AND Nutr_No IN ('307', '208', '306', '203', '205', '204', '601')
            ORDER BY Nutr_No;

                OPEN nutrient_cursor
                FETCH NEXT FROM nutrient_cursor INTO @Protein;
                FETCH NEXT FROM nutrient_cursor	INTO @Lipids;
                FETCH NEXT FROM nutrient_cursor	INTO @Carbs;
                FETCH NEXT FROM nutrient_cursor	INTO @Energy;
                FETCH NEXT FROM nutrient_cursor	INTO @K;
                FETCH NEXT FROM nutrient_cursor	INTO @Sodium;
                FETCH NEXT FROM nutrient_cursor INTO @Cholesterol;
        CLOSE nutrient_cursor;
        DEALLOCATE nutrient_cursor;

        INSERT INTO #NutrDetails
        VALUES(@ObsDate,@NDB_No,@Meal,@Long_Desc,@Amount,'g', @Sodium*@Scale,@Energy*@Scale,@K*@Scale,@Protein*@Scale,@Carbs*@Scale,@Lipids*@Scale,@Cholesterol*@Scale);

        FETCH NEXT FROM cursor_DailyDetail
        INTO @NDB_no, @Amount, @Meal;
    END

    CLOSE cursor_DailyDetail;
    DEALLOCATE cursor_DailyDetail;  
    
    RETURN 0  
END