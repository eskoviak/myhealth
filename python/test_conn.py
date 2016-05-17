#!/usr/bin/python

import MySQLdb

db=MySQLdb.connect(
    host='104.196.12.164',
    user='root',
    passwd='MyG1rls&',
    db='myHealth')

cur=db.cursor()

cur.execute('SELECT * FROM Play')

for row in cur.fetchall():
    print(row[0], row[1]) 

db.close()
