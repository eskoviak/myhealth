SELECT fd.Shrt_Desc, ndef.NutrDesc, nd.Nutr_Val
FROM FOOD_DES fd, NUT_DATA nd, NUTR_DEF ndef
WHERE fd.NDB_no = '99002'
  AND nd.NDB_No = fd.NDB_No
  AND ndef.Nutr_No= nd.Nutr_No
  AND nd.Nutr_No IN ('208', '307', '306', '203', '205', '204', '601');