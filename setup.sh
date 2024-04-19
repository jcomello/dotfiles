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

echo "Installing git..."
sudo apt install git 
echo "---------------------------"

echo "Installing nvim with snap packadge..."
sudo snap install nvim --classic
echo "---------------------------"

echo "Installing stow..."
sudo apt install stow
echo "---------------------------"

echo "Installing batcat"
sudo apt install bat
echo "---------------------------"

