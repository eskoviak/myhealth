#!/usr/bin/env python

# Read a white space delimited .dat file and write a csv file 

import sys
import string
import os

path = "/Users/eskoviak/Google Drive/Projects/myhealth/ars_data"
for file in os.listdir(path):
    #file = os.path.abspath(file)
    print(file)
    if os.path.lexists(path+file):
        #file = string.rstrip(file, "\n")
        print("Processing "+file+" ...")
        #path = os.path.dirname(file)
        #basename = os.path.basename(file)
        infile = open(path+file, "r")
        outfile = open(path+string.replace(file, ".dat", ".csv"), "w")
        for line in infile:
            outfile.write(outline)
        
        infile.close
        outfile.close
    else:
        print("Can't file input file")
        sys.exit()
        
