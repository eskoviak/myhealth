#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
  Module MakeActivities:  loads INFILE converts to JSON and writes to OUTFILE
"""
import json

INFILE = './harvard.csv'
OUTFILE = './activities.json'


parts = lambda line: line.split('\t')

if __name__ == '__main__':
    try:
        FP = open(OUTFILE, 'w')
        FP.write('{ \"activities\" : [')
        for line in open(INFILE, 'r'):
            """Compute formula for the line from data in csv file

            slope (float):  kcal/min
            y-intercept (float): kcal

            """
            slope = (float(parts(line)[3]) - float(parts(line)[1]))/30.0
            y_intercept = float(parts(line)[1])/30.0 - slope * 125.0

            FP.write('{ \"' + parts(line)[0] + '\" : { \"line\" : { \"slope\" : ' + str(slope) + ', \"y_intercept\" :' + str(y_intercept) + '} }')

        FP.write(']')
        FP.close()

    except Exception as e:
        print 'Exception:  ' + e.strerror
