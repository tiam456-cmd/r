#!/bin/bash

# Start Xvfb on display :99 in the background
Xvfb :99 -screen 0 1024x768x24 &

# Export DISPLAY so GUI apps use the virtual display
export DISPLAY=:99

# Run your FastAPI app with uvicorn
exec uvicorn main:app --host 0.0.0.0 --port 8000
