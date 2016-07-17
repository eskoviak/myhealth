USE myHealth;

CREATE TABLE NUT_DATA
(
    NDB_No CHAR(5) NOT NULL, 
    Nutr_No CHAR(3) NOT NULL, 
    Nutr_Val NUMERIC(10, 3) NOT NULL, 
    Num_Data_Pts INT NOT NULL, 
    Std_Error NUMERIC(8, 3) NULL, 
    Src_Cd CHAR(2) NOT NULL, 
    Deriv_Cd CHAR(4) NULL, 
    Ref_NDB_No CHAR(5) NULL, 
    Add_Nutr_Mark CHAR(1) NULL, 
    Num_Studies TINYINT NULL, 
    Min NUMERIC(10, 3) NULL, 
    Max NUMERIC(10, 3) NULL, 
    DF SMALLINT NULL, 
    Low_EB NUMERIC(10, 3) NULL, 
    Up_EB NUMERIC(10, 3) NULL, 
    Stat_Cmt CHAR(10) NULL, 
    AdMod_Date DATE NULL, 
    CC CHAR(1) NULL 
);
