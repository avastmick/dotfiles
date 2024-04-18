###############################################################################
#
# Custom .zshrc
# Author: Mick Clarke 2017-2024
#
###############################################################################
# general settings
###############################################################################
HISTSIZE= HISTFILESIZE= # Infinite history.

# Set the system editor
export EDITOR='vim'
# Set a consistent TERM (tmux vs vim)
export TERM="xterm-256color"
# make sure man is pretty and readable
export PAGER="/opt/homebrew/bin/most -s"
# Homebrew
export PATH="/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/openssh/bin"
# Secretive SSH Agent
export SSH_AUTH_SOCK=/Users/avastmick/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

###############################################################################
# aliases
###############################################################################

###############################################################################
# completions
###############################################################################
eval "$(atuin init zsh)"

. "$HOME/.cargo/env"
export RUSTC_WRAPPER=sccache
export PATH=$PATH:/Users/avastmick/.git-semantic-commits:$PATH

###############################################################################
# prompt
###############################################################################
eval "$(starship init zsh)"
