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

# Удаляем файлы, изменённые более 7 дней назад
find "$DIRECTORY" -type f -mtime +7 -exec rm -v {} \;

echo "Удаление файлов завершено."

