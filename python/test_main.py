#!/usr/bin/env python3
"""
  program used to test other routines
"""

from healthCalc import getActivity

#print(getActivity('walking'))
activities = getActivity('walking')
if activities.__len__ > 0:
  for a in activities:
    print(a)