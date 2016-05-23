#!/usr/bin/python

# File to read the first file given on the command line and convert:
# '^' to tab character and
# '~' to '"' character
# writing output to the second file

import sys
import string
import os

path = "/Users/eskoviak/Google Drive/Buckets/argo/ARS Data/"
for file in os.listdir(path):
    #file = os.path.abspath(file)
    print(file)
    if os.path.lexists(path+file):
        #file = string.rstrip(file, "\n")
        print("Processing "+file+" ...")
        #path = os.path.dirname(file)
        #basename = os.path.basename(file)
        infile = open(path+file, "r")
        outfile = open(path+string.replace(file, ".txt", ".csv"), "w")
        for line in infile:
            outline = string.replace(line, "~", "\"")
            outline = string.replace(outline, "^", ",")
            outfile.write(outline)
        
        infile.close
        outfile.close
    else:
        print("Can't file input file")
        sys.exit()
        
