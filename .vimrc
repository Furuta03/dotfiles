" 文字エンコーディングの設定
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8

" プラグインのインストールと設定
call plug#begin()
Plug 'kamykn/spelunker.vim'
Plug 'simeji/winresizer'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bronson/vim-trailing-whitespace'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'iberianpig/tig-explorer.vim'
Plug 'jwalton512/vim-blade'
call plug#end()

" ファイルエンコーディングとフォーマットの設定
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" インデントとタブの設定
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2

" 検索の設定
set incsearch
set ignorecase
set smartcase
set hlsearch

" バックスペースの設定
set backspace=indent,eol,start

" カーソル移動と表示設定
set whichwrap=b,s,h,l,<,>,[,],~
set number
set nospell
set noswapfile
set belloff=all
set re=0

" カーソル移動のマッピング
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" コマンド補完と履歴
set wildmenu
set history=5000

" プラグインの設定
let g:closetag_filenames = '*.html,*.vue'
let g:indent_guides_enable_on_vim_startup = 1
let mapleader = "\<Space>"

" 括弧の自動補完
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" カーソル移動と編集のマッピング
noremap <C-z> $
nnoremap ss :<C-u>sp<CR><C-w>j
nnoremap sv :<C-u>vs<CR><C-w>l
inoremap <TAB> <C-n>
nnoremap <C-w>H :vertical resize -5<CR>
nnoremap <C-w>L :vertical resize +5<CR>
nnoremap <C-w>J :resize +5<CR>
nnoremap <C-w>K :resize -5<CR>

" fzfのマッピング
nnoremap <silent> fzf :GFiles<CR>
nnoremap <silent> bff :Buffers<CR>
nnoremap <C-g> :Rg<CR>

" lspのマッピング
" nnoremap <silent> pd :LspPeekDefinition<CR>
nnoremap <silent> gd :LspPeekDefinition<CR>
nnoremap <silent> ww :LspDefinition<CR>
" nnoremap <silent> df :LspDocumentFormat<CR>
" nnoremap <silent> jd :LspTypeDefinition<CR> " これをONにすると異様にカーソル下移動が重くなる
nnoremap <silent> rn :LspRename<CR>

" ALEの設定
let g:ale_fixers = {
\   'php': ['phpcbf'],
\   'html': ['prettier'],
\}
let g:ale_php_phpcbf_standard = 'PSR2'
let g:ale_php_phpcbf_executable = 'phpcbf'
let g:ale_php_phpcbf_options = '--extensions=ctp'
let g:ale_html_prettier_options = '--parser html'
let g:ale_history_log_output = 1
let g:ale_fix_on_save = 1
let g:ale_log_to_file = 1
au BufRead,BufNewFile *.ctp set filetype=php.html
nnoremap <silent> <leader>f :ALEFix<CR>

" tig-explorerの設定
nnoremap <Leader>T :TigOpenCurrentFile<CR>
nnoremap <Leader>t :TigOpenProjectRootDir<CR>
nnoremap <Leader>g :TigGrep<CR>
nnoremap <Leader>r :TigGrepResume<CR>
vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>
nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>
nnoremap <Leader>b :TigBlame<CR>
