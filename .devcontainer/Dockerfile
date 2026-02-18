FROM ubuntu:24.04

# Install Python 3.13 and MongoDB
RUN apt-get update && apt-get install -y \
    python3.13 \
    python3.13-venv \
    python3.13-dev \
    python3-pip \
    curl \
    gnupg \
    lsb-release \
    ca-certificates \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set python3.13 as default python3
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.13 1

# Install MongoDB
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-8.0.gpg && \
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-8.0.list && \
    apt-get update && apt-get install -y \
    mongodb-org \
    && rm -rf /var/lib/apt/lists/*

# Create mongodb directories
RUN mkdir -p /data/db && chmod -R 777 /data/db

# Install Node.js (for devcontainer CLI)
RUN apt-get update && apt-get install -y nodejs npm && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace
