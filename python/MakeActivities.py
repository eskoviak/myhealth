# -*- coding: utf-8 -*-
"""
  Module MakeActivities:  loads INFILE converts to JSON and writes to OUTFILE
"""
import json

INFILE = './harvards.csv'
OUTFILE = './activities.json'


parts = lambda line: line.split('\t')

if __name__ == '__main__':
    try:
        for line in open(INFILE, 'r'):
            """Compute formula for the line from data in csv file

            slope (float):  kcal/min
            y-intercept (float): kcal

            """
            slope = (float(parts(line)[3]) - float(parts(line)[1]))/30.0
            y_intercept = float(parts(line)[1])/30.0 - slope * 125.0

            print '{ \"' + parts(line)[0] + '\" : { \"line\" : ',
            print '{ \"slope\" : ' + str(slope) + ', \"y_intercept\" :',
            print str(y_intercept) + '} }'

    except Exception as identifier:
        print 'Exception:  ' + identifier
