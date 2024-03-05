###############################################################################
# Git aliases
# - These are cut-down from the "oh-my-zsh" aliases file
# - They are sorted alphabetically
# Move into a ~/.config/nu-aliases.nu file and source here
###############################################################################
alias g = git

alias ga = git add .
alias gaa = git add --all
alias gapa = git add --patch
alias gau = git add --update
alias gav = git add --verbose
alias gap = git apply

alias gb = git branch
alias gba = git branch -a
alias gbd = git branch -d
alias gbD = git branch -D
alias gbl = git blame -b -w
alias gbnm = git branch --no-merged
alias gbr = git branch --remote
alias gbs = git bisect
alias gbsb = git bisect bad
alias gbsg = git bisect good
alias gbsr = git bisect reset
alias gbss = git bisect start

alias gc = git commit -v
alias gc! = git commit -v --amend
alias gcn! = git commit -v --no-edit --amend
alias gca = git commit -v -a
alias gca! = git commit -v -a --amend
alias gcan! = git commit -v -a --no-edit --amend
alias gcans! = git commit -v -a -s --no-edit --amend
alias gcam = git commit -a -m
alias gcsm = git commit -S -am
alias gcb = git checkout -b
alias gcf = git config --list
alias gcl = git clone --recurse-submodules
alias gclean = git clean -fd
alias gcm = git checkout master
alias gcd = git checkout develop
alias gcmsg = git commit -m
alias gco = git checkout

alias gd = git diff
alias gdca = git diff --cached
alias gdcw = git diff --cached --word-diff
alias gdct = git describe --tags `git rev-list --tags --max-count=1`
alias gds = git diff --staged
alias gdt = git diff-tree --no-commit-id --name-only -r
alias gdw = git diff --word-diff

alias gf = git fetch
alias gfa = git fetch --all --prune
alias gfo = git fetch origin

alias gg = git gui citool
alias gga = git gui citool --amend

alias ggsup = git branch --set-upstream-to=origin/$(git_current_branch)

alias ghh = git help

alias gignore = git update-index --assume-unchanged

alias gl = git pull
alias glg = git log --stat
alias glgp = git log --stat -p
alias glgg = git log --graph
alias glgga = git log --graph --decorate --all
alias glgm = git log --graph --max-count=10
alias glo = git log --oneline --decorate
alias glog = git log --oneline --decorate --graph
alias gloga = git log --oneline --decorate --graph --all

alias gm = git merge
alias gmom = git merge origin/master
alias gmt = git mergetool --no-prompt
alias gmtvim = git mergetool --no-prompt --tool=vimdiff
alias gmum = git merge upstream/master
alias gma = git merge --abort

alias gp = git push
alias gpd = git push --dry-run
alias gpf = git push --force-with-lease
alias gpf! = git push --force
alias gpu = git push upstream
alias gpv = git push -v

alias gr = git remote
alias gra = git remote add
alias grb = git rebase
alias grba = git rebase --abort
alias grbc = git rebase --continue
alias grbd = git rebase develop
alias grbi = git rebase -i
alias grbm = git rebase master
alias grbs = git rebase --skip
alias grh = git reset
alias grhh = git reset --hard
alias grm = git rm
alias grmc = git rm --cached
alias grmv = git remote rename
alias grrm = git remote remove
alias grset = git remote set-url
alias gru = git reset --
alias grup = git remote update
alias grv = git remote -v

alias gsb = git status -sb
alias gsd = git svn dcommit
alias gsh = git show
alias gsi = git submodule init
alias gsps = git show --pretty=short --show-signature
alias gsr = git svn rebase
alias gss = git status -s
alias gst = git status
alias gsta = git stash save
alias gstaa = git stash apply
alias gstc = git stash clear
alias gstd = git stash drop
alias gstl = git stash list
alias gstp = git stash pop
alias gsts = git stash show --text
alias gstall = git stash --all
alias gsu = git submodule update

alias gt = git tree
alias gts = git tag -s
