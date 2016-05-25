INSERT INTO SR28.NUT_DATA
  (NDB_No, Nutr_No, Nutr_Val, Num_Data_Pts, Src_Cd)
  VALUES
  (
	'99065',
	'307',  --Sodium
	766.7,
	0,
	'9'
	);

INSERT INTO SR28.NUT_DATA
  (NDB_No, Nutr_No, Nutr_Val, Num_Data_Pts, Src_Cd)
  VALUES
  (
	'99065',
	'208',  --Energy
	433.3,
	0,
	'9'
	);

INSERT INTO SR28.NUT_DATA
  (NDB_No, Nutr_No, Nutr_Val, Num_Data_Pts, Src_Cd)
  VALUES
  (
	'99065',
	'306',  --K
	0,
	0,
	'9'
	);

INSERT INTO SR28.NUT_DATA
  (NDB_No, Nutr_No, Nutr_Val, Num_Data_Pts, Src_Cd)
  VALUES
  (
	'99065',
	'203',  --Protein
	40,
	0,
	'9'
	);

INSERT INTO SR28.NUT_DATA
  (NDB_No, Nutr_No, Nutr_Val, Num_Data_Pts, Src_Cd)
  VALUES
  (
	'99065',
	'205',	--Carbs
	30,
	0,
	'9'
	);

INSERT INTO SR28.NUT_DATA
  (NDB_No, Nutr_No, Nutr_Val, Num_Data_Pts, Src_Cd)
  VALUES
  (
	'99065',
	'204',	--Lipids
	13.3,
	0,
	'9'
	);

INSERT INTO SR28.NUT_DATA
  (NDB_No, Nutr_No, Nutr_Val, Num_Data_Pts, Src_Cd)
  VALUES
  (
	'99065',
	'601',	--Cholesterol
	0,
	0,
	'9'
	);

	SELECT * FROM SR28.NUT_DATA WHERE NDB_No = '99065';