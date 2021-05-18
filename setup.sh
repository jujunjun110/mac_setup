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

brew bundle

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
