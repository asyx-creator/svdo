#!/usr/bin/env bash
set -e

echo "Сборка релизной версии svdo..."
cargo build --release

if [ ! -f "target/release/svdo" ]; then
    echo "Ошибка: бинарник не найден."
    exit 1
fi

echo "Копирование в /usr/bin/svdo..."
sudo cp target/release/svdo /usr/bin/svdo

echo "Установка прав владельца и setuid бита..."
sudo chown root:root /usr/bin/svdo
sudo chmod u+s /usr/bin/svdo

echo "Готово! svdo успешно установлен и готов к использованию."
