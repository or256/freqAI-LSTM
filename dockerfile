FROM python:3.10-slim

# התקנת git וכלי בסיס
RUN apt-get update && apt-get install -y git

WORKDIR /app
COPY . .

# התקנת pip וחבילות
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

CMD ["freqtrade", "trade", "--config", "config-example.json", "--strategy", "ExampleLSTMStrategy"]
