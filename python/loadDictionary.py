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

def loadDictionary(infile, dict):
  # TODO test for existence of infile
  for line in open(infile, 'r'):
    parts = line.split('\t')
    dict[parts[0]]=(int(parts[1]),int(parts[2]),int(parts[3]))

#### MAIN #####
loadDictionary('harvard.csv', harvard)
#print(json.dumps(harvard))
#print( getCal((100,150,200),155,30))
#print(harvard.keys())
search = input('Enter the search phrase: ')
for key in harvard.keys():
    if (search.upper() in key.upper()):
      print(key)
