function command_exists {
  command -v "$1" > /dev/null;
}

function cask_installed {
  # ls /usr/local/Caskroom/ | grep $1 > /dev/null;
  ls /usr/local/Caskroom/ | grep -sq $1;
}

function brew_install_if_not_installed {
  if command_exists $1 ; then
    echo "$1 already installed."
    return 
  fi

  echo " ------------ $1 ------------"
  brew install $1
  $1 --version
  echo " ------------ END ------------"
}

function cask_install_if_not_installed {
  if cask_installed $1 ; then
    echo "$1 already installed."
    return
  fi

  echo " ------------ $1 ------------"
  brew cask install $1
  echo " ------------ END ------------"
}

if ! command_exists brew ; then
  echo " --------- Homebrew ----------"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew upgrade --all --cleanup
  brew -v
  echo " ------------ END ------------"
fi

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock orientation -string "left"

defaults write -g com.apple.trackpad.scaling 6
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 30

cp -r $(PWD)/dotfiles/.vim ~/
cp $(PWD)/dotfiles/.vimrc ~/
cp $(PWD)/dotfiles/.zshrc ~/
cp $(PWD)/dotfiles/.gitconfig ~/

mkdir -p ~/.config/karabiner
cp $(PWD)/karabiner.json ~/.config/karabiner/karabiner.json

echo zsh > ~/.bash_profile
zsh

brew_install_if_not_installed git
brew_install_if_not_installed mas
brew_install_if_not_installed zsh
cask_install_if_not_installed iterm2

cask_install_if_not_installed keycastr
cask_install_if_not_installed karabiner-elements
cask_install_if_not_installed alfred
cask_install_if_not_installed bettertouchtool
cask_install_if_not_installed clipy

cask_install_if_not_installed sublime-text
cask_install_if_not_installed google-chrome
cask_install_if_not_installed firefox
cask_install_if_not_installed google-japanese-ime
cask_install_if_not_installed franz
cask_install_if_not_installed zoomus

brew_install_if_not_installed tree
brew_install_if_not_installed colordiff
brew_install_if_not_installed rails
brew_install_if_not_installed gibo
brew_install_if_not_installed mono
brew_install_if_not_installed openssl
brew_install_if_not_installed mysql
brew_install_if_not_installed hub

cask_install_if_not_installed dropbox
cask_install_if_not_installed google-backup-and-sync
cask_install_if_not_installed visual-studio-code

cask_install_if_not_installed dotnet
brew_install_if_not_installed pyenv
brew_install_if_not_installed rbenv
brew_install_if_not_installed nodenv
brew_install_if_not_installed goenv
brew_install_if_not_installed pipenv
cask_install_if_not_installed blender
cask_install_if_not_installed unity-hub
cask_install_if_not_installed sketch
cask_install_if_not_installed docker

mas install 497799835 # Xcode
mas install 539883307 # LINE
mas install 409183694 # Keynote
mas install 668208984 # GIPHY
mas install 915542151 # Monity
 
if !(which python | grep -sq shims); then
  pyenv install $(pyenv install -l | grep -v - | tail -1)
  pyenv global $(pyenv install -l | grep -v - | tail -1)
  pyenv rehash
fi

if !(which ruby | grep -sq shims); then
  rbenv install $(rbenv install -l | grep -v - | tail -1)
  rbenv global $(rbenv install -l | grep -v - | tail -1)
  rbenv rehash
fi