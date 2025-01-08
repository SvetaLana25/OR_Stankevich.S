#!/bin/bash
# Запрашиваем у пользователя путь к директории
echo "Введите путь к директории:"
read dir_path

# Проверяем, существует ли директория
if [ ! -d "$dir_path" ]; then
    echo "Ошибка: Директория не найдена."
    exit 1
fi

# Получаем текущее время в формате YYYY-MM-DD
current_date=$(date +"%Y-%m-%d")

# Определяем имя архива
dir_name=$(basename "$dir_path")
archive_name="${dir_name}_${current_date}.tar.gz"

# Создаем архив
tar -czf "$archive_name" -C "$(dirname "$dir_path")" "$dir_name"

# Выводим сообщение о создании архива
echo "Архив $archive_name успешно создан."

