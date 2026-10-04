FROM python:3.10-slim

# Ngăn Python ghi file .pyc và bật log trực tiếp ra console
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Đặt thư mục làm việc
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy toàn bộ code vào container
COPY . /app/

# Chạy server Django mặc định (docker-compose sẽ ghi đè CMD này)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]