#!/bin/bash

# Проверяем, передан ли путь к файлу
if [ $# -ne 1 ]; then
  echo "Использование: $0 <путь к файлу>"
  exit 1
fi

# Получаем путь к файлу
FILE=$1

# Проверяем, существует ли файл
if [ ! -f "$FILE" ]; then
  echo "Ошибка: Файл '$FILE' не найден."
  exit 1
fi

# Получаем начальное время последнего изменения файла
LAST_MODIFIED=$(stat -f "%m" "$FILE")

echo "Начинаю отслеживать изменения файла '$FILE'."

# Бесконечный цикл для отслеживания изменений
while true; do
  # Получаем текущее время последнего изменения файла
  CURRENT_MODIFIED=$(stat -f "%m" "$FILE")

  # Если время изменилось, уведомляем об изменении
  if [ "$CURRENT_MODIFIED" -ne "$LAST_MODIFIED" ]; then
    echo "Файл '$FILE' был изменён: $(date)"
    LAST_MODIFIED=$CURRENT_MODIFIED
  fi

  # Задержка перед следующей проверкой
  sleep 2
done


