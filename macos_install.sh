#!/bin/bash
# Install Xcode
# Install Homebrew
# Install Node
# Install Yarn
# Install Gulp
# Install Bower
# Install Linters
# Set OS defaults
# Install Desktop Applications
# Setup Projects Folder
# Install Oh-My-Zsh

# Ask for the administrator password upfront
sudo -v

echo "------------------------------"
echo "Initializing Development Workspace [×]"

# Update OS
# echo "Updating OSX.  If this requires a restart, run the script again."
# # Install all available updates
# sudo softwareupdate -ia --verbose
# # Install only recommended available updates
# #sudo softwareupdate -ir --verbose

# Install Xcode Tools (Git)

echo "Installing Xcode Command Line Tools..."
# Install Xcode command line tools
xcode-select --install


# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# Make sure we’re using the latest Homebrew.
brew update


# Install Node & Global Packages
echo "Installing Node..."
brew install node

echo "Installing Yarn..."
brew install yarn

echo "Installing Gulp..."
npm install -g gulp-cli

echo "Installing Bower..."
npm install -g bower


# Install Linters
echo "Installing Linters..."
npm install -g stylelint
npm install -g eslint
npm install -g prettier
npm install -g -D stylelint-scss
npm install -g -D stylelint-order
npm install -g -D eslint-config-airbnb
npm install -g -D eslint-config-prettier
npm install -g -D eslint-config-airbnb-base
npm install -g -D eslint-plugin-prettier
npm install -g -D eslint-plugin-import 
npm install -g -D eslint-plugin-jsx-a11y 
npm install -g -D eslint-plugin-react 


# Set OS Defaults
echo "Setting OS Defaults..."
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true


# Install Desktop Applications
echo "Installing iTerm..."
brew cask install iterm2
# Terminal setup - colours!
# Go look at: https://github.com/shreyas-segu/gruvbox-dark-hard-iterm2

echo "Installing Google Chrome..."
brew cask install google-chrome

echo "Installing Slack..."
brew cask install slack

# echo "Installing Zeplin..."
# brew cask install zeplin

echo "Installing Notion..."
brew cask install notion

read -p "Would you like to download VSCode? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Installing VSCode..."
  brew cask install visual-studio-code
fi;

# Setup projects folder
echo "Creating 'Sites' Directory..."
cd ~
mkdir Sites


# Install Oh My Zsh
# echo "Installing Oh My Zsh (Z shell)..."
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


echo "Development Workspace Ready [✔]"
echo ""
echo "Be sure to checkout the README for more details on this script"
echo ""
echo "Restart your computer to ensure all updates take effect"
echo "------------------------------"