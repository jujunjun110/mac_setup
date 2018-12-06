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

cask_install_if_not_exists sketch
cask_install_if_not_exists clipy
cask_install_if_not_exists franz
cask_install_if_not_exists dropbox
cask_install_if_not_exists karabiner-elements
cask_install_if_not_exists alfred
cask_install_if_not_exists bettertouchtool
cask_install_if_not_exists sublime-text
cask_install_if_not_exists iterm2
cask_install_if_not_exists google-chrome
cask_install_if_not_exists google-japanese-ime
cask_install_if_not_exists unity

mas install 539883307 # LINE
mas install 409183694 # Keynote

# Automatically hide or show the Dock （Dock を自動的に隠す）
defaults write com.apple.dock autohide -bool true
# Wipe all app icons from the Dock （Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない）
defaults write com.apple.dock persistent-apps -array
# Set the icon size （アイコンサイズの設定）
defaults write com.apple.dock tilesize -int 50
# Magnificate the Dock （Dock の拡大機能を入にする）
defaults write com.apple.dock magnification -bool false

defaults write -g com.apple.trackpad.scaling 6

mkdir -p ~/.config
cp $(PWD)/dotfiles/.zshrc ~/
cp $(PWD)/dotfiles/.vimrc ~/
cp $(PWD)/dotfiles/.gitconfig ~/
cp -r $(PWD)/dotfiles/.vim ~/
cp $(PWD)/karabiner.json ~/.config/karabiner/karabiner.json
echo zsh > ~/.bash_profile
zsh
