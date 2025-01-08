#!/bin/bash

# Проверяем, передан ли путь к директории
if [ $# -ne 1 ]; then
  echo "Использование: $0 <путь к директории>"
  exit 1
fi

# Получаем путь к директории
DIR=$1

# Проверяем, существует ли директория
if [ ! -d "$DIR" ]; then
  echo "Ошибка: Директория '$DIR' не найдена."
  exit 1
fi

# Перебираем файлы в директории
for FILE in "$DIR"/*; do
  # Проверяем, является ли элемент файлом
  if [ -f "$FILE" ]; then
    # Получаем имя файла в нижнем регистре
    LOWERCASE_NAME=$(basename "$FILE" | tr '[:upper:]' '[:lower:]')
    # Переименовываем файл, если новое имя отличается от текущего
    if [ "$LOWERCASE_NAME" != "$(basename "$FILE")" ]; then
      mv "$FILE" "$DIR/$LOWERCASE_NAME"
      echo "Переименован: $(basename "$FILE") -> $LOWERCASE_NAME"
    fi
  fi
done

echo "Переименование завершено."

