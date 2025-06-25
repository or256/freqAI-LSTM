FROM python:3.10-slim

WORKDIR /app
COPY . .

# התקנת תלויות ידנית
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

CMD ["freqtrade", "trade", "--config", "config-example.json", "--strategy", "ExampleLSTMStrategy"]
