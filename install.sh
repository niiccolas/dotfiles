#!/bin/sh

#The installation/setup script is contained within a function
macSetup() {
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
}

# Ask for user confirmation before running the installation script
echo "\n\e[31m******************************************************************\e[0m"
echo -e '\033[1m\e[31m* 🤖 Setting up your Mac!                                        *\e[0m'
echo "\e[31m* This script will install apps & change your computer settings  *\e[0m"
echo "\e[31m******************************************************************\e[0m"
while true; do
    read "response?Are you sure you want to proceed? [y/n]"
    response=${response:l} #tolower
    case "$response" in
        [yY]*)
            macSetup
            echo "\n👌 Installation complete.\n Some of the changes require a logout/restart to take effect."
            break
            ;;
        [nN]*)
            echo "Installation canceled! Bye. 👋\n"
            return 1
            ;;
         *)
            echo '\e[31mInvalid input. Answer typing \e[7my\e[27mes or \e[7mn\e[27mo \e[0m\n' >&2
    esac
done