import MySQLdb
import sys
import string
import json

db=MySQLdb.connect(
    host='104.196.12.164',
    user='root',
    passwd='Y0uKn0w3',
    db='myHealth')

cur=db.cursor()

cur.execute("""SELECT clientId FROM Clients WHERE lastName = %s""", ('Skoviak', ))

clientId = cur.fetchone()[0]

print(clientId)
print(today())
db.close()
