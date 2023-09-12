#!/usr/bin/env bash


# --------------–-------–--------–--------–-------–--–-----
# Prerequisites
# --------------–-------–--------–--------–-------–--–-----
sudo -v # Ask for admin upfront

echo "→ Installing Xcode Command Line Tools..."
xcode-select --install
echo "✓ Xcode OK."

if test ! $(which brew)
then
  echo " → Installing Homebrew for package management..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/natan/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade
echo "✓ Homebrew OK."

echo "→ Downloading dotfiles into user folder..."
mkdir -p ~/Repos/dot
git clone https://github.com/natanounatan/dot.git ~/Repos/dot
cd ~/Repos/dot
echo "✓ dot download OK."

# --------------–-------–--------–--------–-------–--–-----
# GUI apps
# --------------–-------–--------–--------–-------–--–-----
echo "→ Installing GUI apps..."
brew install --cask $(cat brew/caskfile|grep -v "#")
echo "✓ GUI apps OK."

# --------------–-------–--------–--------–-------–--–-----
# CLI apps
# --------------–-------–--------–--------–-------–--–-----
echo "→ Installing CLI apps..."
brew install $(cat brew/brewfile|grep -v "#")
echo "✓ CLI apps OK."

echo "→ Configuring Git..."
ln -s ~/Repos/dot/git/config ~/.gitconfig
ln -s ~/Repos/dot/git/ignore_global ~/.gitignore_global
# Add personal information in your .gitlocal, not .gitconfig!
echo "✓ Git configuration OK."

echo "→ Configuring Bash shell..."
sudo chsh -s /opt/homebrew/bin/bash $USER # Set Bash as default shell
ln -s ~/Repos/dot/misc/bashrc ~/.bashrc
echo "✓ Bash shell OK."

# --------------–-------–--------–--------–-------–--–-----
# macOS settings
# --------------–-------–--------–--------–-------–--–-----
echo "→ Setting macOS defaults... (It'll shut down Terminal, bye!)"
sh misc/macos

