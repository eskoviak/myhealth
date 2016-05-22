#!/usr/bin/python

# File to read the first file given on the command line and convert:
# '^' to tab character and
# '~' to '"' character
# writing output to the second file

import sys
import string
import os.path

filelist = open("FILELIST", "r")

for file in filelist:
    file = string.rstrip(file, "\n")
    print("Processing "+file+" ...")
    path = os.path.dirname(file)
    basename = os.path.basename(file)
    infile = open(file, "r")
    outfile = open(path+"/"+string.replace(basename, ".txt", ".csv"), "w")
    for line in infile:
	outline = string.replace(line, "~", "\"")
        outline = string.replace(outline, "^", ",")
	outfile.write(outline)

infile.close
outfile.close
