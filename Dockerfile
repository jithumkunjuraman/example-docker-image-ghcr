FROM python:3.9-slim-buster
# Test Semantic Realease
WORKDIR /app

COPY . .

CMD ["python3", "app.py"]