FROM python:3.10-slim

# Ngăn Python ghi file .pyc và bật log trực tiếp ra console
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Đặt thư mục làm việc
WORKDIR /app

# Copy toàn bộ code vào container
COPY . /app/

# # Chuyển thư mục làm việc vào nơi chứa manage.py
# WORKDIR /app/myproject

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# COPY myproject/ .

# Chạy server Django
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]