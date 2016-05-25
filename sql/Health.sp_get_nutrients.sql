USE [SR28]
GO

/****** Object:  StoredProcedure [Health].[sp_get_nutrients]    Script Date: 2/1/2016 7:29:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Stored procedure to get nutrient value for NDB_No, Nutr_No
--
-- V1.0 02/23/2016 ELS Original
-- V2.0 92/23/2016 ELS Changed:
--                 1).  Test for Measure
--                 2).  Pass in Date
--                 3).  Gets all seven Nutrients
--

-- Drop the proc if it exists
CREATE PROCEDURE [Health].[sp_get_nutrients]
(
	@NDB_No     CHAR(12),
	--@Nutr_No	CHAR(12),
    @Amount     NUMERIC(18,3),
    @Measure    CHAR(12),
	@Sodium_Amt NUMERIC(12,3) OUTPUT,
	@Energy_Amt NUMERIC(12,3) OUTPUT,
	@K_Amt NUMERIC(12,3) OUTPUT,
	@Protein_Amt NUMERIC(12,3) OUTPUT,
	@Carbs_Amt NUMERIC(12,3) OUTPUT,
	@Lipids_Amt NUMERIC(12,3) OUTPUT,
	@Cholesterol_Amt NUMERIC(12,3) OUTPUT
)
AS

	DECLARE @ConvAmt NUMERIC(13,3);

	-- Test to see if the measure is in grams
	IF ( NOT(@Measure = 'g' OR @Measure ='grams' OR @Measure = 'gm'))
	BEGIN
	    IF EXISTS ( SELECT Gm_Wgt FROM SR28.WEIGHT WHERE Msre_Desc = @Measure AND NDB_No = @NDB_No )
		 	SET @Amount = (SELECT TOP 1 Gm_Wgt*(@Amount)/Amount FROM SR28.WEIGHT WHERE Msre_Desc = @Measure AND NDB_No = @NDB_No)
		ELSE
		RETURN -1;
	END;

    SET @Sodium_Amt = (SELECT Nutr_Val * (@Amount/100.0)
    FROM SR28.NUT_DATA
    WHERE Nutr_No = '307'
      AND NDB_No = @NDB_No);

    SET @Energy_Amt = (SELECT Nutr_Val * (@Amount/100.0)
    FROM SR28.NUT_DATA
    WHERE Nutr_No = '208'
      AND NDB_No = @NDB_No);

	SET @K_Amt = (SELECT Nutr_Val * (@Amount/100.0)
    FROM SR28.NUT_DATA
    WHERE Nutr_No = '306'
      AND NDB_No = @NDB_No);

    SET @Protein_Amt = (SELECT Nutr_Val * (@Amount/100.0)
    FROM SR28.NUT_DATA
    WHERE Nutr_No = '203'
      AND NDB_No = @NDB_No);

    SET @Carbs_Amt = (SELECT Nutr_Val * (@Amount/100.0)
    FROM SR28.NUT_DATA
    WHERE Nutr_No = '205'
      AND NDB_No = @NDB_No);

    SET @Lipids_Amt = (SELECT Nutr_Val * (@Amount/100.0)
    FROM SR28.NUT_DATA
    WHERE Nutr_No = '204'
      AND NDB_No = @NDB_No);

    SET @Cholesterol_Amt = (SELECT Nutr_Val * (@Amount/100.0)
    FROM SR28.NUT_DATA
    WHERE Nutr_No = '601'
      AND NDB_No = @NDB_No);

	RETURN 0
GO

