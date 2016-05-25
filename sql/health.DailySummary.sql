CREATE TABLE [health].[DailySummary]
(
    ObsDate     DATE NOT NULL PRIMARY KEY,
    ClientID    UNIQUEIDENTIFIER NOT NULL,
    SourceID    INT NOT NULL,
    Sodium      NUMERIC(18,3) DEFAULT 0,
    Energy      NUMERIC(18,3) DEFAULT 0,
    K           NUMERIC(18,3) DEFAULT 0,
    Protein     NUMERIC(18,3) DEFAULT 0,
    Carbs       NUMERIC(18,3) DEFAULT 0,
    Lipids      NUMERIC(18,3) DEFAULT 0,
    Cholesterol NUMERIC(18,3) DEFAULT 0
)
    