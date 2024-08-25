# Use a Python base image (Debian-based)
FROM python:3.11-slim

# Install system dependencies for building SciPy
RUN apt-get update && apt-get install -y \
    build-essential \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/scipy

# Install Python build dependencies
RUN pip install --upgrade pip setuptools wheel

# Install development dependencies for SciPy
RUN pip install cython pybind11 pythran meson

# Default command to keep the container running in interactive mode
CMD ["bash"]
