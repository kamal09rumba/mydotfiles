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
" NERD Commenter (code comment)
Plug 'preservim/nerdcommenter'
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Vim clap (popup)
Plug 'liuchengxu/vim-clap'

" Build the extra binary if cargo exists on your system.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" The bang version will try to download the prebuilt binary if cargo does not exist.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
" :Clap install-binary[!] will always try to compile the binary locally,
" if you do care about the disk used for the compilation, try using the force download way,
" which will download the prebuilt binary even you have installed cargo.
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
" `:Clap install-binary[!]` will run using the terminal feature which is inherently async.
" If you don't want that and hope to run the hook synchorously:
Plug 'liuchengxu/vim-clap', { 'do': has('win32') ? 'cargo build --release' : 'make' }
" Quoting/Parenthesizing
Plug 'tpope/vim-surround'
" Cursor
Plug 'terryma/vim-multiple-cursors'
" CSS & SCSS
Plug 'cakebaker/scss-syntax.vim'
" Preview css color in editor
Plug 'ap/vim-css-color'
" Javascript support
Plug 'pangloss/vim-javascript'
" TypeScript support
Plug 'leafgarland/typescript-vim'
" React support
Plug 'maxmellon/vim-jsx-pretty'
" Time tracking
"Plug 'wakatime/vim-wakatime'
" Phpcomplete.vim(Improved PHP omni-completion)
Plug 'shawncplus/phpcomplete.vim'
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Twig syntax highlights
Plug 'lumiliet/vim-twig'
" Vim indentation level
Plug 'Yggdroot/indentLine'
" Vim auto pairs
Plug 'jiangmiao/auto-pairs'

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

" Python
" Plug 'psf/black', { 'branch': 'stable' }
Plug 'ambv/black', { 'branch': 'stable'}
" Django
Plug 'tweekmonster/django-plus.vim'

" Asynchronous Lint Engine(ALE)
Plug 'w0rp/ale'

" Xdebug
Plug 'vim-vdebug/vdebug'


" Snipplets
" Plug 'SirVer/ultisnips'
" Snipplets list
" Plug 'honza/vim-snippets'

" ColorScheme
" Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'

call plug#end()

"delc PlugUpgrade
"filetype plugin indent on
