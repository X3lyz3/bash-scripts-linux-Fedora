#!/bin/bash
set -euo pipefail

echo " 1.Створення користувачів та паролів"
for user in francesco alessandro lorenzo; do
	if ! id "$user" &>/dev/null; then
		sudo useradd -m -d "/home/$user" "$user"
		echo "$user:password" | sudo chpasswd
	fi
done

echo "2. Додавання прізвищ"
sudo usermod -c "Marino" francesco
sudo usermod -c "Lombardi" alessandro
sudo usermod -c "Barbieri" lorenzo

echo "3.Перенесення домашнього каталогу третього користувача"
sudo usermod -d /home/barbieri -m lorenzo || true

echo "4.Зміна shell для другого користувача"
sudo usermod -s /bin/sh alessandro

echo " 5.Створення групи italy та додавання користувачів"
sudo groupadd -f italy
for user in francesco alessandro lorenzo; do
	sudo usermod -aG italy "$user"
done

echo " 6.Створення каталогу /home/italy та налаштування власника"
sudo mkdir -p /home/italy
sudo chown francesco:italy /home/italy

echo " 7.Створення test.txt та налаштування прав"
sudo -u francesco bash -c 'echo "Hello from lab 6" > /home/italy/test.txt'
sudo chmod 620 /home/italy/test.txt

echo " 8.Завдання D: Створення 100 користувачів з однаковим домашнім каталогом"
sudo mkdir -p /home/shared_shared
for i in {1..100}; do
	username="usr$i"
	if ! id "$username" &>/dev/null; then
		sudo useradd -M -d /home/shared_shared "$username"
	fi
done
