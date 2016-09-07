import json

fp = open('../API/samples/weight.json', 'r')
adict = json.load(fp)

print(adict)
