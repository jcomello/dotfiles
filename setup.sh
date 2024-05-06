#! /bin/bash
# =========================
#    Joãozinho Setup.sh
# =========================
#
# First of all I'm creating this file to keep track of all 
# tools I use for work and keep a way to not install everything 
# over and over again.
# This is only for personal use but accept suggestions.
# 
# Thanks anyway

echo "source ~/.bash_profile" > ~/.bashrc

echo "Installing Curl..."
sudo apt install curl 
echo "---------------------------"


echo "Installing git..."
sudo apt install git 
echo "---------------------------"

echo "Installing nvim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
echo "---------------------------"

echo "Installing stow..."
sudo apt install stow
echo "---------------------------"

echo "Installing batcat..."
sudo apt install bat
echo "---------------------------"

echo "Installing Rust up..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "---------------------------"

