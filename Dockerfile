# Базовий образ
FROM python:3.10-slim

# Встановлюємо системні залежності
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Робоча директорія
WORKDIR /app

# Копіюємо файли
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Запуск через Procfile (можна замінити на python bot.py)
CMD ["python", "bot.py"]
