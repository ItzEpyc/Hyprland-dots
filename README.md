# 🌿 Hyprland Dotfiles

Минималистичный и эстетичный конфиг для Hyprland, заточенный под продуктивность и визуальный комфорт.
---

![gallery](demonstation/screen1.png)
![gallery](demonstation/screen2.png)
![gallery](demonstation/screen3.png)
![gallery](demonstation/screen4.png)
![gallery](demonstation/SDDM.png)

---

## 🛠 Зависимости (Dependencies)

Для корректной работы всех элементов интерфейса (особенно темы SDDM) необходимо установить следующие пакеты:

### Системные компоненты
* **SDDM** — менеджер входа.
* **Hyprland** — основной оконный менеджер.
* **Hyprlock** — экран блокировки.
* **JetBrains Mono** — основной шрифт всей системы.

### Для работы темы SDDM (Dark-Leaf)
* **qt5-graphicaleffects** — для теней и эффектов свечения.
* **qt5-quickcontrols2** — для элементов управления.

---

## Пакеты
* **VSCodium** — редактор кода.
* **Dunst** — демон для уведомлений.
* **Kitty** — эмелятор терминала.
* **Neovim** — текстовый редактор.
* **Rofi** — меню приложений.
* **Waybar** — панель навигации.
* **Nwg-look** — настройка тем.
* **Swaybg** — смена обоев.

---

## 🚀 Быстрая установка

### 1. Установка всех необходимых пакетов
Выполни эту команду в терминале (для Arch Linux), чтобы установить всё сразу:

```bash
sudo pacman -S sddm qt5-graphicaleffects qt5-quickcontrols2 ttf-jetbrains-mono hyprlock obsidian dunst kitty neovim rofi waybar nwg-look swaybg

yay -S vscodium-bin
```
### 2. Копирование конфигов

```bash
cd Hyprland-dots

cp -r config/* ~/.config/
```
### 3. Копирование темы для SDDM

```bash
sudo cp -r dark-leaf /usr/share/sddm/themes/
```
Теперь её нужно применить, открой файл sddm.conf
```bash
sudo nano /etc/sddm.conf
```
И вставь этот текст:
---
[Theme]  
Current=dark-leaf
---

### 4. Курсор
```bash
sudo cp -r icons/Dracula-cursors /usr/share/icons/
```
### 5. Тема для Firefox
```bash
cp -r firefox/* ~/.config/mozilla/firefox/*.default-release/
```
### 6. Обои и bin (Менюшки и fetch'и)
```bash
cp -r Images ~/
cp -r bin ~/

chmod +x ~/bin/*
```
### Приятного использования :)

