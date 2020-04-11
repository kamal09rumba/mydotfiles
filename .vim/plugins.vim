" To install vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Reload .vimrc and :PlugInstall to install plugins.


call plug#begin('~/.vim/plugged')

""" Utility
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Text Navigation
Plug 'easymotion/vim-easymotion'
" Undo History Visualizer
Plug 'mbbill/undotree'
" Statusline/Tabline plugin
Plug 'itchyny/lightline.vim'
"Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" Unix shell command
" Plug 'tpope/vim-eunuch'
" Completion tool for HTML, CSS & JAVASCRIPT
Plug 'mattn/emmet-vim'
" EditorConfig
Plug 'editorconfig/editorconfig-vim'
" Fuzzy Finder(similar to GOTO)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" Quoting/Parenthesizing
Plug 'tpope/vim-surround'
" Cursor
Plug 'terryma/vim-multiple-cursors'
" CSS & SCSS
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color' " Preview css color in editor
" Javascript
Plug 'pangloss/vim-javascript'
" React JSX
Plug 'mxw/vim-jsx'

" Auto-Complete
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" Django
Plug 'tweekmonster/django-plus.vim'
" Asynchronous Lint Engine(ALE)
Plug 'w0rp/ale'


" Snipplets
" Plug 'SirVer/ultisnips'
" Snipplets list
" Plug 'honza/vim-snippets'

" ColorScheme
Plug 'altercation/vim-colors-solarized'


call plug#end()

"delc PlugUpgrade
"filetype plugin indent on


