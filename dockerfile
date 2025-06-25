FROM python:3.10-slim

# התקנת תלויות בסיס
WORKDIR /app
COPY . /app

RUN pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-ansi

CMD ["freqtrade", "trade", "--config", "config-example.json", "--strategy", "ExampleLSTMStrategy"]
