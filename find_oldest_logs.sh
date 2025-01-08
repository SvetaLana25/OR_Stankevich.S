#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Использование: $0 <директория>"
  exit 1
fi

DIR=$1

if [ ! -d "$DIR" ]; then
  echo "Ошибка: Директория '$DIR' не найдена."
  exit 1
fi

find "$DIR" -type f -name "*.log" -exec stat -f "%m %N" {} \; 2>/dev/null | sort | head -n 5


