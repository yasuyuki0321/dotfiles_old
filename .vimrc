" 行番号を表示
set number

" □や○文字が崩れる問を解決
set ambiwidth=double

" クリップボードを使用
set clipboard=unnamed,autoselect

"ビープ音すべてを無効にする
set visualbell t_vb=

"エラーメッセージの表示時にビープを鳴らさない"
set noerrorbells

" 検索するときに大文字小文字を区別しない
set ignorecase

" 検索文字列に大文字と小文字が混在した場合に限り、大文字と小文字を区別して検索
set smartcase

" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan

" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch

" 検索結果をハイライト表示
set hlsearch

" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells

" 対応する括弧やブレースを表示
set showmatch
set  matchtime=1

" ステータス行を常に表示
set laststatus=2

" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd

" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab

" インデント幅
set shiftwidth=4

" タブキー押下時に挿入される文字幅を指定
set softtabstop=4

" ファイル内にあるタブ文字の表示幅
set tabstop=4

" 改行時に前の行のインデントを継続する
set autoindent

" スワップファイルを作成しない
set noswapfile

" シンタックスハイライト
syntax on

" コマンドモードの補完
set wildmenu


" NeoBundleのインストール
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------
" ここに追加したいVimプラグインを記述する

" カラースキームmolokai
NeoBundle 'tomasr/molokai'

" ステータスラインの表示内容強化
NeoBundle 'itchyny/lightline.vim'

" 末尾の全角と半角の空白文字を赤くハイライト
NeoBundle 'bronson/vim-trailing-whitespace'

" 括弧の補完
NeoBundle 'cohama/lexima.vim'

" ifやdef、doに対するendの自動補完などを行う
NeoBundle 'tpope/vim-endwise'

" インデントの可視化
NeoBundle 'Yggdroot/indentLine'

" 編集中のファイルを素早く実行
NeoBundle 'thinca/vim-quickrun'

" 横分割をするようにする
let g:quickrun_config={'*': {'split': ''}}
" 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}

" 文字列を囲っている引用符や括弧を編集することができる
NeoBundle 'tpope/vim-surround'

" コメントアウトが簡単にできる
NeoBundle 'tomtom/tcomment_vim'

" ファイル検索用のプラグイン'
NeoBundle 'kien/ctrlp.vim'

"----------------------------------------------------------
call neobundle#end()

" カラースキームをmolokaiに変更
if neobundle#is_installed('molokai') " molokaiがインストールされていれば
    colorscheme molokai " カラースキームにmolokaiを設定する
endif

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck

" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> : nohlsearch<CR><ESC>
nnoremap <C-o><C-n> : set number <Esc>
nnoremap <C-n><C-n> : set nonumber <Esc>
nnoremap <C-o><C-p> : set paste <Esc>
nnoremap <C-n><C-p> : set nopaste <Esc>

let mapleader = "\<Space>"
nnoremap <silent> <leader>tf :<c-u>tabfirst<cr>
nnoremap <silent> <leader>tl :<c-u>tablast<cr>
nnoremap <silent> <leader>tn :<c-u>tabnext<cr>
nnoremap <silent> <leader>tN :<c-u>tabNext<cr>
nnoremap <silent> <leader>tp :<c-u>tabprevious<cr>
nnoremap <silent> <leader>te :<c-u>tabedit<cr>
nnoremap <silent> <leader>tc :<c-u>tabclose<cr>
nnoremap <silent> <leader>to :<c-u>tabonly<cr>
nnoremap <silent> <leader>ts :<c-u>tabs<cr>

