FROM mcr.microsoft.com/vscode/devcontainers/python:3.13

# Instalar dependencias para MongoDB
RUN apt-get update && apt-get install -y gnupg curl \
    && curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-server-7.0.gpg \
    && echo "deb [ arch=amd64,arm64 signed-by=/etc/apt/trusted.gpg.d/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list \
    && apt-get update \
    && apt-get install -y mongodb-org

# Crear carpeta de datos y dar permisos al usuario vscode (el que usa el devcontainer)
RUN mkdir -p /data/db && chown -R vscode:vscode /data/db

# [Opcional] Instalar dependencias de Python aquí para ir más rápido
COPY ../src/requirements.txt /tmp/pip-tmp/
RUN pip3 install --no-cache-dir -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp