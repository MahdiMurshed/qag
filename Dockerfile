FROM python:3.7-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN apt-get update \
    && apt-get install -y build-essential \
    && pip install -r requirements.txt \
    && pip install numpy

COPY . .

CMD ["sh", "-c", "export CLASSPATH=/app/qag/lib/stanford-parser.jar && gunicorn qag:app"]


