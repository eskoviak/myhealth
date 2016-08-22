#!/usr/bin/env python
"""
  Script to read a tab delimited file from the Harvard
  Health.

  File Format:
  <string describing activity>/t<125#>\t<155#>\t<185>\n

  The string in field one can contain the comma character
"""
# create empty dictionary
harvard = {}

# for testing:
line = 'Hot, steamy yoga\t100\t150\t200'

#print(line.split('\t'))
parts = line.split('\t')
slope = (float(parts[3])-float(parts[1]))/60.0
y0 = float(parts[1]) - (slope * 125.0)
harvard[parts[0]]=((int(parts[1]),int(parts[2]),int(parts[3])),(slope,y0))

print(harvard)
