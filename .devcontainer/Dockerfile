FROM python:3.11-bullseye

# Evitar errores de frontend
ENV DEBIAN_FRONTEND=noninteractive

# 1. Instalar herramientas base
RUN apt-get update && apt-get install -y curl gnupg sudo

# 2. Instalar MongoDB 7.0 (Configuración blindada contra errores de firma)
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-archive-keyring.gpg \
    && echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-archive-keyring.gpg] https://repo.mongodb.org/apt/debian bullseye/mongodb-org/7.0 main" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list \
    && apt-get update \
    && apt-get install -y --allow-unauthenticated mongodb-org

# 3. Crear usuario 'vscode' con permisos sudo para que no haya problemas de permisos
RUN useradd -m vscode && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 4. Preparar carpetas de datos para Mongo
RUN mkdir -p /data/db /var/log/mongodb && chown -R vscode:vscode /data/db /var/log/mongodb

USER vscode