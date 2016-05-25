CREATE TABLE [Health].[DataSource]
(
    SourceID    INT NOT NULL PRIMARY KEY,
    SourceDescription   VARCHAR(35) NOT NULL
)

INSERT INTO Health.DataSource
VALUES (40001,	'WeightGuru Scale'),
(40002,	'Gym Equipment'),
(40003,	'Apple Health App'),
(40004,	'Manual Calculation'),
(40005, 'FitBit Aria Scale');