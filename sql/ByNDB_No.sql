--This query gets food data by NDB_No
SELECT fd.NDB_No, Shrt_Desc, nrd.NutrDesc, nd.Nutr_No, nd.Nutr_Val
FROM FOOD_DES fd,NUT_DATA nd, NUTR_DEF nrd
WHERE fd.NDB_No = '07019'
  AND nd.NDB_No = fd.NDB_No
  AND nrd.Nutr_No = nd.Nutr_No
  AND nd.Nutr_No in ('307', '208', '306', '203', '205', '204', '601');