CREATE TABLE IF NOT EXISTS FOOD_DES
(
	NDB_No		CHAR(5) NOT NULL PRIMARY KEY,
	FdGrp_Cd	CHAR(4) NOT NULL,
	Long_Desc	VARCHAR(200) NOT NULL,
	Shrt_Desc	VARCHAR(6) NOT NULL,
	ComName		VARCHAR(100),
	ManufacName	VARCHAR(65),
	Survey		CHAR(1),
	Ref_desc	VARCHAR(135),
	Refuse		INTEGER(2),
	SciName		VARCHAR(65),
	N_Factor	DECIMAL(4,2),
	Pro_Factor	DECIMAL(4,2),
	Fat_Factor	DECIMAL(4,2),
	CHO_Factor	DECIMAL(4,2)
);
