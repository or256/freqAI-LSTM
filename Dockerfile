FROM python:3.9-slim

WORKDIR /app

# התקנת כלים לבנייה וספריות בסיס (כולל TA-Lib)
RUN apt-get update && apt-get upgrade -y && apt-get clean

RUN apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    libtool \
    autoconf \
    automake \
    libffi-dev \
    libssl-dev \
    libzmq3-dev \
    pkg-config \
    libta-lib0 \
    libta-lib0-dev

# התקנת TA-Lib מקוד מקור
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
    tar -xvzf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd .. && \
    rm -rf ta-lib ta-lib-0.4.0-src.tar.gz

ENV LD_LIBRARY_PATH=/usr/lib

# העתקת קבצי הפרויקט
COPY . .

# התקנת דרישות
RUN pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt
