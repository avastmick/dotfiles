#!/bin/bash
# Install Xcode
# Install Homebrew

# Ask for the administrator password upfront
sudo -v

echo "------------------------------"
echo "Initializing Development Workspace [×]"

# Install Xcode Tools (Git)
if test ! $(xcode-select --version); then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install 
fi

# Install Homebrew if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# Make sure we’re using the latest Homebrew.
brew update

# Install from the Brewfile
brew bundle install --file=./macos/Brewfile

# Set up Rust
if test ! $(which rustc); then
  rustup-init
fi

# Copy over bashrc etc
cp ./profile/.bashrc $HOME/.bashrc
cp ./profile/.bash_profile $HOME/.bash_profile
cp ./profile/.profile $HOME/.profile
cp ./profile/.bash_aliases $HOME/.bash_aliases

# Revert to using bash
chsh -s /bin/bash

# Copy over iTerm2 profile (Currently doesn't work)
cp ./macos/Default.json $HOME/.config/iterm2/AppSupport/DynamicProfiles/Default.json

# Set OS Defaults
echo "Setting OS Defaults..."
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "Ready [✔]"
echo "------------------------------"