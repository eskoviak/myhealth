"""
  File to test the writing of a weight to the Weight table.  Consists of a clientId,
  obsData and obsData, which is a CompoundValue

  Pass 1:  assume lbm and %
"""

import json

fp = open('weight.json', 'r')
ss = json.load(fp)
print(ss)
