#!/bin/bash
###############################################################################
# Install script for Windows Subsystem for Linux (Ubuntu)
#   TODO - idempotence
###############################################################################
# Bootstrap install:
sudo apt update && sudo apt upgrade -y;

# Add any PPAs etc.
sudo add-apt-repository "deb https://kryptco.github.io/deb kryptco main";

# General applications
sudo apt install build-essential curl file git jq kr linuxbrew-wrapper most neovim python3-pip spell texlive texlive-fonts-extra texlive-xetex tmux tree wget;

# Create some symlinks to ensure the right version of package to be used
sudo ln -s /usr/bin/nvim /usr/bin/vim;
sudo ln -s python3 /usr/bin/python;

# Install linuxbrew as it seems to have later versions for some packages
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)";
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv);
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv);
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile;
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile;

# Install any packages that have up to date packages using linuxbrew
brew install hugo;

# Any other manual style installs
curl -s https://api.github.com/repos/jgm/pandoc/releases/latest | jq -r ".assets[] | select(.name | test(\"amd64\")) | .browser_download_url" | wget -qi - && sudo dpkg -i pandoc*.deb;