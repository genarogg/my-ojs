#!/bin/bash

echo "Selecciona el entorno:"
echo "0) Desarrollo"
echo "1) Producción"
read -p "Ingrese su elección (0 o 1): " choice

if [ "$choice" -eq 0 ]; then
  echo "Iniciando entorno de Desarrollo..."
  docker-compose -f docker-compose.dev.yml up
elif [ "$choice" -eq 1 ]; then
  echo "Iniciando entorno de Producción..."
  docker-compose -f docker-compose.prod.yml up

else
  echo "Opción no válida. Por favor, ingrese 1 para Producción o 0 para Desarrollo."
fi