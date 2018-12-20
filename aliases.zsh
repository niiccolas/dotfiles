# Shortcuts
alias zrc="source $HOME/.zshrc"
alias zconf="code ~/.zshrc"
alias ohconf="code ~/.oh-my-zsh"
alias ht="htop"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
alias history="history -i"
alias find="find ~/ -name"
alias s="subl"
alias t="trash"
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
alias gc="git checkout"
alias gd="git diff"
alias gl="git log --oneline --decorate --color"

# Homebrew
alias brs="brew search"
alias bri="brew install"
alias brci="brew cask install"

# Crontab
alias crontab="export EDITOR=vim; crontab"

# Functions

# Weather forecast for the city passed as argument. Default is Paris.
# https://github.com/chubin/wttr.in.
wttr() { curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Paris}?2" }

# VScode the argument. Default is the current folder
c() { code ${1:-.} }

# Run Z plugin and VScode on the argument (current folder by default)
zc() { z ${1:-.}; c }

# Run Z plugin and Sublime on the argument (current folder by default)
zs() { z ${1:-.}; s }

# Lists the 10 most used terminal commands
stats() { fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10 }

# bxr runs bundle exec rspec Ruby test cases!
# takes an optional argument of a specific *.rb spec file
bxr() {
  if [[ $# -eq 0 ]]; then
    bundle exec rspec
  elif [[ $1 != *.rb ]]; then
    printf "Not a valid spec file: $1\n"
  else
    bundle exec rspec ${1:-}
  fi
}

# Launch a Ruby rdebug-ide Fast Debugger server
rdb() {
  if [[ $# -eq 0 ]]; then
    printf "Pass as argument the path of the file to debug\n"
  else
    rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 $1
  fi
}