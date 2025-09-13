#!/bin/bash


# Start Flask app with Gunicorn (production server) in background
gunicorn --bind 0.0.0.0:8000 server:app &# Run Flask server in background


# Run Streamlit app
streamlit run main.py --server.port 8501 --server.address 0.0.0.0 --server.headless true
