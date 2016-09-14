import MySQLdb
import sys
import string
import json
import time
import healthDAO

#
# Get data from user
#
w = input('Enter weight in lbm: ')
bf = input('Enter body fat in percent: ')
print('Lean Body Mass: '+str(float(w * (1.0 - (bf/100.0)))))
#
# Force user to format
# TODO Fix this in final version
#
obsDate = str(input('Enter date of obs: '))
dw = {'value': w, 'units' : 'lbm'}
dbf = {'value': bf, 'units' : '%'}
dd = {'weight' : dw, 'bodyFat' : dbf } 

#
# Get client ID
#
db=healthDAO.getConn()
cur=db.cursor()
cur.execute(str('SELECT clientId FROM Clients WHERE lastName = \'{0}\';').format('Skoviak'))
clientId = cur.fetchone()[0]


cur.execute(str("INSERT INTO Observations VALUES (\'{0}\', \'{1}\', 1,  \"{2}\");").format(clientId,obsDate, dd))
db.commit()
db.close()
