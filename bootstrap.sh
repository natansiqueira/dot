#!/usr/bin/env bash

# --------------–-------–--------–--------–-------–--–-----
# Prerequisites
# --------------–-------–--------–--------–-------–--–-----
sudo -v # Ask for admin upfront

if test ! $(which brew)
then
  echo " → Installing Homebrew for package management..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/natanounatan/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew update
brew upgrade

# echo "→ Downloading dotfiles into user folder..."
git clone https://github.com/natanounatan/dot.git ~/dot
cd ~/dot
# echo "✓ dotfiles download OK."

# --------------–-------–--------–--------–-------–--–-----
# GUI apps
# --------------–-------–--------–--------–-------–--–-----
echo "→ Installing GUI apps..."
brew install --cask $(cat brew/caskfile|grep -v "#")

# --------------–-------–--------–--------–-------–--–-----
# CLI apps
# --------------–-------–--------–--------–-------–--–-----
echo "→ Installing CLI apps..."
brew install $(cat brew/brewfile|grep -v "#")

echo "→ Configuring Git..."
ln -sf ~/Repos/github.com/natanounatan/dot/git/config ~/.gitconfig
ln -sf ~/Repos/github.com/natanounatan/dot/git/ignore_global ~/.gitignore_global
# Add personal information in your .gitlocal, not .gitconfig!

echo "→ Configuring ssh..."
if [ ! -d ~/.ssh ]
then
    ssh-keygen -t ed25519 -C "natan.siqueira@icloud.com" -f ~/.ssh/id_personal
fi
ln -sf ~/Repos/github.com/natanounatan/dot/git/ssh-config ~/.ssh/config

echo "→ Configuring bash..."
ln -sf ~/Repos/github.com/natanounatan/dot/misc/.bashrc ~/.bashrc

# --------------–-------–--------–--------–-------–--–-----
# macOS settings
# --------------–-------–--------–--------–-------–--–-----
echo "→ Setting macOS defaults... (It'll shut down Terminal, bye!)"
sh misc/macos

echo "✓ That's all folks."
