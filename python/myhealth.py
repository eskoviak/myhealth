# MyHealth server
# V 0.2
# Designed for python3
#

from flask import Flask, render_template
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World from Flask"

@app.route("/myhealth")
def myhealth():
    return render_template('myhealth.html')

if __name__ == "__main__":
    app.run()
