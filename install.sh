#!/bin/sh

#The installation/setup script is contained within a function
macSetup() {
  # Ask for the administrator password upfront
  sudo -v
  echo "\033[31m\n******************************************************************\033[0m"

  # Set a custom computer name
  read -p "Type a computer name: " #-n 1 -r
  # echo "Choose a name for your computer:"; read computerName
  echo "\033[31m******************************************************************\033[0m"
  sudo scutil --set ComputerName $REPLY
  sudo scutil --set LocalHostName $REPLY
  sudo scutil --set HostName $REPLY
  #sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb. server NetBIOSName -string $REPLY

  # Set a custom message for the computer login window
  read -p "Type a login message: " #-n 1 -r
  echo $REPLY
  sudo defaults write   /Library/Preferences/com.apple.loginwindow  LoginwindowText "$REPLY"
  echo "\033[31m******************************************************************\033[0m"

  # Keep-alive: update existing `sudo` time stamp until `install.sh` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  echo "\033[31m  Installation started. Please be patient \033[0m"
  echo "\033[31m******************************************************************\033[0m"

  # Check for Homebrew and install if we don't have it
  if test ! $(which brew); then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Update Homebrew recipes
  brew update

  # Install all our dependencies with bundle (See Brewfile)
  brew tap homebrew/bundle
  brew bundle

  # Make ZSH the default shell environment
  chsh -s $(which zsh)

  # Install global NPM packages
  npm install --global yarn

  # Create a Sites directory
  # A default directory for macOS user accounts that doesn't come pre-installed
  mkdir $HOME/Sites

  # Remove .zshrc from $HOME (if it exists)...
  rm -rf $HOME/.zshrc
  # and symlink the .zshrc file from the .dotfiles...
  ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

  # Remove .vimrc from $HOME (if it exists)...
  rm -rf $HOME/.vimrc
  # and symlink the .vimrc file from the .dotfiles...
  ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc
  # then run the plugins installation
  vim +PlugInstall +qall

  # Remove .gitconfig from $HOME (if it exists)...
  rm -rf $HOME/.gitconfig
  # and symlink the .gitconfig file from the .dotfiles
  ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

  # Remove .gitmessage.txt from $HOME (if it exists)...
  rm -rf $HOME/.gitmessage.txt
  # and symlink the .gitmessage.txt file from the .dotfiles
  ln -s $HOME/.dotfiles/.gitmessage.txt $HOME/.gitmessage.txt

  # Remove .gitignore_global from $HOME (if it exists)...
  rm -rf $HOME/.gitignore_global
  # and symlink the .gitignore_global file from the .dotfiles
  ln -s $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

  # Symlink the Mackup config file to the home directory
  ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

  # Install iterm2 Shell Integration
  curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

  # Set macOS preferences
  # We will run this last because this will reload the shell
  source .macos

  # Delete existing user fonts folder...
  sudo rm -rf ~/Library/Fonts
  # and Symlink Sync.com's fonts folder
  ln -s ~/Sync/Fonts ~/Library/Fonts

  # Launch Paragon NTFS installation if the program is not installed yet
  if [ ! -e /Applications/NTFS\ for\ Mac.app ]
  then
    open -a /usr/local/Caskroom/paragon-ntfs/15/FSInstaller.app
  fi
}

# Ask for user confirmation before running the installation script
echo "\n\033[31m******************************************************************\033[0m"
echo "\033[1m\033[31m* 🤖 Setting up your Mac!                                        *\033[0m"
echo "\033[31m* This script will install apps & change your computer settings  *\033[0m"
echo "\033[31m******************************************************************\033[0m"

while true; do
   read -p "Proceed? (y/n): " -n 1 -r
    case "$REPLY" in
        [yY]*)
            macSetup
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
            echo "Answer typing \033[7my\033[27mes or \033[7mn\033[27mo \033[0m\n" >&2
    esac
done