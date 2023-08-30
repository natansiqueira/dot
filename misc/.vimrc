call plug#begin()
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'Yggdroot/indentLine'
	Plug 'rose-pine/vim'
	Plug 'itchyny/lightline.vim'
  Plug 'vim-ruby/vim-ruby'
call plug#end()

syntax on
set encoding=utf-8

set background=dark
colorscheme rosepine
let g:lightline = { 'colorscheme': 'rosepine' }

set number
set relativenumber
set hidden
set scrolloff=5
set cursorline
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

hi CursorLine cterm=none ctermbg=0

nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-o> :Buffers<CR>
nnoremap <silent> <CR> :noh<CR>
nmap <silent> <Esc> <C-s> :w<CR>
nmap <silent> <Tab> :tabn<CR>
nmap <silent> <C-n> :tabnew<CR>
nmap <silent> <C-w> :q<CR>
nmap <silent> <C-j> :terminal<CR>
imap <silent> <C-s> :w<CR>
