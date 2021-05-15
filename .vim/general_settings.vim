" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" General Override of Defaults
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if has('python3')
  silent! python3 1
endif

" Enable Backspace(delete key)
set backspace=indent,eol,start

" OS X clipboard sharing
set clipboard=unnamed

" Autocompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Key Mapping
inoremap jj <ESC>
inoremap jk <ESC>

" Use `SPACE` as a mapleader
let mapleader=" "

set encoding=utf-8 " UTF-8 support

set nu " show line number
set relativenumber " show relative number
set ruler " set ruler
"set nowrap " disable wrapping of lines
"set shiftwidth=2
"set softtabstop=2

" Tab sanity
" set expandtab "use space for tab
"set autoindent
"set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
" Show hidden characters, tabs, trailing whitespace
set list
set listchars=tab:→\ ,trail:·,nbsp:·
" Different tab/space stops"
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make setlocal noexpandtab
" for drupal
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
    autocmd BufRead,BufNewFile *.theme set filetype=php
  augroup END
endif

" Enable detect of file change outside of vim
set autoread
au FocusGained,BufEnter * :checktime

" Enable mouse support
set mouse=a

syntax on

set incsearch " incremental search as you type
set hlsearch " hightlight search
set showmatch " highlight matching bracket
" This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>
" Enable ignorecase when searching
set ignorecase
" Ignore case if search pattern is all lowercase
set smartcase
" Save on buffer change
set autowrite
set novisualbell
set noerrorbells


" C-h/j/k/l to move between buffers
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>p :bprevious<CR>
map <leader>n :bnext<CR>

" Easier tab navigation

" }}}

" Set swapfile in different directory
set swapfile
set directory=$TMPDIR

" Auto reload vimrc on change
autocmd! BufWritePost .vimrc source %
