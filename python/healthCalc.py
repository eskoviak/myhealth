"""
  Module healthCalc
"""
import json

def getCalories(inTuple, weight, time):
  rise=inTuple[2]-inTuple[0]
  run=60
  slope=float(rise)/float(run)
  y0=float(inTuple[0])-slope*125.0
  return (slope*weight+y0)*(time/30)

def getActivity(inQuery):
  # load the dictionary
  # return array of keys which match (case insensitive) the inQuery string
  activities = []
  fp = open('harvard.json', 'r')
  harvard = json.load(fp)
  for key in harvard.keys():
      if inQuery.upper() in key.upper():
          activities.append(key)
  return activities

def getActivityData(activityKey):
  # load the dictionary
  fp = open('harvard.json', 'r')
  harvard = json.load(fp)
  return harvard[activityKey]

def toKg(inweight):
  return inweight/2.204

