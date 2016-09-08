import MySQLdb
import sys
import string
import json
import time

db=MySQLdb.connect(
    host='104.196.12.164',
    user='root',
    passwd='Y0uKn0w3',
    db='myHealth')

cur=db.cursor()

cur.execute("""SELECT clientId FROM Clients WHERE lastName = %s""", ('Skoviak', ))

clientId = cur.fetchone()[0]
currTime = '2016-09-08 12:00:00'

fp = open('weight.json', 'r')
data = json.load(fp)

cur.execute(str("INSERT INTO Weight VALUES (\'{0}\', \'{1}\', \"{2}\");").format(clientId, currTime, data))
#print(str("INSERT INTO Weight VALUES (\'{0}\', \'{1}\', \"{2}\");").format(clientId, currTime, data))
db.commit()
fp.close()
db.close()
