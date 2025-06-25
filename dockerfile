# 1. בסיס: גרסת פייתון יציבה

FROM python:3.10-slim

# 2. הגדרת משתני סביבה

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# 3. תיקיית העבודה בתוך הקונטיינר

WORKDIR /app

# 4. התקנת כלי מערכת נדרשים (אם צריך)

RUN apt-get update && apt-get install -y   
gcc   
&& rm -rf /var/lib/apt/lists/*

# 5. העתקת דרישות התקנה (requirements)

COPY requirements.txt .

# 6. התקנת חבילות נדרשות עם debugging

RUN pip install –upgrade pip –no-cache-dir &&   
pip install –no-cache-dir –verbose -r requirements.txt

# 7. העתקת שאר קבצי הקוד

COPY . .

# 8. הפקודה שמריצה את הקוד

CMD [“python”, “ExampleLSTMStrategy.py”]
