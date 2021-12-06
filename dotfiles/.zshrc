alias ls='ls -G'
alias la='ls -ao'
alias ll='ls -lo'
alias vi='vim'
alias ci='vim'
alias tree='tree -N'
alias op='open .'
alias lh='open -a "/Applications/Google Chrome.app" http://localhost'
alias gti='git'
alias oprn='open'
alias ai='git ai'
alias ci='git ci'
alias py='python'
alias pe='pipenv'
alias be='bundle exec'
alias rb='ruby'
alias tenki='curl "http://wttr.in/Tokyo?lang=ja"'
alias diff='colordiff -u'
alias rider='open -na "Rider.app" --args "$@"'
#alias crontab='crontab -i'

#alias python='python -B' 
alias uni='/Applications/Unity/Unity.app/Contents/MacOS/Unity -projectPath `pwd` &'
alias jump='source ~/Dropbox/setting_files/shell_commands/jump.sh'

umask 022
ulimit -c 0

export PATH=$PATH:~/Library/Android/sdk/platform-tools/

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

precmd () {
  echo -ne "\e]2;${PWD}\a"
  echo -ne "\e]1;${PWD}\a"
}


## 補完候補の色づけ
#export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors LS_COLORS

## エディター
export EDITOR=/usr/bin/vim

## 履歴の保存先
HISTFILE=$HOME/.zsh-history
## メモリに展開する履歴の数
HISTSIZE=100000
## 保存する履歴の数
SAVEHIST=100000

## 補完機能の強化
autoload -U compinit
compinit

## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
## Emacsライクキーバインド設定
bindkey -e

## 色を使う
setopt prompt_subst
## ビープを鳴らさない
setopt nobeep
## 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
## 補完候補を一覧表示
setopt auto_list
## 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
## cd 時に自動で push
setopt auto_pushd
## 同じディレクトリを pushd しない
setopt pushd_ignore_dups
## ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob
## TAB で順に補完候補を切り替える
setopt auto_menu
## zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history
## =command を command のパス名に展開する
setopt equals
## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
## ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify
## ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
## 出力時8ビットを通す
setopt print_eight_bit
## ヒストリを共有
setopt share_history
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1

## ディレクトリ名だけで cd
setopt auto_cd
## カッコの対応などを自動的に補完
setopt auto_param_keys
## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
## スペルチェック
setopt correct
## {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
## Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control
## コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space
## コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
## ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
## history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
## 補完候補を詰めて表示
setopt list_packed
## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash

# ----- PROMPT -----

PROMPT='[%n@%m]%# '

## RPROMPT
RPROMPT=$'`branch-status-check` [%F{green}%d%f]' # %~はpwd



setopt prompt_subst #表示毎にPROMPTで設定されている文字列を評価する
 
# {{{ methods for RPROMPT
# fg[color]表記と$reset_colorを使いたい
# @see https://wiki.archlinux.org/index.php/zsh
autoload -U colors; colors
function branch-status-check {
    local prefix branchname suffix
        # .gitの中だから除外
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
            return
        fi
        branchname=`get-branch-name`
        # ブランチ名が無いので除外
        if [[ -z $branchname ]]; then
            return
        fi
        prefix=`get-branch-status` #色だけ返ってくる
        suffix='%{'${reset_color}'%}'
        echo ${prefix}${branchname}${suffix}
}
function get-branch-name {
    # gitディレクトリじゃない場合のエラーは捨てます
    echo `git rev-parse --abbrev-ref HEAD 2> /dev/null`
}
function get-branch-status {
    local res color
        output=`git status --short 2> /dev/null`
        if [ -z "$output" ]; then
            res=':' # status Clean
            color='%{'${fg[green]}'%}'
        elif [[ $output =~ "[\n]?\?\? " ]]; then
            res='?:' # Untracked
            color='%{'${fg[yellow]}'%}'
        elif [[ $output =~ "[\n]? M " ]]; then
            res='M:' # Modified
            color='%{'${fg[red]}'%}'
        else
            res='A:' # Added to commit
            color='%{'${fg[cyan]}'%}'
        fi
        # echo ${color}${res}'%{'${reset_color}'%}'
        echo ${color} # 色だけ返す
}
# }}}

# It seems that, newly creating SSH_AUTH_SOCK will
# break the chain of ssh forwarding.

ssh_add_if_exist() {
    if [ -f "$1" ]
    then
        ssh-add "$1" 2> /dev/null
    fi
}
 
ssh_add_if_exist "$HOME/.ssh/id_rsa"

# source ~/.cargo/env
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.goenv/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"

eval "$(rbenv init -)"
eval "$(goenv init -)"
eval "$(nodenv init -)"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
