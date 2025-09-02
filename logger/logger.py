import time
from flask import Flask, request

app = Flask(__name__)

@app.route("/log", methods=["POST"])
def log():
    data = request.json
    with open("logs.txt", "a") as f:
        f.write(str(data) + "\n")
    return {"status": "logged"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=6000, debug=True)

