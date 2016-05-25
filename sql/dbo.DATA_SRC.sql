CREATE TABLE [dbo].[DATA_SRC]
(
	[DataSrc_D] CHAR(14) NOT NULL PRIMARY KEY, 
    [Authors] VARCHAR(255) NULL, 
    [Title] VARCHAR(255) NOT NULL, 
    [Year] CHAR(14) NULL, 
    [Journal] VARCHAR(135) NULL, 
    [Vol_City] CHAR(16) NULL, 
    [Issue_State] CHAR(14) NULL, 
    [Start_Page] CHAR(14) NULL, 
    [End_Page] CHAR(14) NULL
)
