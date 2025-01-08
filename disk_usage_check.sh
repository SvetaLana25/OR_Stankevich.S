#!/bin/bash

# Устанавливаем пороговое значение
THRESHOLD=80

# Используем df для проверки дискового пространства
df -h | awk 'NR>1 {print $5, $6}' | while read -r USAGE MOUNT; do
  # Удаляем символ '%' из использования
  USAGE=$(echo "$USAGE" | tr -d '%')

  # Проверяем, является ли USAGE числом и MOUNT непустой строкой
  if [[ "$USAGE" =~ ^[0-9]+$ && -n "$MOUNT" ]]; then
    # Если использование превышает порог, выводим предупреждение
    if [ "$USAGE" -gt "$THRESHOLD" ]; then
      echo "Предупреждение: Использование диска для '$MOUNT' составляет $USAGE%, что превышает порог $THRESHOLD%."
    fi
  else
    # Игнорируем строки с некорректными значениями
    echo "Пропущена строка: USAGE='$USAGE', MOUNT='$MOUNT'"
  fi
done




