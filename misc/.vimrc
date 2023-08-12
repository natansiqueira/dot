call plug#begin()

"
" Plugins
" 

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" syntax highlight
syntax on

" use dark colors from colorscheme
set background=dark

" file encoding
set encoding=utf-8

" show line numbers
set number

" show line numbers related to the current line
" so you can easily navigate with :[+-]n (n -> line number)
set relativenumber

" tab size
set tabstop=2

" number of spaces when tab is pressed
set softtabstop=2

" number of spaces on a new line
set shiftwidth=2

" smart indentation
set autoindent
set smartindent
set smarttab
set expandtab

" enables mouse on INSERT mode
set mouse=a

" copy and paste
set clipboard=unnamedplus

" ignore case when searcing
set ignorecase
set smartcase

" incremental search
set incsearch

" highlight search matches
set hlsearch

" no swapfile
set noswapfile

"
" mapped keys
"

" clear highlited matches
" <CR> = Enter Key
" noh = nohlsearch
nnoremap <CR> :noh<CR>

" open fzf
" <C-p> = Ctrl + p
nnoremap <C-p> :Files %:p:h<CR>
