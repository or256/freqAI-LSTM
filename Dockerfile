FROM python:3.9-slim

WORKDIR /app

# התקנת תלות בסיס וגיט
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# התקנת TA-Lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz \
    && tar -xzf ta-lib-0.4.0-src.tar.gz \
    && cd ta-lib/ \
    && ./configure --prefix=/usr \
    && make \
    && make install \
    && cd .. \
    && rm -rf ta-lib ta-lib-0.4.0-src.tar.gz

# העתקת קבצי הפרויקט
COPY . .

# התקנת ספריות פייתון
RUN pip install --upgrade pip setuptools wheel && \
    pip install -r requirements.txt
