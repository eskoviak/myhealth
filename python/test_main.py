#!/usr/bin/env python
"""
  program used to test other routines
"""

import healthCalc

weight = float(input('Enter Weight (lbm): '))
time = float(input('Enter time (min): '))
inActivity = raw_input('Enter search phrase: ')
activities = healthCalc.getActivity(inActivity)
numItems = len(activities)
if numItems == 0:
  print('No item Not Found')
  exit()
if numItems == 1:
  print('Process the item ' + activities[0])
  print(healthCalc.getCalories(healthCalc.getActivityData(activities[0]), weight, time))
  exit()
if numItems > 0:
  counter = 1
  for a in activities:
    print(str(counter) + ': ' + a)
    counter += 1
  choice = int(input('Enter number of your choice: '))
  if choice > 0 and choice <= counter:
    print('Proces the item: ' + activities[choice - 1])
    print(healthCalc.getCalories(healthCalc.getActivityData(activities[choice - 1]), weight, time))
  else:
    print('Bad choice')
  exit()
