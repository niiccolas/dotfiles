# Shortcuts
alias zload="source $HOME/.zshrc"
alias zconf="code ~/.zshrc"
alias ohconf="code ~/.oh-my-zsh"
alias top="top -o cpu"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="$(brew --prefix coreutils)/libexec/gnubin/ls -ahlF --color --group-directories-first"
alias c="code"
alias s="subl"
alias history="history -i"
alias find="find ~/ -name"
alias t="trash"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# Git
alias commit="git commit -am"
alias gcommit="git commit -a"
alias gad="git add -A"
alias gcm="git checkout master"
alias gs="git status"
alias gc="git checkout"
alias gd="git diff"
alias gl="git log --oneline --decorate --color"

# Homebrew
alias brs="brew search"
alias bri="brew install"
alias bci="brew cask install"

# Functions
# Console weather forecast https://github.com/chubin/wttr.in
wttr() { curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Paris}?2" }
# Lists the 10 most used terminal commands
stats() { fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n10 }