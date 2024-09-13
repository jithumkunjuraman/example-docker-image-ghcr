FROM python:3.9-slim-buster
# Test
WORKDIR /app

COPY . .

CMD ["python3", "app.py"]