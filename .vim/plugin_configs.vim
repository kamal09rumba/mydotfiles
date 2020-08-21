" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugins Configurations
" 1. Nerdtree configuration
" 2. NERDCommenterComment configuration
" 3. ALE
" 4. YouCompleteMe
" 5. FZF
" 6. Vim-easymotion
" 7. Emmet-vim
" 8. Gruvbox
" 9. Lightline
" 10. Vim fugitive
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     Nerdtree configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open NERDTree by default
autocmd vimenter * NERDTree
" Open NERDTree if no filename specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree when vim start ups on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close if only left window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Map to open Nerdtree
map <c-n> :NERDTreeToggle<CR>
" Mirror nerdtree
autocmd BufWinEnter * NERDTreeMirror
" show hidden files
let NERDTreeShowHidden=1
" Window size
let NERDTreeWinSize=30



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     NERDCommenterComment configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     PHP linter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_php_phpcs_executable='$HOME/.composer/vendor/bin/phpcs'
let g:ale_php_php_cs_fixer_executable='$HOME/.composer/vendor/bin/php-cs-fixer'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'less': ['prettier'],
\   'python': ['black', 'isort'],
\   'scss': ['prettier'],
\   'yaml': ['prettier'],
\   'php': ['php_cs_fixer'],
\}
let g:ale_linters = {
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'less': ['prettier'],
\   'python': ['flake8'],
\   'scss': ['prettier'],
\   'yaml': ['prettier'],
\   'php': ['php_cs_fixer'],
\}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_fix_on_save = 1
"let g:airline#extensions#ale#enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     YouCompleteMe(YCM) specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close preview afer insertion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = 'python3'
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
" Don't show YCM's preview window
set completeopt-=preview
" Open GoToDefinition in new tab
let g:ycm_goto_buffer_command = 'new-tab'
"
" character base trigger
let g:ycm_semantic_triggers = {
      \   'python': [ 're!\w{2}' ],
      \   'css,scss': [ 're!^\s{2}', 're!^\s{4}', 're!:\s+' ],
      \ }


" virtualenv support
"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun


" UndoTree specific "{{{
nnoremap <c-t> :UndotreeToggle<cr>
" }}}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     FZF specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <expr> <c-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Ag\<cr>"
nnoremap <silent> <expr> <c-b> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"
" Finding files
nnoremap <silent> <C-f> :Files<CR>
" Finding in files
nnoremap <silent> <Leader>f :Rg<CR>

" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     Vim easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 1 " Enable default mappings (is enabled by default)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

map <Leader><Leader> <Plug>(easymotion-prefix)

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" <leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)
" }}}

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     Emmet-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" redefine trigger key ( using tab for autocomplete html tag )
let g:user_emmet_expandabbr_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     Gruvbox config (Colorscheme)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
set laststatus=2 " Allows Lightline to work properly
let g:gruvbox_termcolors=256
let g:gruvbox_termtrans=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"" solarized
"set t_Co=256
"set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
"colorscheme solarized




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     Lightline configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
\   'colorscheme': 'powerline',
\   'inactive': {
\      'left': [['readonly', 'relativepath', 'modified']]
\   },
\   'active': {
\      'left': [ [ 'mode', 'paste' ],
\                [ 'gitbranch', 'readonly', 'filename', 'modified', 'cwd' ] ]
\    },
\    'component_function': {
\       'gitbranch': 'FugitiveHead'
\    },
\    'component': {
\       'cwd': '%{getcwd()}'
\    }
\}



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     Vim fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     Presistent undo on files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


" Misc {{{
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python :call GoYCM()
autocmd FileType javascript :call GoYCM()
" }}}
