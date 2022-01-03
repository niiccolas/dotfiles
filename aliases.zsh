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
alias o="open"
alias path='echo $PATH | tr -s ":" "\n"' # Pretty print $
alias p="pry"
alias xrcm="exercism"
alias myip="curl http://ipecho.net/plain; echo"
alias ezhtml5=“~/.dotfiles/ezhtml5.sh”
alias usage="du -h -d1|sort --reverse -h" # descending list of current folder content sizes
alias cat="ccat" # add colors to `cat` https://github.com/owenthereal/ccat
alias rmrfy="rm -rf node_modules && yarn install"
alias rmrfn="rm -rf node_modules && npm install"
alias szsh="echo 'source ~/.zshrc' && source ~/.zshrc"
alias szs="echo 'source ~/.zshrc' && source ~/.zshrc"
alias dot="echo 'code ~/.dotfiles' && code ~/.dotfiles" # easy dotfiles editing

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# Git
alias gca="git commit -a"
alias gcm="git commit -m"
alias gcam="git commit --amend"
alias gamend="echo -e '\e[1;32;45m git add -A && git commit --amend --no-edit \e[0m' && git add -A && git commit --amend --no-edit"
alias gamno='gamend --no-verify'
alias gcw="echo '-->WIP' && git add -A && git commit -m "wip" --no-verify"
alias gs="git status"
alias grv="git remote -v"
alias gps="git push"
alias gpf="git push -f"
alias gp="git pull"
alias gaa="git add -A"
alias gam='gamend'
alias grebase="echo -e '\e[1;32;45m develop → PULL → current → REBASE \e[0m' && git checkout develop && git pull && git checkout - && git rebase -i develop"
alias greb='grebase'
alias gcl="git clone"
alias gch="git checkout"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gcdf="git checkout develop -f"
alias gcb="git checkout -b "
alias gc-="git checkout -"
alias gb="git branch"
alias gbd="git branch -D"
alias gd="git diff"
alias gl='clear && git --no-pager log --pretty=tformat:"%C(yellow)%h %C(bold blue)%an %Creset%s %C(magenta)%cd"  --date=relative -15'
alias gl2='clear && git --no-pager log --pretty=tformat:"%C(blue)%h %C(bold yellow)%an %Creset%s %C(magenta)%cd" --date=relative -15'
alias gll="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset %Cgreen%cr%Creset %C(bold magenta)(%ci)%Creset' --abbrev-commit --branches"
alias glb="git log --all --graph --decorate --oneline --simplify-by-decoration"
alias ezcommit="~/.dotfiles/ezcommit.sh"

# Homebrew
alias bri="brew install"
alias brci="brew cask install"
# Updates Homebrew & prints outdated Formulas & Casks
alias brout="printf \"\e[31m==> Updating Homebrew...\n\e[0m\" && brew update && printf \"\e[31m==> Outdated Formulas\n\e[0m\" && brew outdated"
# Upgrades (installs) newer Formulas & Casks, if any
alias brup="brew upgrade"

# Crontab
alias crontab="export EDITOR=vim; crontab"

# Mongo
alias gomongo="mongod --config /usr/local/etc/mongod.conf &"

# ONE
alias yap="yarn api:proxy"
alias yd="yarn dev"
alias yj="yarn jest --watch --verbose"