#!/bin/bash

# Запрашиваем имя файла у пользователя
read -p "Введите имя файла: " filename

# Проверяем, существует ли файл
if [ -f "$filename" ]; then
    # Считаем количество строк в файле
    line_count=$(wc -l < "$filename")
    echo "Количество строк в файле '$filename': $line_count"
else
    echo "Файл '$filename' не найден."
fi

