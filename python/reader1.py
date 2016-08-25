#!/usr/bin/env python
"""
  Script to read a tab delimited file from the Harvard
  Health.

  File Format:
  <string describing activity>/t<125#>\t<155#>\t<185>\n

  The string in field one can contain the comma character
"""
import json

# create empty dictionary
harvard = {}

def getCal(inTuple, weight, time):
  rise=inTuple[2]-inTuple[0]
  run=60
  slope=float(rise)/float(run)
  y0=float(inTuple[0])-slope*125.0
  return (slope*weight+y0)*(time/30)

def loadDictionary(infile):
  # TODO test for existence of infile
  

#print(line.split('\t'))
for line in open('../harvard.csv', 'r'):
  parts = line.split('\t')
  #slope = (float(parts[3])-float(parts[1]))/60.0
  #y0 = float(parts[1]) - (slope * 125.0)
  harvard[parts[0]]=(int(parts[1]),int(parts[2]),int(parts[3]))

print(json.dumps(harvard))
print( getCal((100,150,200),155,30))
