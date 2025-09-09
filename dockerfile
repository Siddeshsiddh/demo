# # Use official Python base image
# FROM python:3.10-slim

# # Set working directory inside container
# WORKDIR /app

# # Copy all files into the container
# # COPY app.py .
# # COPY requirements.txt .
# COPY . .

# # Install dependencies
# RUN pip install --no-cache-dir -r requirements.txt

# # Expose port 5000
# EXPOSE 5000

# # Run Flask app
# CMD ["python", "app.py"]



# # ---------- BUILDER STAGE ----------
# FROM python:3.10-slim AS builder
# WORKDIR /app

# # Only copy requirements to speed up caching
# # COPY  app.py .
# # COPY requirements.txt .
# COPY . .
# RUN pip install --user --no-cache-dir -r requirements.txt

# # ---------- RUNTIME STAGE ----------
# FROM python:3.10-slim AS runtime
# WORKDIR /app

# # Copy your local app.py directly
# COPY . .

# # Copy dependencies from builder
# COPY --from=builder /app/app.py /app/app.py

# CMD ["python", "app.py"]



# ---- Builder Stage ----
FROM python:3.9-slim AS builder
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Only copy your actual code, NOT the big files!
COPY app.py .

# ---- Runtime Stage ----
FROM python:3.9-slim
WORKDIR /app

COPY --from=builder /install /usr/local
COPY --from=builder /app/app.py .

CMD ["python", "app.py"]
