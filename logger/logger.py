import time, json
from flask import Flask, request

app = Flask(__name__)

@app.route("/log", methods=["POST"])
def log():
    data = request.json
    entry = {
        "timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
        "log": data
    }
    with open("/shared/logs.txt", "a") as f:   # <-- write to volume
        f.write(json.dumps(entry) + "\n")
    return {"status": "logged"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=6000, debug=True)

