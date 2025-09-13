import os
from flask import Flask, send_from_directory

app = Flask(__name__)

BASE_DIR = os.getcwd()

@app.route("/")
def home():
    return send_from_directory(BASE_DIR, "home.html")

@app.route("/favicon.ico")
def favicon():
    return send_from_directory(BASE_DIR, "favicon.ico")

if __name__ == "__main__":
    # Host 0.0.0.0 for Docker
    app.run(host="0.0.0.0", port=8000)