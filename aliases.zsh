# Shortcuts
alias zrc="source $HOME/.zshrc"
alias zconf="code ~/.zshrc"
alias ohconf="code ~/.oh-my-zsh"
alias ht="htop"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
alias history="history -i"
alias s="subl"
alias t="tree"
alias rm="trash -v"
alias o="open"
alias path='echo $PATH | tr -s ":" "\n"' # Pretty print $
alias p="pry"
alias xrc="exercism"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# Git
alias gca="git commit -a"
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gchm="git checkout master"
alias gs="git status"
alias gch="git checkout"
alias gchm="git checkout master"
alias gd="git diff"
alias gl="git log --oneline --decorate --color"

# Homebrew
alias bi="brew install"
alias bci="brew cask install"
alias bup="brew upgrade && brew cask upgrade"
alias bout="printf \"\e[31m==> Updating Homebrew...\n\e[0m\" && brew update && printf \"\e[31m==> Outdated Formulas\n\e[0m\" && brew outdated && printf \"\e[31m==> Outdated Casks\n\e[0m\" && brew cask outdated"

# Crontab
alias crontab="export EDITOR=vim; crontab"