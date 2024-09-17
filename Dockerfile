FROM python:3.9-slim-buster
# Test Semantic Realease On this
WORKDIR /app

COPY . .

CMD ["python3", "app.py"]