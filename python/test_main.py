#!/usr/bin/env python
"""
  program used to test other routines
"""

from healthCalc import getActivity, getActivityData

inActivity = input('Enter search phrase: ')
activities = getActivity(inActivity)
numItems = len(activities)
if numItems == 0:
  print('No item Not Found')
  exit()
if numItems == 1:
  print('Process the item ' + activities[0])
  print(getActivityData(activities[0]))
  exit()
if numItems > 0:
  counter = 1
  for a in activities:
    print(str(counter) + ': ' + a)
    counter += 1
  choice = int(input('Enter number of your choice: '))
  if choice > 0 and choice <= counter:
    print('Proces the item: ' + activities[choice - 1])
    print(getActivityData(activities[choice - 1]))
  else:
    print('Bad choice')
  exit()
