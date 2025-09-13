# Base image
FROM python:3.12.5

# Install system dependencies (Poppler for pdf2image)
RUN apt-get update && apt-get install -y \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# Working directory
WORKDIR /2NDATS

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Copy all project files
COPY . .

# Make start.sh executable
RUN ["chmod", "+x", "start.sh"]


# Disable Streamlit telemetry (optional)
ENV STREAMLIT_BROWSER_GATHERUSAGESTATS=false

# Expose ports: Flask(8000), Streamlit(8501)
EXPOSE 8000 
EXPOSE 8501

# Run both Flask + Streamlit
CMD ["./start.sh"]
