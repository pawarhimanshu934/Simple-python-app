FROM python:3.11-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir flask

EXPOSE 2000

CMD ["python3", "app.py"]
