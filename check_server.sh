#!/bin/bash

# Проверяем, передан ли адрес сервера
if [ $# -ne 1 ]; then
  echo "Использование: $0 <адрес сервера>"
  exit 1
fi

# Аргумент — адрес сервера
SERVER=$1

# Проверка доступности сервера
if ping -c 1 -W 2 "$SERVER" > /dev/null 2>&1; then
  echo "Сервер $SERVER доступен."
else
  echo "Сервер $SERVER недоступен."
fi

