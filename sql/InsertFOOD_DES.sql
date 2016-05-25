-- Inserts Next Number in to FOOD_DES table
--
--
INSERT INTO SR28.FOOD_DES
  (NDB_No, FdGrp_Cd, Long_Desc, Shrt_Desc, ComName, ManufacName)
  VALUES (
  (SELECT MAX(NDB_No) + 1 FROM SR28.FOOD_DES),
  '1800',
  'Gluten Free Dinner Biscuits',
  'DINNER BISCUITES, GF',
  'dinner biscuit, gf',
  'Recipe ID 36'
  );
  
SELECT NDB_No, Shrt_Desc
FROM SR28.FOOD_DES
WHERE NDB_No > '99000';
