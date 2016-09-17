import healthDAO
import json

# create empty dictionary
harvard = {}

def loadDictionary(infile, dict):
  # TODO test for existence of infile
  for line in open(infile, 'r'):
    parts = line.split('\t')
    dict[parts[0]]=(int(parts[1]),int(parts[2]),int(parts[3]))

#### MAIN #####
con = healthDAO.getConn()
cur = con.cursor()

loadDictionary('harvard.csv', harvard)
i = 1
for key in harvard.keys():
  data = harvard.get(key)
  slope = (float(data[2]-data[0])/60.0)/30.0
  y0 = (data[0]/30)-(slope * 125)
#  j = '{"line":{"m":{0},"y0":{1}}}'.format(slope, y0)
  cur.execute(str('INSERT INTO ActTypes VALUES( {0}, "{1}", "{2}" )').format(i, key, json.dumps({'line':{'m':slope,'y0':y0}})))
  i += 1

con.commit()

cur.close()
con.close()  
