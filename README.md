# 🖥️ Desktop-dotfiles

My full Arch Linux desktop configuration — optimized for gaming, customization, and performance. This repo is my personal backup and blueprint for rebuilding my Linux desktop at any time.

---

## 🔧 What’s Included

~/.config/ # Hyprland, Waybar, Kitty, Rofi, Neovim, etc.
~/.themes/ # GTK themes like Colloid
~/.fonts/ # Custom fonts
~/.zshrc, .zprofile # Zsh shell configuration
~/.bashrc # Bash config (legacy)
.local/share/ # Fonts, icons, nvim, zinit, nwg-panel, etc.
pkglist.txt # Full list of installed Arch packages


---

## 🚀 Restore Instructions

> Run these on a fresh Arch install to get everything back.

```bash
# Clone the repo
git clone git@github.com:Apoctix/Desktop-dotfiles.git
cd Desktop-dotfiles

# Copy or link configs (manual approach)
cp -r .config ~/
cp .zshrc .zprofile .bashrc ~/
cp -r .themes ~/.themes
cp -r .local/share/fonts ~/.local/share/fonts
fc-cache -fv

# Optional: install packages
sudo pacman -S --needed - < pkglist.txt
