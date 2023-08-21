" fzf
set rtp+=/opt/homebrew/opt/fzf

" airline theme
let g:airline_theme='base16_grayscale'

" syntax highlighting
syntax on

" dark background
set background=dark

" colorscheme
colorscheme simple-dark

" file encoding
set encoding=utf-8

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

" enables mouse on INSERT mode
set mouse=a

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
nnoremap <silent> <CR> :silent noh<CR>

" open fzf
" <C-p> = Ctrl + p
nnoremap <C-p> :Files<CR>

" mode color
"hi Visual cterm=none ctermbg=white ctermfg=black
hi Search cterm=none ctermbg=white ctermfg=black

" error color
hi Error ctermbg=red ctermfg=black 
hi ErrorMsg ctermbg=red ctermfg=black 

