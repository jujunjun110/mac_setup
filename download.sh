function command_exists {
  command -v "$1" > /dev/null;
}

function brew_install_if_not_exist {
if ! command_exists $1 ; then
  echo " ------------ $1 ------------"
  brew install $1
  $1 --version
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

brew_install_if_not_exist git
brew_install_if_not_exist mas

brew_install_if_not_exist pyenv
brew_install_if_not_exist rbenv
brew_install_if_not_exist nodenv
brew_install_if_not_exist goenv



# brew cask install Karabiner-Elements
# brew cask install alfred
# brew cask install bettertouchtooL

# brew cask install sublime-text

#brew cask install iterm2
#brew cask install google-chrome
# Automatically hide or show

# the Dock （Dock を自動的に隠す）
defaults write com.apple.dock autohide -bool true
# Wipe all app icons from the Dock （Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない）
defaults write com.apple.dock persistent-apps -array
# Set the icon size （アイコンサイズの設定）
defaults write com.apple.dock tilesize -int 30
# Magnificate the Dock （Dock の拡大機能を入にする）
defaults write com.apple.dock magnification -bool false

#cp $(PWD)/.zshrc ~/.zshrc
mkdir -p ~/.config
cp $(PWD)/karabiner.json ~/.config/karabiner/karabiner.json
zsh > bash-profile
zsh
-