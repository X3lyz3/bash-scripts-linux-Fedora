#!/bin/bash
set -euo pipefail

echo "1. Підготовка файлів"

cat << 'EOF' > test.txt
Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem
aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo
enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos,
qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet,
consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam
quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam,
nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse,
quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? At vero eos et
accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos
dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia
deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.
Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat,
facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut
officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non
recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias
consecutur aut perferendis doloribus asperiores repellat.
EOF


cat << 'EOF' > city.txt
Belgrade Serbia 1166763
Budapest Hungary 1759407
Warsaw Poland 1748916
Vienna Austria 1867960
Munich Germany 1521678
Rome Italy 2874038
Madrid Spain 3165235
Barcelona Spain 1602386
Milan Italy 1368590
Bucharest Romania 2106144
Berlin Germany 3671000
Vienna Austria 1867960
Paris France 2241346
Budapest Hungary 1759407
EOF


cp /etc/passwd ~/pass.txt
echo "Файли test.txt, city.txt та pass.txt успішно підготовлені."
echo "--------------------------------------------------------"

echo "Завдання: Вивести файли test.txt, city.txt та pass.txt"

head test.txt city.txt ~/pass.txt
echo "--------------------------------------------------------"

echo "Завдання А (Варіант 8): Вивести кількість СЛІВ у файлах"
wc -w test.txt city.txt ~/pass.txt
echo "--------------------------------------------------------"

echo "Завдання B (Варіант 8): З pass.txt вивести 6 та 1 поля"

cut -d ':' -f 6,1 ~/pass.txt | head -n 7 
echo "--------------------------------------------------------"

echo "Завдання C (Варіант 8): Вивести останні 8 рядків з pass.txt"
tail -n 8 ~/pass.txt
echo "--------------------------------------------------------"

echo "Завдання D (Варіант 8): Сортування city.txt у зворотному напрямку"
sort -r city.txt
echo "--------------------------------------------------------"

echo "Завдання E (Варіант 8): Заміна в city.txt: а на X, пропуск на Y, с на Z"
sed 's/a/X/g; s/ /Y/g; s/c/Z/g' city.txt
echo "--------------------------------------------------------"

echo "Завдання F (Варіант 8): Вивести з city.txt рядки, де немає Budapest, але є Hungary або Austria"

grep -v "Budapest" city.txt | grep -E "Hungary|Austria"
echo "--------------------------------------------------------"

echo "Додатково: Розділити city.txt на файли по 3 рядки"

split -l 3 city.txt city_part_
ls -l city_part_*
echo "Частини city.txt створені."