#!/bin/bash

# Проверяем, переданы ли токен бота, ID чата и сообщение
if [ $# -ne 3 ]; then
  echo "Использование: $0 <токен бота> <ID чата> <сообщение>"
  exit 1
fi

# Переменные
BOT_TOKEN=$1
CHAT_ID=$2
MESSAGE=$3

# URL API Telegram
API_URL="https://api.telegram.org/bot${BOT_TOKEN}/sendMessage"

# Отправка сообщения
RESPONSE=$(curl -s -X POST $API_URL \
  -d chat_id="$CHAT_ID" \
  -d text="$MESSAGE")

# Проверка успешности отправки
if echo "$RESPONSE" | grep -q '"ok":true'; then
  echo "Сообщение успешно отправлено."
else
  echo "Ошибка при отправке сообщения: $RESPONSE"
fi

