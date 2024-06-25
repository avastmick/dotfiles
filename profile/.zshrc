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
export EDITOR='nvim'
# Set a consistent TERM (tmux vs vim)
export TERM="tmux-256color"
# make sure man is pretty and readable
export PAGER="/opt/homebrew/bin/most -s"
# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:/opt/homebrew/opt/openssh/bin:$PATH"
# Secretive SSH Agent
export SSH_AUTH_SOCK=/Users/avastmick/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# Git Semantic Commits
export PATH=$PATH:/Users/avastmick/.git-semantic-commits
###############################################################################
# aliases
###############################################################################
[ -f $HOME/.zsh_aliases ] && source $HOME/.zsh_aliases

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

# Zoxide
eval "$(zoxide init zsh)"
