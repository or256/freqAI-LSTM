FROM python:3.10-slim

# עדכון חבילות בסיסיות
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
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
  libta-lib0-dev \
  && rm -rf /var/lib/apt/lists/*

# התקנת pip עדכני
RUN pip install --upgrade pip setuptools wheel

# העתקת קבצי הפרויקט
WORKDIR /app
COPY . .

# התקנת תלויות הפרויקט
RUN pip install -r requirements.txt

# פקודת ברירת מחדל להרצה (שנה לפי הצורך שלך)
CMD ["python", "main.py"]
