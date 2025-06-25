# 1. בסיס: גרסת פייתון יציבה
FROM python:3.10

# 2. תיקיית העבודה בתוך הקונטיינר
WORKDIR /app

# 3. העתקת דרישות התקנה (requirements)
COPY requirements.txt .

# 4. התקנת חבילות נדרשות
RUN pip install --upgrade pip \
 && pip install -r requirements.txt

# 5. העתקת שאר קבצי הקוד
COPY . .

# 6. הפקודה שמריצה את הקוד
CMD ["python", "ExampleLSTMStrategy.py"]
