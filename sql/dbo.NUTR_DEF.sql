CREATE TABLE [dbo].[NUTR_DEF]
(
	[Nutr_No] CHAR(14) NOT NULL PRIMARY KEY, 
    [Units] CHAR(14) NOT NULL, 
    [Tagname] CHAR(20) NULL, 
    [NutrDesc] VARCHAR(60) NOT NULL, 
    [Num_Dec] CHAR(14) NOT NULL, 
    [SR_Order] INT NOT NULL
)
