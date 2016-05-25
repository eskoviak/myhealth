CREATE TABLE [dbo].[NUT_DATA]
(
	[NDB_No] CHAR(14) NOT NULL, 
    [Nutr_No] CHAR(14) NOT NULL, 
    [Nutr_Val] NUMERIC(18, 3) NOT NULL, 
    [Num_Data_Pts] INT NOT NULL, 
    [Std_Error] NCHAR(10) NULL, 
    [Src_Cd] CHAR(14) NOT NULL, 
    [Deriv_Cd] CHAR(14) NOT NULL, 
    [Ref_NDB_No] CHAR(14) NULL, 
    [Add_Nutr_Mark] CHAR(14) NOT NULL, 
    [Num_Studies] INT NOT NULL, 
    [Min] NUMERIC(18, 3) NULL, 
    [Max] NUMERIC(18, 3) NULL, 
    [DF] INT NULL, 
    [Low_EB] NUMERIC(18, 3) NULL, 
    [Up_EB] NUMERIC(18, 3) NULL, 
    [Stat_Cmt] CHAR(14) NULL, 
    [AddMod_Date] DATE NULL, 
    [CC] CHAR(14) NULL 
)
