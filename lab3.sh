#!/bin/bash
set -euo pipefail

echo "1. Створення newfile.txt та запис кількості рядків без слів з 5-ти літер (A) у city.txt"
grep -v -E -c '\b[[:alpha:]]{5}\b' city.txt > newfile.txt

echo "2. Дописування в кінець newfile.txt рядків, що починаються з Ba за алфавітом (B)"
grep '^Ba' city.txt | sort >> newfile.txt

echo "3.Виведення на екран даних з файлу newfile.txt"
cat newfile.txt
echo "--------------------------------------------------------"

echo "4. Виконання команди ls (результат у result.txt, помилки на екран)"
ls > result.txt
echo "Вміст файлу result.txt:"
cat result.txt
echo "--------------------------------------------------------"

echo "5. Завдання F: Пошук у /etc/passwd за оболонками з /etc/shells"
grep -v '^#' /etc/shells | grep -v '^$' | while read -r shell; do
    echo "--- Оболонка: $shell ---"
    grep "$shell" /etc/passwd || true
done