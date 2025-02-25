FROM python:3.12-slim

WORKDIR /app

COPY . /app

RUN pip install flask redis

EXPOSE 5002

CMD ["python", "flask-app.py"]

