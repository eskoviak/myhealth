#!/usr/bin/env python3
"""
  Script to read a tab delimited file and create a 
  JSON file via a Python dictionary

  Harvard File Format:
  <string describing activity>/t<125#>\t<155#>\t<185>\n

  The string in field one can contain the comma character
"""
import json

# create empty dictionary
harvard = {}

def loadDictionary(infile, dict):
  # TODO test for existence of infile
  for line in open(infile, 'r'):
    parts = line.split('\t')
    dict[parts[0]]=(int(parts[1]),int(parts[2]),int(parts[3]))

#### MAIN #####
loadDictionary('harvard.csv', harvard)
fp = open('harvard.json', 'w')
json.dump(harvard, fp)
fp.close()