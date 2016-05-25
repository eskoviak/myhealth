UPDATE SR28.NUT_DATA
-- Sodium
SET Nutr_Val = 368.4 
WHERE NDB_No = '99026'
  AND Nutr_No = 307;

UPDATE SR28.NUT_DATA
-- Energy
SET Nutr_Val = 368.4 
WHERE NDB_No = '99026'
  AND Nutr_No = 208;

UPDATE SR28.NUT_DATA
-- K
SET Nutr_Val = 363.2 
WHERE NDB_No = '99026'
  AND Nutr_No = 306;

UPDATE SR28.NUT_DATA
-- Protein
SET Nutr_Val = 78.9 
WHERE NDB_No = '99026'
  AND Nutr_No = 203;

UPDATE SR28.NUT_DATA
-- Carbs
SET Nutr_Val = 5.3 
WHERE NDB_No = '99026'
  AND Nutr_No = 205;

UPDATE SR28.NUT_DATA
-- Lipids
SET Nutr_Val = 2.63 
WHERE NDB_No = '99026'
  AND Nutr_No = 204;

UPDATE SR28.NUT_DATA
-- Cholesterol
SET Nutr_Val = 39.5 
WHERE NDB_No = '99026'
  AND Nutr_No = 601;

SELECT *
FROM SR28.NUT_DATA
WHERE NDB_No = '99026';