CREATE TABLE [Health].[Observations]
(
    ObsDate         DATE NOT NULL,
    ClientID        UNIQUEIDENTIFIER NOT NULL,
    DataSource      INT NOT NULL,
    Weight          NUMERIC(18,3) NULL,
    BodyFat         NUMERIC(5,4) NULL,
    
)