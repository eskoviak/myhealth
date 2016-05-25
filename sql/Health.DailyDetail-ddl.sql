-- Health.DailyDetail DDL
CREATE TABLE [Health].[DailyDetail]
(
    DetailID    INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ObsDate     DATETIME NOT NULL,
    Meal        CHAR(20) NOT NULL,
    NDB_NO      CHAR(14) NOT NULL,
    Long_desc   VARCHAR(200) NULL,
    Amount      NUMERIC(10,3) NOT NULL,
    Measure     CHAR(14) NOT NULL,
    Commited    INT NULL DEFAULT 0,
    Sodium      NUMERIC(10,3) NULL,
    Energy      NUMERIC(10,3) NULL,
    K           NUMERIC(10,3) NULL,
    Protein     NUMERIC(10,3) NULL,
    Carbs       NUMERIC(10,3) NULL,
    Lipids      NUMERIC(10,3) NULL,
    Cholesterol NUMERIC(10,3) NULL
)