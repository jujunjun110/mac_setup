"ローカルの.vimrcからこんなかんじでリンクを貼る
"if filereadable(expand('~/Dropbox/setting_files/.vimrc'))
"  source ~/Dropbox/setting_files/.vimrc
"endif''))
" もしくは ls -s ~/Dropbox/setting_files/.vimrc .vimrc

let &t_Co=256

:syntax on
:colorscheme jellybeans

set nocompatible


set backspace=indent,eol,start

" 行数を表示
set number

" タイトルを表示
set title

" 行端で折り返せるように
set whichwrap=b,s,h,l<,>,[,]]


set encoding=utf-8
set fileencodings=utf-8


" 【インデント系】
" インデントをかっこ良くする
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4

" タブをタブとして扱う(スペースに展開しない)
set noexpandtab


" 【検索系】
" ファイルを末尾まで検索したら先頭に戻る
set wrapscan

" 検索時に大文字小文字を区別しない
set noignorecase
set showmatch

" 検索結果文字列のハイライトを有効にする
set hlsearch


" 【ステータスライン周辺】
" 表示切り替えにかかる秒数
set timeoutlen=1

" コマンドなどを表示
set laststatus=2
set cmdheight=1

" スクロールする時に下が見えるようにする
set scrolloff=5

" 入力中のコマンド表示
set showcmd

" 挿入モードとノーマルモードでステータスラインの色変更
" ノーマルモードは青色
" 挿入モードは赤色
au InsertEnter * hi StatusLine guifg=White guibg=DarkRed gui=none ctermfg=White ctermbg=Red cterm=none
au InsertLeave * hi StatusLine guifg=White guibg=Blue gui=none ctermfg=White ctermbg=Blue cterm=none
" 行列表示
set ruler

" .swapファイルを作らない
set noswapfile

" ビープ音を消す
set visualbell t_vb=
set noerrorbells

" マウスモード
" set mouse=a

" Emacs風の行頭・行末
noremap <C-a> <Home>
noremap <C-e> <End>

" insert時にカーソルの形状を変える
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 文字列中のHTMLをハイライトする
let php_htmlInStrings=1

" 文字列中のSQLをハイライトする
let php_sql_query=1

:inoremap jj <Esc>

"全角文字の場合はカーソルの色を変える
if has('multi_byte_ime')
	highlight Cursor guifg=NONE guibg=#b0d0f0
	highlight CursorIM guifg=NONE guibg=#cf6a4c
endif

"カーソルを点滅させない
set guicursor=a:blinkon0

nnoremap<ESC><ESC> :nohlsearch<CR>

