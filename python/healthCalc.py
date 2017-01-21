# -*- coding: utf-8 -*-
"""
  Module HealthCalc.  This module contains utility routines used for various health calculations.
"""
import json

def get_calories(in_tuple, weight, time):
    """Function get_calories.  Given input tuple of data from the actiity dictionary and the
    specified weight and time, return the calculated calories.

    Args:
        in_tuple (list):  a tuple in the form of (N1, N2, N3), where N1 is the calories expended
        at 135 lbm, N2 @ 155 lbm and N3 @ 175 lbm, per 30 minutes for the given activity.abs
        weight (float): the weight, in lbm.
        time (flost): the time, in minutes

    Returns:
        float:  the caluculated calories
    """
    rise = float(in_tuple[2]) - float(in_tuple[0])
    run = 60
    slope = float(rise)/float(run)
    y_0 = float(in_tuple[0])-slope*125.0
    return (slope*weight+y_0)*(time/30)

def get_activity(query):
    """Function getActivity.  Load the dictionary and search for item descriptions that match
    the query.

    Args:
        query (str): the query phrase to search for

    Returns:
        list: A list of keys in the dictionary which whose description matches the inQuery.

    """
    activities = []
    for key in json.load(open('activities.json', 'r')).keys():
        if query.upper() in key.upper():
            activities.append(key)
    return activities

def get_activity_data(activity_key):
    """Function get_activity_data.  Returns the tuple associated with the key.

    Args:
        activity_key (str):  The key for the desired activity_key

    Returns:
        a tuple of the form (N1, N2, N3), where N1 is the calories for 135 lbm, N2 @ 155 lbm
        and N3 @ 175 lbm, over a 30 minute period.

    """
    harvard = json.load(open('harvard.json', 'r'))
    return harvard[activity_key]

#def toKg(inweight):
#  return inweight/2.204
