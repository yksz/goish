" 基本設定
set nocompatible " vi互換を解除する
set encoding=utf-8
set fileencodings=iso-2022-jp,sjis,euc-jp,utf-8
set fileformat=unix
set clipboard+=unnamed " クリップボードを使用する
set backspace=indent,eol,start " Backspaceで削除を可能にする
set visualbell t_vb= " ビープ音を無効にする

" 画面表示の設定
set number " 行番号を表示する
set cursorline " カーソル行を強調表示する
set laststatus=2 " ステータス行を常に表示する
set splitbelow " 横分割時に新しいウィンドウを下に開く
set splitright " 縦分割時に新しいウィンドウを右に開く
set list " 不可視文字を表示する
set listchars=tab:»\ ,trail:~ " 不可視文字の表示文字を設定する
highlight SpecialKey ctermfg=grey " 不可視文字の文字色を指定する

" タブとインデントの設定
set autoindent " 自動インデントを有効にする
set cindent " C言語用の自動インデントを有効にする
set expandtab " タブを空白に置き換える．":set noet" で元に戻る
set tabstop=4 " タブ幅を設定する
set shiftwidth=4 " インデント幅を設定する

" 検索と置換の設定
set hlsearch " 検索結果をハイライト表示する
set incsearch " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase " 検索文字列に大文字が含まれていたら大文字と小文字を区別する

" コマンドラインの設定
set wildmode=list,full " タブキーによるファイル名補完を有効にする

" BEFORE - Plugin settings
filetype off
filetype plugin indent off

" Plugin settings
if filereadable(expand('~/.vimrc.plugin'))
    source ~/.vimrc.plugin
endif

" Color scheme settings
set t_Co=256
colorscheme molokai

" Ctags settings
set tags=.tags

" Lisp settings
set lispwords-=if

" Scheme settings
set lispwords+=call-with-input-file
set lispwords+=call-with-output-file
autocmd FileType scheme set cindent&

" Groovy settings
autocmd FileType groovy set cindent&

" Golang settings
set runtimepath+=$GOROOT/misc/vim
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" AFTER - plugin settings
filetype plugin indent on
syntax on

" FileType setting
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
autocmd BufNewFile,BufRead *.{gradle*} set filetype=groovy

" Indent setting
autocmd BufNewFile,BufRead *.{html,css,js,scala*} setlocal tabstop=2 shiftwidth=2