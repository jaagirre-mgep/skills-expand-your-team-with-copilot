FROM mcr.microsoft.com/vscode/devcontainers/python:3.13

# Instalar dependencias para MongoDB 7.0
RUN apt-get update && apt-get install -y gnupg curl \
    && curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-server-7.0.gpg \
    && echo "deb [ arch=amd64,arm64 signed-by=/etc/apt/trusted.gpg.d/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list \
    && apt-get update \
    && apt-get install -y mongodb-org

# Crear carpetas de datos y logs con permisos para el usuario vscode
RUN mkdir -p /data/db /var/log/mongodb && chown -R vscode:vscode /data/db /var/log/mongodb