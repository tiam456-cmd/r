# Use official Python 3.10 slim image
FROM python:3.10-slim

# Install system dependencies including xvfb and required libs for pyautogui, opencv, pillow etc.
RUN apt-get update && apt-get install -y \
    xvfb \
    libgl1-mesa-glx \
    libgtk-3-0 \
    libx11-xcb1 \
    libxrender1 \
    libxtst6 \
    build-essential \
    python3-dev \
    libevdev-dev \
    libudev-dev

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy and make start.sh executable
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Expose port 8000 for FastAPI
EXPOSE 8000

# Run start.sh to launch xvfb and uvicorn
CMD ["bash", "/app/start.sh"]
