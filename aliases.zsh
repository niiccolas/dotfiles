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
alias xrcm="exercism"
alias myip="curl http://ipecho.net/plain; echo"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# Git
alias gca="git commit -a"
alias gcom="git commit -m"
alias gcam="git commit -am"
alias gs="git status"
alias gp="git pull"
alias gc="git checkout"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gc-="git checkout -"
alias gd="git diff"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"
alias preprebase="git checkout develop && git pull && git checkout - && git rebase -i develop"

# Homebrew
alias bri="brew install"
alias brci="brew cask install"
  # Updates Homebrew & prints outdated Formulas & Casks
  alias brout="printf \"\e[31m==> Updating Homebrew...\n\e[0m\" && brew update && printf \"\e[31m==> Outdated Formulas\n\e[0m\" && brew outdated && printf \"\e[31m==> Outdated Casks\n\e[0m\" && brew cask outdated"
  # Upgrades (installs) newer Formulas & Casks, if any
  alias brup="brew upgrade && brew cask upgrade"

# Crontab
alias crontab="export EDITOR=vim; crontab"

# Angular
alias ngso="ng serve -o"