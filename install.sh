#!/bin/sh

macInstallation() {
  # Ask for the administrator password upfront
  sudo -v
  # Keep-alive: update existing `sudo` time stamp until `install.sh` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
  
  ########################################
  # SET COMPUTER NAME & LOGIN MSG
  echo "\033[31m\n******************************************************************\033[0m"
  read -p "Choose a name for your computer: "
  echo "\033[31m******************************************************************\033[0m"
  sudo scutil --set ComputerName $REPLY
  sudo scutil --set LocalHostName $REPLY
  sudo scutil --set HostName $REPLY
  
  read -p "Choose a login window message: "
  echo $REPLY
  sudo defaults write   /Library/Preferences/com.apple.loginwindow  LoginwindowText "$REPLY"
  echo "\033[31m******************************************************************\033[0m"
  echo "\033[31m  Installation started. Please be patient \033[0m"
  echo "\033[31m******************************************************************\033[0m"
  
  ########################################
  # HOMEBREW
  if test ! $(which brew); then # Install if absent
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew update # Update Homebrew recipes
  brew tap homebrew/bundle # Install dependencies (See Brewfile)
  brew bundle
  brew cask upgrade # Upgrade installed Brew Casks
  chsh -s $(which zsh) # Make ZSH the default shell environment
  npm install --global yarn # Install global NPM packages
  
  ########################################
  # APACHE SITES DIRECTORY
  mkdir $HOME/Sites
  
  ########################################
  # DOTFILES
  # Remove any dotfile from user's $HOME
  # Symlink repo's dotfile to user's $HOME
  
  # Oh-My-Zsh
  rm -rf $HOME/.zshrc
  ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
  
  # Vim
  rm -rf $HOME/.vimrc
  ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
  vim +PlugInstall +qall
  
  # Git
  rm -rf $HOME/.gitconfig
  ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
  rm -rf $HOME/.gitmessage.txt
  ln -s $HOME/.dotfiles/.gitmessage.txt $HOME/.gitmessage.txt
  rm -rf $HOME/.gitignore_global
  ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global
  rm -rf $HOME/.git-templates
  mkdir -p $HOME/.git-templates/hooks
  ln -s $HOME/.dotfiles/hooks/pre-commit  $HOME/.git-templates/hooks/pre-commit
  git config --global init.templatedir $HOME/.git-templates
  
  # User Fonts
  sudo rm -rf $HOME/Library/Fonts
  ln -s $HOME/Sync/Fonts $HOME/Library/Fonts
  
  # Mackup
  ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg
  
  # SQLite3
  rm -rf $HOME/.sqliterc
  ln -s $HOME/.dotfiles/.sqliterc $HOME/.sqliterc
  
  ########################################
  # iTerm2 Shell Integration
  curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
  # Set iTerm2 preferences directory
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2"
  # Tell iTerm2 to use the custom preferences in the directory
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
  
  # Set-up custom oh-my-zsh AGNOSTIME theme
  sudo rm -rf $HOME/.oh-my-zsh/themes/agnostime.zsh-theme
  ln -s $HOME/.dotfiles/oh-my-zsh/themes/agnostime.zsh-theme $HOME/.oh-my-zsh/themes/agnostime.zsh-theme
  
  ########################################
  # RUBY
  rbenv install 2.5.1
  rbenv global 2.5.1 # set 2.5.1 to global default
  rbenv rehash # rehash to update environment
  gem install bundler pry byebug solargraph # Gems
  
  ########################################
  # NODE VERSION MANAGER
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  
  ########################################
  # SET MACOS PREFERENCES
  # We will run this last because this will reload the shell
  source .macos
  
  ########################################
  # PARAGON NTFS
  if [ ! -e /Applications/NTFS\ for\ Mac.app ]
  then
    open -a /usr/local/Caskroom/paragon-ntfs/15/FSInstaller.app
  fi
  
  ########################################
  # MPV CONFIG FOLDER
  if [ -e ~/.config/mpv ]
  then
    sudo rm -rf ~/.config/mpv/mpv.conf
  else
    mkdir ~/.config/mpv
  fi
  ln -s ~/.dotfiles/mpv/mpv.conf ~/.config/mpv/mpv.conf
}

echo "\n\033[31m******************************************************************\033[0m"
echo "\033[1m\033[31m* 🤖 Setting up your Mac!                                        *\033[0m"
echo "\033[31m* This script will install apps & change your computer settings  *\033[0m"
echo "\033[31m******************************************************************\033[0m"

while true; do
  read -p "Proceed? (y/n): " -n 1 -r
  case "$REPLY" in
    [yY]*)
      macInstallation
      echo "\n\033[31m******************************************************************\033[0m"
      echo "\033[1m\033[31m* 👌 Installation complete.                                      *\033[0m"
      echo "\033[31m* Some of the changes require a logout/restart to take effect    *\033[0m"
      echo "\033[31m******************************************************************\n\033[0m"
      break
    ;;
    [nN]*)
      echo "\n\033[31m******************************************************************\033[0m"
      echo "Installation canceled!\nBye. 👋\n"
      break
    ;;
    *)
      echo "\n\033[31mInvalid input!" >&2
      echo "Answer by typing \033[7my\033[27mes or \033[7mn\033[27mo \033[0m\n" >&2
  esac
done