call plug#begin()
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'Yggdroot/indentLine'
	Plug 'rose-pine/vim'
	Plug 'itchyny/lightline.vim'
  Plug 'vim-ruby/vim-ruby'
  Plug 'rose-pine/vim'
call plug#end()

syntax on
set encoding=utf-8
set nocompatible
filetype on          
filetype indent on   
filetype plugin on   
set background=light
let g:lightline = { 'colorscheme': 'PaperColor' }
let mapleader = ';'

set number
set relativenumber
set hidden
set scrolloff=5
set showmatch
set laststatus=2
set mouse=a
set clipboard=unnamed

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set expandtab

set ignorecase
set smartcase
set incsearch
set hlsearch

set noswapfile
set nobackup
set nowritebackup

set undodir=~/.vim/backups
set undofile

noremap <leader>q :q<CR>
noremap <leader>w :w<CR>
