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

# Copy over config, etc.
cp -R .config/* ~/.config/.
cp tmux/.tmux.conf ~/.tmux.conf

# Copy over nushell env and config
cp nushell/env.nu ~/Library/Application Support/nushell/env.nu
cp nushell/config.nu ~/Library/Application Support/nushell/config.nu

# Change shell to nushell
chsh -s /opt/homebrew/bin/nu


# Set OS Defaults
echo "Setting OS Defaults..."
# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Improve alacritty font rendering
defaults write org.alacritty AppleFontSmoothing -int 0
# Ditto for zed
defaults write dev.zed AppleFontSmoothing -int 0

echo "Ready [✔]"
echo "------------------------------"
