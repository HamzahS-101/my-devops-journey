import os
from flask import Flask
import redis

app = Flask(__name__)

r_host = os.getenv('REDIS_HOST', 'redis-db')
r_port = int(os.getenv('REDIS_PORT', 6379))

r = redis.Redis(host=r_host, port=r_port)

@app.route("/")
def welcome_message():
    count = r.incr("total_visitors")
    return "Hello and Welcome to Hamzah's Flask App"

@app.route("/count")
def count():
    total = r.get("total_visitors")
    return f'Total Visitors: {int(total)}'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5002)