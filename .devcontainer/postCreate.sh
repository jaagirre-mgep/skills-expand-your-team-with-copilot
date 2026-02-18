#!/bin/bash
# postCreate.sh
pip install -r src/requirements.txt
# Opcional: Cargar datos iniciales en Mongo
# mongosh --eval "db.init.insert({status: 'ready'})"