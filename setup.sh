function command_exists {
  command -v "$1" > /dev/null;
}

function cask_installed {
  ls /usr/local/Caskroom/ | grep $1 > /dev/null;
}

function brew_install_if_not_exists {
if ! command_exists $1 ; then
  echo " ------------ $1 ------------"
  brew install $1
  $1 --version
  echo " ------------ END ------------"
else 
  echo "$1 already installed."
fi
}

function cask_install_if_not_exists {
if ! cask_installed $1 ; then
  echo " ------------ $1 ------------"
  brew cask install $1
  echo " ------------ END ------------"
else 
  echo "$1 already installed."
fi
}

if ! command_exists brew ; then
  echo " --------- Homebrew ----------"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew upgrade --all --cleanup
  brew -v
  echo " ------------ END ------------"
fi

brew_install_if_not_exists git
brew_install_if_not_exists mas
brew_install_if_not_exists pyenv
brew_install_if_not_exists rbenv
brew_install_if_not_exists nodenv
brew_install_if_not_exists goenv
brew_install_if_not_exists pipenv


cask_install_if_not_exists sublime-text
cask_install_if_not_exists iterm2
cask_install_if_not_exists google-chrome
cask_install_if_not_exists google-japanese-ime
cask_install_if_not_exists microsoft-office

cask_install_if_not_exists unity
cask_install_if_not_exists sketch
cask_install_if_not_exists franz
cask_install_if_not_exists dropbox

cask_install_if_not_exists clipy
cask_install_if_not_exists karabiner-elements
cask_install_if_not_exists alfred
cask_install_if_not_exists bettertouchtool

mas install 539883307 # LINE
mas install 409183694 # Keynote

defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock magnification -bool false

defaults write -g com.apple.trackpad.scaling 6
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 5

cp -r $(PWD)/dotfiles/.vim ~/
cp $(PWD)/dotfiles/.vimrc ~/
cp $(PWD)/dotfiles/.zshrc ~/
cp $(PWD)/dotfiles/.gitconfig ~/

mkdir -p ~/.config/karabiner
cp $(PWD)/karabiner.json ~/.config/karabiner/karabiner.json

echo zsh > ~/.bash_profile
zsh
