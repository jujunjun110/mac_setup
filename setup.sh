function command_exists {
    command -v "$1" > /dev/null;
}

if ! command_exists brew ; then
    echo " --------- Homebrew ----------"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    brew update
    brew upgrade --all --cleanup
    brew -v
    echo " ------------ END ------------"
fi

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write com.apple.dock autohide -bool false
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock orientation -string "left"

defaults write -g com.apple.trackpad.scaling 6
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 30

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false


cp -r $(PWD)/dotfiles/.vim ~/
cp $(PWD)/dotfiles/.vimrc ~/
cp $(PWD)/dotfiles/.zshrc ~/
cp $(PWD)/dotfiles/.gitconfig ~/
echo .DS_Store > ~/.gitignore

mkdir -p ~/.config/karabiner
cp $(PWD)/karabiner.json ~/.config/karabiner/karabiner.json

echo zsh > ~/.bash_profile

brew bundle install
