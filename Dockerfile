# Використовуємо офіційний Python 3.10 як базовий образ
FROM python:3.10-slim

# Встановлюємо системні залежності (щоб будувались колеса для aiohttp, psycopg2 тощо)
RUN apt-get update && apt-get install -y \
    gcc \
    libffi-dev \
    libssl-dev \
    make \
    && rm -rf /var/lib/apt/lists/*

# Створюємо робочу директорію
WORKDIR /app

# Копіюємо файли requirements.txt
COPY requirements.txt .

# Встановлюємо залежності Python
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь проєкт у контейнер
COPY . .

# Вказуємо команду запуску
CMD ["python", "bot.py"]
