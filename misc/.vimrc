call plug#begin()
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'Yggdroot/indentLine'
	Plug 'itchyny/lightline.vim'
	Plug 'rose-pine/vim'
call plug#end()

let g:lightline = { 'colorscheme': 'rosepine_dawn' }

colorscheme rosepine_dawn

syntax on
set encoding=utf-8
set number
set hidden
set scrolloff=5
set cursorline
set showmatch
set laststatus=2

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

nnoremap <silent> <C-o> :Files<CR>
nnoremap <silent> <C-p> :Buffers<CR>
nnoremap <silent> <CR> :noh<CR>
nmap <silent> <C-s> :w<CR>
imap <silent> <C-s> :w<CR>
