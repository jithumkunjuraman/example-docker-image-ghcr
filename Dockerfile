FROM python:3.9-slim-buster
# Test Semantic Realease Sample Aplication for demo
WORKDIR /app

COPY . .

CMD ["python3", "app.py"]