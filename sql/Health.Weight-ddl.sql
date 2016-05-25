--Health.Weight-ddl
--Version 1.0 ELS 01/22/2016
--

--Check to see if the table exists, if so dropt it
IF EXISTS (SELECT * FROM [INFORMATION_SCHEMA].[TABLES] WHERE TABLE_SCHEMA = 'Health' AND TABLE_NAME = 'Weight')
BEGIN
    DROP TABLE [Health].[Weight];
END;

--Create table
CREATE TABLE [Health].[Weight]
(
    ObsDate         DATETIME NOT NULL,
    ClientID        UNIQUEIDENTIFIER DEFAULT '29E3BC7D-2159-4DDF-A829-B673CC8D6ED6' NULL,
    DataSource      INT NOT NULL,
    Weight          NUMERIC(18,3),
    BodyFat         NUMERIC(6,4)
)