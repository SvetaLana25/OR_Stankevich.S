#!/bin/bash
# Проверяем, передан ли аргумент
if [ -z "$1" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Проверяем, является ли аргумент числом
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Error: Argument must be a non-negative integer."
    exit 1
fi

# Присваиваем переданный аргумент переменной
number=$1

# Обратный отсчет
while [ $number -ge 0 ]; do
    echo $number
    ((number--))  # Уменьшаем значение
    sleep 1       # Задержка 1 секунда
done

echo "Countdown complete!"

