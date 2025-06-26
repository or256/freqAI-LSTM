FROM python:3.10-slim

RUN apt-get update --allow-releaseinfo-change && apt-get upgrade -y \
  && apt-get install -y \
      build-essential git wget curl \
      libtool autoconf automake \
      libffi-dev libssl-dev libzmq3-dev pkg-config \
      libta-lib0 libta-lib0-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools wheel

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "main.py"]
