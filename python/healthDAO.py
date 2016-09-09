import MySQLdb
import sys
import string

def getConn():
    db=MySQLdb.connect(
        host='104.196.12.164',
        user='root',
        passwd='Y0uKn0w3',
        db='myHealth')
    return db

