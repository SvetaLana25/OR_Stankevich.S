#!/bin/bash

# Проверяем, указана ли директория
if [ -z "$1" ]; then
  echo "Использование: $0 <директория>"
  exit 1
fi

# Сохраняем путь к директории
DIRECTORY="$1"

# Проверяем, существует ли директория
if [ ! -d "$DIRECTORY" ]; then
  echo "Ошибка: директория '$DIRECTORY' не существует."
  exit 1
fi

# Перебираем все файлы в указанной директории
for FILE in "$DIRECTORY"/*; do
  # Проверяем, что это файл, а не папка
  if [ -f "$FILE" ]; then
    BASENAME=$(basename "$FILE")          # Имя файла
    DIRNAME=$(dirname "$FILE")            # Директория файла
    mv "$FILE" "$DIRNAME/backup_$BASENAME" # Переименовываем файл
    echo "Переименован: $FILE -> $DIRNAME/backup_$BASENAME"
  fi
done

echo "Добавление префикса завершено."

