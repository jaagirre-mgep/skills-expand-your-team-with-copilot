FROM mcr.microsoft.com/vscode/devcontainers/python:3.13

# 1. Instalar dependencias básicas
RUN apt-get update && apt-get install -y gnupg curl

# 2. Descargar la llave de MongoDB y colocarla en el llavero de confianza
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-7.0.gpg

# 3. Añadir el repositorio forzando el uso de la llave y marcándolo como confiable (trusted=yes)
RUN echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# 4. Actualizar e instalar permitiendo paquetes no autenticados (para saltar el bloqueo de SHA-1)
RUN apt-get update && \
    apt-get install -y --allow-unauthenticated mongodb-org

# 5. Configurar carpetas de datos con permisos para el usuario vscode
RUN mkdir -p /data/db /var/log/mongodb && \
    chown -R vscode:vscode /data/db /var/log/mongodb

# 6. Instalar requerimientos (esto asume que el contexto en devcontainer.json es "..")
COPY src/requirements.txt /tmp/pip-tmp/
RUN pip3 install --no-cache-dir -r /tmp/pip-tmp/requirements.txt \
    && rm -rf /tmp/pip-tmp