from flask import Flask, jsonify, request
import psycopg2
import os

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST", "db")
DB_NAME = os.getenv("DB_NAME", "appdb")
DB_USER = os.getenv("DB_USER", "appuser")
DB_PASS = os.getenv("DB_PASS", "apppass")

def get_db_connection():
    conn = psycopg2.connect(host=DB_HOST, database=DB_NAME, user=DB_USER, password=DB_PASS)
    return conn

@app.route("/api/data")
def get_data():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT message FROM messages LIMIT 5;")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify([row[0] for row in rows])

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
