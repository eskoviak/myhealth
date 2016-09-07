"""
  File to test the writing of a weight to the Weight table.  Consists of a clientId,
  obsData and obsData, which is a CompoundValue

  Pass 1:  assume lbm and %
"""

import json

"""
w = input('Enter weight (lbm): ')
bf = input('Enter body fat (%): ')

s = '{"obsData" : {"weight" : {"weight" : w, "units": "lbm"}, "bodyFat" : {"bodyFat" : bf, "units" : "%"}}}'
ss = json.loads(s)
"""

fp = open('weight.json', 'r')
ss = json.load(fp)
print(ss)
