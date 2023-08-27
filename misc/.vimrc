call plug#begin()
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'Yggdroot/indentLine'
	Plug 'rose-pine/vim'
	Plug 'itchyny/lightline.vim'
call plug#end()

syntax on
set encoding=utf-8

set background=light
colorscheme rosepine_dawn
let g:lightline = { 'colorscheme': 'rosepine_dawn' }

set number
set relativenumber
set hidden
set scrolloff=5
set cursorline
set showmatch
set laststatus=2
set mouse=a

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

hi CursorLine cterm=none ctermbg=0

nnoremap <silent> <C-p> :Files %:p:h<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <silent> <CR> :noh<CR>
nmap <silent> <C-s> :w<CR>
imap <silent> <C-s> :w<CR>
