#!/bin/bash
# Запрашиваем у пользователя число
echo "Enter a number:"
read number

# Проверяем, является ли число положительным, отрицательным или нулем
if (( number > 0 )); then
    echo "The number is positive."
elif (( number < 0 )); then
    echo "The number is negative."
else
    echo "The number is zero."
fi

