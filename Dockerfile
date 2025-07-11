FROM python:3.9-slim

WORKDIR /app
RUN apt update && apt install -y unzip && rm -rf /var/lib/apt/lists/*
COPY . .
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --no-root

EXPOSE 8080
CMD ["poetry", "run", "python3", "bot.py"]
