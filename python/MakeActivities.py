# -*- coding: utf-8 -*-
"""
  Module MakeActivities:  loads INFILE converts to JSON and writes to OUTFILE
"""
import json

INFILE = './harvard.csv'
OUTFILE = './activities.json'

def load_dictionary(data_file):
    """ Function load_dictionary

    Arg:
        data-file (file):  the csv file containing the input data in the form:
        Item,N1,N2,N3
        Where Item is the textual description of the item
    Returns:
        dict:
    """

    data_dict = dict()
    for line in open(data_file, 'r'):
        parts = line.split('\t')
        data_dict[parts[0]] = (int(parts[1]), int(parts[2]), int(parts[3]))
    return data_dict

parts = lambda line: line.split('\t')

if __name__ == '__main__':
    try:
        for line in open(INFILE, 'r'):
            slope = (float(parts(line)[3]) - float(parts(line)[1]))

        for entry in load_dictionary('harvard.csv'):
            data = harvard.get(key)
            slope = (float(data[2]-data[0])/60.0)/30.0
            y0 = (data[0]/30)-(slope * 125)
            fp.write(json.dumps({'line':{'m':slope,'y0':y0}}))
            i += 1

        FP.close()
    except expression as identifier:
        pass
