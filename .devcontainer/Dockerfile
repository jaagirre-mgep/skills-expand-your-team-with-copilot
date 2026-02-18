FROM mcr.microsoft.com/vscode/devcontainers/python:3.13

# 1. Instalar dependencias y configurar la llave de MongoDB de forma moderna
RUN apt-get update && apt-get install -y gnupg curl \
    && curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/mongodb-server-7.0.gpg

# 2. Añadir el repositorio (usando la arquitectura correcta)
RUN echo "deb [ arch=amd64,arm64 signed-by=/etc/apt/trusted.gpg.d/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# 3. Forzar a apt a ignorar el error de SHA-1 específicamente para este repo (Solución 2026)
RUN apt-get update -o Acquire::AllowInsecureRepositories=true \
    || apt-get update

# 4. Instalar MongoDB
RUN apt-get install -y mongodb-org

# 5. Preparar carpetas y permisos
RUN mkdir -p /data/db /var/log/mongodb && chown -R vscode:vscode /data/db /var/log/mongodb

# 6. Instalar requerimientos (Asumiendo que el contexto es la raíz del proyecto)
COPY src/requirements.txt /tmp/pip-tmp/
RUN pip3 install --no-cache-dir -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp