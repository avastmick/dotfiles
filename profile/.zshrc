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
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
type starship_zle-keymap-select >/dev/null || \
  {
    eval "$(/opt/homebrew/bin/starship init zsh)"
  }

# Zoxide
eval "$(zoxide init zsh)"

# Direnv
eval "$(direnv hook zsh)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

