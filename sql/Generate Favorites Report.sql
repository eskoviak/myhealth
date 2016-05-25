SELECT DISTINCT fg.FdGrp_Desc, fd.NDB_No, fd.Long_Desc 
FROM Health.DailyDetail dd, SR28.FOOD_DES fd, SR28.FD_GROUP fg
WHERE dd.NDB_No = fd.NDB_no
  AND fd.FdGrp_Cd = fg.FdGrp_Cd
UNION
SELECT DISTINCT fg.FdGrp_Desc, fd.NDB_No, rd.Long_Desc
FROM Health.RecipeDetail rd, SR28.FOOD_DES fd, SR28.FD_GROUP fg
WHERE fd.NDB_No = rd.NDB_no
  AND fd.FdGrp_Cd = fg.FdGrp_Cd
ORDER BY fd.NDB_No