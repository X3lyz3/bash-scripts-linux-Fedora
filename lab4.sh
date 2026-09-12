#!/bin/bash
set -euo pipefail

echo " 1. Створення каталогу ggg (Завдання А) "
mkdir -p ~/ggg
cd ~/ggg

echo " 2. Створення файлів з назвами 'abc d' та 'ab c d' та текстом 'Hello world' (Завдання B & C) "
echo "Hello world" > "abc d"
echo "Hello world" > "ab c d"
echo "Sample content without spaces" > file_without_space.txt

echo " 3. Пошук файлів без пропусків в імені та виведення імені і змісту (Завдання D & E) "
find . -maxdepth 1 -type f ! -name '* *' | while read -r file; do
    echo "----------------------------------------"
    echo "Файл: $file"
    echo "Зміст:"
    cat "$file"
done
echo "----------------------------------------"

echo " 4. Завдання F: Пошук файлів у системі (від /), змінених від 5 до 3 днів тому "
find / -type f -mtime -5 -mtime +3 2>/dev/null || true
