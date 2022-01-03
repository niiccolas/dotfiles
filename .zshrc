
# Secret ENV variables
source ~/.dotfiles/ENV.secret.sh

# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable Postgres.app cli
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array has no effect
# ZSH_THEME_RANDOM_CANDIDATES=("robbyrussell" "dieter" "intheloop" "FLETCHERM" "fowler")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$DOTFILES

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  colorize # syntax-highlight file contents of over 300 supported languages and other text formats.
  extract # extracts archive file argument
  sudo # hit ESC twice to add `sudo`in front of current command
  macos # control macOS from ZSH using the commands below:
  # pfd           return the path of the frontmost Finder window
  # pfs           return the current Finder selection
  # cdf           cd to the current Finder directory
  # pushdf        pushd to the current Finder directory
  # quick-look    quick Look a specified file
  # man-preview   open a specified man page in Preview
  # trash         move a specified file to the Trash
  # showfiles 	  show hidden files
  # hidefiles 	  hide the hidden files
  # itunes 	      control iTunes. Use itunes -h for usage details
  # spotify 	    control Spotify and search by artist, album, track…
  # rmdsstore 	  remove .DS_Store files recursively in a directory
  last-working-dir # Keeps track of the last used working directory and automatically jumps into it for new shells
)

autoload -U compinit && compinit #reloading completion for zsh-completions plugin

# Activate Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TIME=fr_FR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='code'
else
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Include Z. Jump around quickly to frequently visited directories
. /usr/local/etc/profile.d/z.sh

# Load zsh Aliases file if included in dotfiles folder
# using the . builtin (aka source)
if [ -f $DOTFILES/aliases.zsh ]; then
  . $DOTFILES/aliases.zsh
fi

# Load zsh Functions file if included in dotfiles folder
# using the . builtin (aka source)
if [ -f $DOTFILES/functions.zsh ]; then
  . $DOTFILES/functions.zsh
fi

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
export PATH=$HOME/.nvm:$PATH
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ZSH history configuration
alias hh=hstr                   # hh to be alias for hstr
bindkey -s "\C-r" "\eqhstr\n"   # bind hstr to Ctrl-r (for Vi mode check doc)
HISTFILE=~/.zsh_history  # ensure history file visibility
HSTR_CONFIG=hicolor      # get more colors
setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals

# Java install location
export JAVA_HOME="/usr/local/Cellar/openjdk@11/11.0.12"

# CLI History settings
export HISTTIMEFORMAT="%h %d %H:%M:%S " # add date & time to records
export HISTSIZE=50000                   # n commands to remember
export HISTFILESIZE=50000               # n lines in history file
export PROMPT_COMMAND='history -a'      # store history immediately
export HISTCONTROL=ignoreboth:erasedups # ignore duplicates & empty cmds

# Yarn Version Manager - https://yvm.js.org/docs/overview
export YVM_DIR=/Users/niic/.yvm
[ -r $YVM_DIR/yvm.sh ] && source $YVM_DIR/yvm.sh