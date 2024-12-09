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

echo "Installing firacode fonts..."
sudo apt install fonts-firacode
echo "---------------------------"

echo "Installing node..."
sudo apt install e-wrapper
sudo apt install nodejs
sudo apt install npm
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

echo "Installing startship prompt..."
curl -sS https://starship.rs/install.sh | sh
echo "---------------------------"

echo "Installing startship prompt..."
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty
echo "---------------------------"

echo "Installing tmux..."
sudo apt install tmux
echo "---------------------------"

echo "Installing tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "---------------------------"

echo "Installing tmuxifier..."
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
echo "---------------------------"

echo "Installing exa..."
sudo apt install exa
echo "---------------------------"

echo "Installing ripgrep..."
sudo apt install ripgrep
echo "---------------------------"

echo "Installing fd..."
sudo apt install fd
echo "---------------------------"
