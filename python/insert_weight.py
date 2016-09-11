import MySQLdb
import sys
import string
import json
import time
import healthDAO

# Get data from user
w = input('Enter weight in lbm: ')
bf = input('Enter body fat in percent: ')
obsDate = str(input('Enter date of obs: '))
dw = {'value': w, 'units' : 'lbm'}
dbf = {'value': bf, 'units' : '%'}
dd = {'weight' : dw, 'bodyFat' : dbf } 

db=healthDAO.getConn()

cur=db.cursor()

cur.execute(str('SELECT clientId FROM Clients WHERE lastName = \'{0}\';').format('Skoviak'))

clientId = cur.fetchone()[0]

cur.execute(str("INSERT INTO Observations VALUES (\'{0}\', \'{1}\', 1,  \"{2}\");").format(clientId,obsDate, dd))
db.commit()
db.close()
