#!/usr/bin/python

import MySQLdb
import os

db=MySQLdb.connect(
    host='104.196.12.164',
    user='root',
    passwd='MyG1rls&',
    db='myHealth')

cur=db.cursor()

#cur.execute('SELECT * FROM Play')
cur.execute('SELECT * FROM FOOD_DES WHERE MATCH(Long_Desc) AGAINST(os.argv[1])')

print('NDB_No', 'Long Description')
for row in cur.fetchall():
    print(row[0], row[1]) 

db.close()
