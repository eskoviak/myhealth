#!/usr/bin/env python
"""
  program used to test other routines
"""

import HealthCalc

# lambda functions:
activity = lambda key: HealthCalc.get_activity(key)
calories = lambda activity, weight, time: HealthCalc.get_calories(activity, weight, time)

if __name__ == "__main__":
    weight = float(input('Enter Weight (lbm): '))
    time = float(input('Enter time (min): '))
    query = raw_input('Enter search phrase: ')
    activities = HealthCalc.get_activity(query)
    numItems = len(activities)
    if numItems == 0:
        print 'No item Not Found'
        exit()
    if numItems == 1:
        print 'Process the item ' + activities[0]
        print()
        exit()
    if numItems > 0:
        counter = 1
        for a in activities:
            print str(counter) + ': ' + a
            counter += 1
        choice = int(input('Enter number of your choice: '))
        if choice > 0 and choice <= counter:
            print 'Proces the item: ' + activities[choice - 1]
            print 'For ' + str(time) + ' min @ ' + str(weight) + ' lbm'
            print '-----------------------------------------'
            print str(calories(activities[choice - 1], weight, time)) + ' kcal'
        else:
            print 'Bad choice'
