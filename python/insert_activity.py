#!/usr/bin/env python

import healthDAO
import json

# Get the activty from the user
activity = raw_input('Enter the activtiy: ')

con = healthDAO.getConn()
cur = con.cursor()

cur.execute('SELECT actId, actDescription FROM ActTypes WHERE MATCH(actDescription) AGAINST(\'{0}\')'.format(activity))

results = cur.fetchall()

if len(results) > 0:
  print('Code'+'\t'+'Activity')
  print('===='+'\t'+'==================')
  for result in results:
    print(result[0]+'\t'+result[1])
  print('\n'+'Enter Code: ')
  code = input()
  
  cur.execute('SELECT ActData FROM ActTypes WHERE ActId = {0}'.format(code))
  data = cur.fetchone()
  j = json.loads(data)
  print(j.m)
  exit(0)
  d = dict(data[0])
  print (d)
else:
  print('Nothing found ...')

cur.close()
con.close()
