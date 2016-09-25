import os
import json

# create path if it doesn't exsit
path = 'Activities'
if not os.path.exists(path):
  os.mkdir(path)

basefilename = 'activity-{:03}'
count = 1

# create empty dictionary
harvard = {}

def loadDictionary(infile, dict):
  # TODO test for existence of infile
  for line in open(infile, 'r'):
    parts = line.split('\t')
    dict[parts[0]]=(int(parts[1]),int(parts[2]),int(parts[3]))

#### MAIN #####

loadDictionary('harvard.csv', harvard)
for key in harvard.keys():
  data = harvard.get(key)
  slope = (float(data[2]-data[0])/60.0)/30.0
  y0 = (data[0]/30)-(slope * 125)
  fp = open(path+'/'+basefilename.format(count), 'w')
  fp.write(json.dumps({ key : {'line':{'m':slope,'y0':y0}}}))
  count += 1
  fp.close()
