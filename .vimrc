set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

call plug#begin()
Plug 'simeji/winresizer'
Plug 'posva/vim-vue'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'pmsorhaindo/syntastic-local-eslint.vim'
Plug 'tomasr/molokai'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'udalov/kotlin-vim'
call plug#end()

set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅

set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
set backspace=indent,eol,start " backSpaceをinsertModeで有効に

set number
set cursorline
set cursorcolumn

set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

let g:closetag_filenames = '*.html,*.vue' " 閉じタグ自動補完

let g:indent_guides_enable_on_vim_startup = 1 "インデント可視化

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
noremap :tree :NERDTree
noremap <C-z> $
inoremap <TAB> <C-n>

" 補完用plugin:deopleteの設定------------------------------
"pythonの自動補完プラグイン
Plug 'deoplete-plugins/deoplete-jedi'
"Vim用自動補完プラグイン
Plug 'Shougo/neco-vim'

" fzf-----------------------------------------------------
nnoremap <silent> fzf :GFiles<CR>
nnoremap <silent> ls :Buffers<CR>

" Syntasticの設定------------------------------------------
" 構文エラーに>>を表示
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1

" Javascript用. 構文エラーチェックにESLintを使用
let g:syntastic_javascript_checkers=['eslint']
" Javascript以外は構文エラーチェックをしない
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': [] }


"molokaiの設定---------------------------------------------
colorscheme molokai " カラースキームにmolokaiを設定する
syntax enable " 構文に色を付ける

"ステータスバーテーマの設定--------------------------------
let g:airline_theme = 'deus'
