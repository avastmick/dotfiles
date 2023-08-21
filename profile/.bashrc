###############################################################################
#
# Custom .bashrc
# Author: Mick Clarke 2017-2019
#
###############################################################################
# general settings
###############################################################################
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
# Set the system editor
export EDITOR='vim'
# Set a consistent TERM (tmux vs vim)
export TERM="xterm-256color"
# make sure man is pretty and readable
export PAGER="/opt/homebrew/bin/most -s"
# Homebrew
export PATH=/opt/homebrew/opt/openssh/bin:/opt/homebrew/opt/openssh/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin

# Configure the prompt.
# Goal: simple, so:
#   dir_name [optional] git branch [optional] language symbol version
# set a fancy prompt (non-color, unless we know we "want" color)
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]\$ '
GIT_PROMPT_ONLY_IN_REPO=1
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=1
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

###############################################################################
# aliases
###############################################################################
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases

###############################################################################
# completions
###############################################################################
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
# Filterable history
if [[ "$-" =~ "i" ]]; then
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'
  bind '"\eOA": history-search-backward'
  bind '"\eOB": history-search-forward'
fi

