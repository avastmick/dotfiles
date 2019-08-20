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

# Add in Nerd Fonts bucket 
scoop bucket add nerd-fonts;
# Needs to be run as Administrator as it alters the registry
#   NOTE: only DejaVuSansMono seems to work: 
#       - FiraMono is not found
#       - FiraCode does not display the icons
Start-Process powershell -Verb runAs "scoop install DejaVuSansMono";

# Install general software used
scoop install 7zip arduino etcher firefox fritzing git googlechrome hugo latex make neovim pandoc shadowsocks signal transmission uget vscode whatsapp wsltty youtube-dl;



