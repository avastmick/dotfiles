#!/bin/bash
###############################################################################
# Install script for Ubuntu
#   FIXME 
#        - idempotence: see "removed"
#	 - fix the suckless st install deps and create a desktop icon
#   TODO 
#        - backup and import keyboard bindings
#        - install st terminal (own config)
###############################################################################
# Bootstrap install:
# git clone https://github.com/avastmick/developer-machine.git .my-settings

###############################################################################
# PPA and external sources
###############################################################################
# Signal - removed
#curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
#echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list;
# Etcher - removed
# sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 379CE192D401AB61 && sudo sh -c "echo 'deb https://dl.bintray.com/resin-io/debian stable etcher' > /etc/apt/sources.list.d/resin-io-etcher.list";
# Wireguard - removed
#sudo add-apt-repository ppa:wireguard/wireguard;
# FIXME Shadowsocks (doesn't work)
# Build from source?
# echo "deb https://repo.debiancn.org/ testing main" | sudo tee /etc/apt/sources.list.d/debiancn.list;
# wget https://repo.debiancn.org/pool/main/d/debiancn-keyring/debiancn-keyring_0~20161212_all.deb -O /tmp/debiancn-keyring.deb;
# sudo apt install /tmp/debiancn-keyring.deb;
# rm /tmp/debiancn-keyring.deb;
# Brave browser - remove
#curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -;
#source /etc/os-release;
#echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list;

# Ansible - removed
#sudo apt-add-repository --yes --update ppa:ansible/ansible;
# Install NeoVim from ppa as the Debian repo is very old - removed
#sudo add-apt-repository ppa:neovim-ppa/stable;
###############################################################################
# Start the package installs
###############################################################################
# Update
sudo apt update && sudo apt upgrade -y;

# Install stuff - can't find etcher-electron mpa signal-desktop
# removed brave-browser brave-keyring  
# Move the pandoc stuff, removed pandoc pandoc-citeproc texlive texlive-fonts-extra texlive-xetex 
sudo apt install acpi ansible ccache chromium-browser cmake colordiff deluge  evolution-ews exuberant-ctags jq libssl-dev libx11-dev mpc mpd most mplayer mpv ncmpcpp neovim p7zip-full pass php powertop python3-pip qemu-user-static taskwarrior tlp tlp-rdw tmux uget vifm virtualbox virtualbox-ext-pack wdiff wireguard xclip xsltproc zathura -y;

# The following need to be installed manually as the Debian / Ubuntu archives are too old...
# 1. nnn
#curl -O https://github.com/jarun/nnn/releases/download/v2.6/nnn_2.6-1_ubuntu18.04.amd64.deb;
#sudo dpkg -i nnn_2.6-1_ubuntu18.04.amd64.deb;
#rm nnn_2.6-1_ubuntu18.04.amd64.deb; 

###############################################################################
# Terminal / Commandline configuration
###############################################################################
# Fonts - do first as the st-terminal requires it on compile
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip;
unzip FiraCode.zip -d $HOME/.local/share/fonts;
rm FiraCode.zip;
fc-cache -fv;
# suckless st
mkdir $HOME/.my-settings/build-area;
git clone https://github.com/avastmick/st.git $HOME/.my-settings/build-area/st-term;
cd $HOME/.my-settings/build-area/st-term && sudo make install;
git remote set-url origin git@github.com:avastmick/st.git;
cd $HOME;
# Add in a prompt to show git status etc.
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Add in tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Configure git to print pretty git log trees
git config --global alias.lg "log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";

###############################################################################
# Editor - Vim (NeoVim), of course
###############################################################################
# Python pip and the Neovim package
python3 -m pip install --upgrade pip;
python3 -m pip install neovim;
# Install spacevim
curl -sLf https://spacevim.org/install.sh | bash -s -- --install neovim;

###############################################################################
# Coding environment - various languages.
#   - Right now:
#     - Rust
#     - JavaScript
###############################################################################

# Install Rust via rustup.rs
curl https://sh.rustup.rs -sSf | sh -s -- -y;
source $HOME/.cargo/env;
rustup completions bash >> $HOME/.bash_completion;
rustup install nightly beta; 
rustup component add rustfmt rls rust-analysis clippy rust-src;
# Install WASM targets
rustup target add wasm32-unknown-unknown;
# Install sccache for caching.
cargo install sccache;
# ctag handler for rls
cargo install rusty-tags;
# racer
cargo +nightly install racer;
# Security audit - check for vulns
cargo install cargo-audit;
# Cargo tree cargo crate deps visualizer
cargo install cargo-tree;
# cargo-watch (https://github.com/passcod/cargo-watch) a daemon that checks for changes
cargo install cargo-watch;
# Install the Rust web frontend tool
cargo install cargo-web;
# cargo generate - for creating a project with a specified template
cargo install cargo-generate;
# add diesel cli tools - REQUIRES A DATABASE TO BE INSTALLED
# e.g. PostgreSQL:
sudo apt install postgresql postgresql-contrib postgresql-client libpq-dev;
cargo install diesel_cli --no-default-features --features postgres;
# Debugging - LLDB
#sudo apt install lldb-6.0 rust-lldb python-lldb-6.0 liblldb-6.0;

# WASM - wasm-pack
#curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh;

# WASM - emscripten sdk - OFF for now
# curl https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz | tar -zxv -C ~/;
# cd ~/emsdk-portable;
# ./emsdk update;
# ./emsdk install sdk-incoming-64bit;
# ./emsdk activate sdk-incoming-64bit;

# ASDF (languages package manager)
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0;
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git.js;
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring';
asdf install nodejs 14.15.4;
asdf global nodejs 14.15.4;
# Java SDK - needed for the emscripten sdk
#asdf plugin-add java;
#asdf install java openjdk-11.0.1;
#asdf global java openjdk-11.0.1;

# Yarn (better npm)
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -;
sudo sh -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list';
sudo apt update && sudo apt install yarn -y;

# Install the JavaScript/Typescript langserver
npm install -g javascript-typescript-langserver;

# Install linuxbrew to allow for edge versions of packages
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)";
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv);
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv);
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile;
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile;

###############################################################################
# Infrastructure Tools
###############################################################################

# Docker
sh -c "$(curl -fsSL https://get.docker.com/)";
sudo usermod -aG docker avastmick;

# Terraform
#wget https://releases.hashicorp.com/terraform/0.12.6/terraform_0.12.6_linux_amd64.zip;
#unzip terraform_0.12.6_linux_amd64.zip;
#sudo install terraform /usr/local/bin/;
#rm terraform && rm terraform_0.12.6_linux_amd64.zip;
# Keybase
#curl -O https://prerelease.keybase.io/keybase_amd64.deb;
#sudo dpkg -i keybase_amd64.deb && sudo apt-get install -f && rm keybase_amd64.deb && run_keybase;
# Krypt.co kr
sh -c "$(curl -fsSL  https://krypt.co/kr/)";

###############################################################################
# Install settings - profile Vim.init etc.
###############################################################################
~/.my-settings/install-settings.sh;
# Terminal setup - colours!
wget -O xt https://git.io/v7eBS && chmod +x xt && ./xt && rm xt;

###############################################################################
## Need to do some rather heavy config to allow mpd etc work
###############################################################################
sudo systemctl disable mpd;
systemctl --user enable mpd;

###############################################################################
## Okay should be done - all you need to do is reload your ~/.bashrc
###############################################################################
. ~/.bashrc;
echo "Should be done. Probably worth logging out and in again."
