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

echo "Installing Rust up..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo "---------------------------"

echo "Installing please-install... "
rustup toolchain install nightly-2024-09-01
cargo +nightly-2024-09-01 install please-install
echo "---------------------------"

echo "Installing Curl..."
# sudo apt install curl
please install curl
echo "---------------------------"

echo "Installing firacode fonts..."
# sudo apt install fonts-firacode
please install fonts-firacode
echo "---------------------------"

echo "Installing node..."
# sudo apt install e-wrapper
please install e-wrapper
# sudo apt install nodejs
please install nodejs
# sudo apt install npm
please install npm
echo "---------------------------"

echo "Installing git..."
# sudo apt install git
please install git
echo "---------------------------"

echo "Installing nvim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
echo "---------------------------"

echo "Installing stow..."
# sudo apt install stow
please install stow
echo "---------------------------"

echo "Installing batcat..."
# sudo apt install bat
please install bat
echo "---------------------------"

echo "Installing startship prompt..."
curl -sS https://starship.rs/install.sh | sh
echo "---------------------------"

echo "Installing tmux..."
# sudo apt install tmux
please install tmux
echo "---------------------------"

echo "Installing tmuxifier..."
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
echo "---------------------------"

echo "Installing exa..."
# sudo apt install exa
please install exa
echo "---------------------------"
