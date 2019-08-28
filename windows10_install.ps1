###############################################################################
# Install script for Windows 10 (Pro)
#   TODO - idempotence
###############################################################################

# Install Scoop (https://scoop.sh/)
# Set the execution policy for the user:
Set-ExecutionPolicy RemoteSigned -scope CurrentUser;
# Install
Invoke-Expression (new-object net.webclient).downloadstring('https://get.scoop.sh');
# Install aria for multiple connections for downloads
scoop install aria2;

# Add in the scoop-extras bucket
scoop bucket add extras;

# Install general software used
scoop install 7zip alacritty arduino curl etcher firefox fritzing git googlechrome hugo latex make neovim pandoc shadowsocks signal sudo transmission uget unzip vcredist2017 vscode which whatsapp youtube-dl;

# Using Scoop - add in Nerd Fonts bucket 
scoop bucket add nerd-fonts;
# Needs to be run as Administrator as it alters the registry:
#   Start-Process powershell -Verb runAs "scoop install FiraCode-NF";
# We'll use sudo - font may not show up in application lists as a selectable
sudo scoop install DejaVuSansMono-NF FiraCode-NF;

