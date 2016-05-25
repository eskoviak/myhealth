-- ==========================================================
-- Create Stored Procedure Template for Windows Azure SQL Database
-- ==========================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [Health].[sp_update_NUT_DATA] 
	-- Add the parameters for the stored procedure here
	@NDB_No		CHAR(12),
	@Yield		NUMERIC(12,3)	
AS
BEGIN
	SET NOCOUNT ON;

	IF (@NDB_No < '99000')
		RETURN -1;   /* Can't touch non-custom data */
	DECLARE
		@TotSodium			NUMERIC(12,3),
		@TotEnergy			NUMERIC(12,3),
		@TotK			    NUMERIC(12,3),
		@TotProtein			NUMERIC(12,3),
		@TotCarbs			NUMERIC(12,3),
		@TotLipids			NUMERIC(12,3),
		@TotCholesterol		NUMERIC(12,3);

		SELECT
			@TotSodium = SUM(Sodium),
			@TotEnergy = SUM(Energy),
			@TotK = SUM(K),
			@TotProtein = SUM(Protein),
			@TotCarbs = SUM(Carbs),
			@TotLipids = SUM(Lipids),
			@TotCholesterol = SUM(Cholesterol)
		FROM Health.Recipe;

		UPDATE SR28.NUT_DATA
		  SET Nutr_Val = @TotSodium * (100.0/@Yield)
          WHERE Nutr_No = '307'
			AND NDB_No = @NDB_No;

		UPDATE SR28.NUT_DATA
		  SET Nutr_Val = @TotEnergy * (100.0/@Yield)
          WHERE Nutr_No = '208'
			AND NDB_No = @NDB_No;

		UPDATE SR28.NUT_DATA
		  SET Nutr_Val = @TotK * (100.0/@Yield)
          WHERE Nutr_No = '306'
			AND NDB_No = @NDB_No;

		UPDATE SR28.NUT_DATA
		  SET Nutr_Val = @TotProtein * (100.0/@Yield)
          WHERE Nutr_No = '203'
			AND NDB_No = @NDB_No;

		UPDATE SR28.NUT_DATA
		  SET Nutr_Val = @TotCarbs * (100.0/@Yield)
          WHERE Nutr_No = '205'
			AND NDB_No = @NDB_No;

		UPDATE SR28.NUT_DATA
		  SET Nutr_Val = @TotLipids * (100.0/@Yield)
          WHERE Nutr_No = '204'
			AND NDB_No = @NDB_No;

		UPDATE SR28.NUT_DATA
		  SET Nutr_Val = @TotCholesterol * (100.0/@Yield)
          WHERE Nutr_No = '601'
			AND NDB_No = @NDB_No;

		RETURN 0;
END
GO
