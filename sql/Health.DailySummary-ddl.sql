IF EXISTS(SELECT * FROM [INFORMATION_SCHEMA].[TABLES] WHERE TABLE_SCHEMA = 'Health' AND TABLE_NAME = 'DailySummary')
BEGIN
  PRINT 'DROPing [Health].[DailySummary]...';
  DROP TABLE [Health].[DailySummary]
END;

CREATE TABLE [Health].[DailySummary]
(
    ObsDate      DATETIME NOT NULL PRIMARY KEY,
    TotSodium     NUMERIC(18,3),
    TotEnergy     NUMERIC(18,3),
    TotK          NUMERIC(18,3),
    TotProtein    NUMERIC(18,3),
    TotCarbs      NUMERIC(18,3),
    TotLipids     NUMERIC(18,3),
    TotColesterol NUMERIC(18,3),    
)