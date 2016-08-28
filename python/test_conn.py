#!/usr/bin/env python

import MySQLdb
import sys
import string

db=MySQLdb.connect(
    host='104.196.12.164',
    user='root',
    passwd='Y0uKn0w3',
    db='myHealth')

cur=db.cursor()
searchPredicate = 'SELECT NDB_No, Long_Desc FROM FOOD_DES WHERE MATCH(Long_Desc) AGAINST ("?")'

if len(sys.argv) > 1:
    searchPredicate=string.replace(searchPredicate, "?", sys.argv[1])
    print(searchPredicate)
else:
    print("No search term specified")
    sys.exit()
	
cur.execute(searchPredicate)

print('NDB_No', 'Long Description')
for row in cur.fetchall():
    print(row[0], row[1]) 

db.close()
