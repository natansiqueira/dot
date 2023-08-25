call plug#begin()

  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'

call plug#end()


" use vim settings
set nocompatible

" file encoding
set encoding=utf-8

" backspace in normal mode
set backspace=indent,eol,start

" show incomplete commands
set showcmd

" show current mode
set showmode

" no sounds
" set visualbell

" reload files change outside vim
set autoread

set hidden
set laststatus=2
set cursorline
set scrolloff=5
set showmatch

colorscheme simple-dark

" leader
let mapleader = ";"

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
noremap <leader>x :tabclose<cr>

" ruler
set ruler
set textwidth=200
set colorcolumn=120

" syntax highlighting
syntax on

" show line numbers
set number
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

" ignore case when searcing
set ignorecase
set smartcase

" incremental search
set incsearch

" highlight search matches
set hlsearch

" no swapfile
set noswapfile
set nowb

" no backup
set nobackup
set nowritebackup

" netrw
let g:netrw_banner = 0

"
" mapped keys
"

" clear highlited matches
" <CR> = Enter Key
" noh = nohlsearch
nnoremap <silent> <CR> :silent noh<CR>
nmap <silent> <C-s> :w<CR>

