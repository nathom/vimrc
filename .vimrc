" Plugins {{{
call plug#begin()

" Themes {{{2
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'wojciechkepka/vim-github-dark'
" }}}

" Syntax
Plug 'dense-analysis/ale'

" insanely slow
" has to defined before call
let g:polyglot_disabled = ['autoindent', 'python-indent']

Plug 'sheerun/vim-polyglot'

" Nerdtree related
"Plug 'preservim/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'

" Utility
Plug 'Raimondi/delimitMate'
Plug 'Konfekt/FastFold'
Plug 'vim-scripts/taglist.vim'
Plug 'easymotion/vim-easymotion'
Plug 'luochen1990/rainbow'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'

" Git/github
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'tpope/vim-commentary'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'yhat/vim-docstring'

" aesthetics
Plug 'junegunn/goyo.vim', { 'for' : 'markdown' }
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'

Plug 'Galicarnax/vim-regex-syntax'

" bindings
Plug 'tpope/vim-unimpaired'

" my plugins
Plug 'nathom/fast-python-indent', { 'for': 'python' }

" Undo tree
Plug 'sjl/gundo.vim'

call plug#end()
" }}}

" Color Schemes {{{
let s:theme = 'gruvbox8'

" Available Themes:
" OceanicNext
" gruvbox
" molokai
" atom-dark
" palenight
" ayu
" nord
" solarized
" onehalfdark
" jellybeans
augroup color_scheme
    autocmd!
    execute 'autocmd vimenter * ++nested colorscheme ' . s:theme
augroup END
" }}}

" Ayu Theme {{{
"let ayucolor="light"
"let ayucolor="mirage"
let ayucolor="dark"
" }}}

" Airline {{{

let g:airline#extensions#tabline#enabled = 1

" }}}
" General {{{
" Sets how many lines of history VIM has to remember
set history=500

"syntax on
set encoding=UTF-8

if $TERM =~ 'xterm-256color'
  set noek
endif


" sets true colors in terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" sets the cursor to thin instead of block in terminal
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
augroup auto_read
    autocmd!
    au FocusGained,BufEnter * checktime
augroup END

let mapleader = ","
let maplocalleader = "\\"

" Fast saving
nmap <leader>w :w!<cr>

" Set line numbers on/off
set nu

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Turn on the Wild menu
set wildmenu

" " remove status bar and other stuff
" " for a minimal look
" set noshowmode
" set laststatus=0
" set noshowcmd


" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim

augroup gui_settings
    autocmd!
    autocmd GUIEnter * set vb t_vb=
augroup END


" Add a bit extra margin to the left
set foldcolumn=1


" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set wrap "Wrap lines

" }}}

" Moving around, tabs, windows and buffers {{{

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
nnoremap <space> /
nnoremap <C-space> ?
nnoremap <esc> :noh<return><esc>
let delimitMate_jump_expansion = 1
let delimitMate_expand_cr = 2
nnoremap J 10j
nnoremap K 10k

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Splitting
set splitbelow
set splitright

" }}}

" Goyo {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>
" }}}

" Yankstack {{{
let g:yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
" }}}

" Text, indents, and tabs {{{


" nmap <leader>c gcc
" xmap <leader>c gc
" vmap <leader>c gc

" Useful mappings for managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>t<leader> :tabnext
nnoremap <D-i> gT
nnoremap <D-o> gt

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <D-u> :exe "tabn ".g:lasttab<CR>

" Return to last edit position when opening files (You want this!)
augroup last_pos
    autocmd!
    au TabLeave * let g:lasttab = tabpagenr()
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END



" Remap VIM 0 to first non-blank character
nnoremap 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nnoremap <D-j> mz:m+<cr>`z
nnoremap <D-k> mz:m-2<cr>`z
vnoremap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z


augroup clean_spaces
    autocmd!
    if has("autocmd")
        autocmd!
        autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
    endif
augroup END

nnoremap / zazj
nnoremap ? zazk

" }}}

" Python {{{

" string mappings
inoremap <leader>s ''<esc>i
inoremap <leader>S ""<esc>i
"let g:disable_native_indent = 1

augroup filetype_python
    autocmd!
    autocmd filetype python setlocal makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
    autocmd filetype python setlocal errorformat=%f:%l:\ %m
    au FileType python map <buffer> <leader>1 /class<cr>
    au FileType python map <buffer> <leader>2 /def<cr>
    au FileType python setlocal foldlevel=99
    " complete function def
    au FileType python inoremap <D-[> <ESC>$a:<ESC>o
    " f-strings
    au FileType python inoremap <leader>f f""<ESC>i
    " python docstring/comments
    " au FileType python nmap <leader>dd o"""<cr><esc>kA
    au FileType python nnoremap <leader>dd :Pydocstring<cr>
    au FileType python setlocal foldmethod=indent
    au FileType python setlocal foldnestmax=2
augroup END

setlocal foldlevelstart=99


" }}}

" Java {{{
let java_highlight_functions = 1
let java_highlight_all = 1
" If you are trying this at runtime, you need to reload the syntax file

" Some more highlights, in addition to those suggested by cmcginty
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc

augroup java_filetype
    autocmd!
    au FileType java setlocal foldmethod=syntax
    au FileType java setlocal foldlevel=99
    au FileType java nnoremap <leader>c :call ToggleCComment()<cr>
augroup END

" }}}

" Markdown {{{
set conceallevel=0
let vim_markdown_folding_disabled = 1
augroup markdown_filetype
    autocmd!
    au FileType markdown inoremap <leader>y ``<esc>i
    au FileType markdown inoremap <leader>Y ```<cr>```<esc>O
    au FileType markdown let g:indentLine_loaded = 1
augroup END
" }}}

" Polyglot (syntax highlighting) {{{
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
let g:cpp_member_highlight = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
" }}}

" File management {{{

" So that undo's are saved
set undofile
if !isdirectory("/users/nathan/.vim/undodir")
    call mkdir("/users/nathan/.vim/undodir")
endif
set undodir="/users/nathan/.vim/undodir"

" }}}

" Visual multi {{{
nmap <C-j> <C-Down>
nmap <C-k> <C-Up>
let g:VM_show_warnings = 0
" }}}

" Parenthesis and brackets {{{


" insert parens/brackets/quotes around visual mode selection
vnoremap 1 <esc>`>a)<esc>`<i(<esc>
vnoremap 2 <esc>`>a]<esc>`<i[<esc>
vnoremap 3 <esc>`>a}<esc>`<i{<esc>
vnoremap 4 <esc>`>a'<esc>`<i'<esc>
vnoremap 5 <esc>`>a"<esc>`<i"<esc>


" insert brackets
" cmd-[ for open bracket in new line
" cmd-] for open backet in same line
inoremap <D-[> <esc>$o{<cr>}<esc>O
inoremap <D-]> <esc>$a {<cr>}<esc>O

" add semicolon to end of line and go to next
nnoremap <leader>m $a;<esc>o
inoremap <leader>m <esc>$a;<esc>o
nnoremap <leader>M ma$a;<esc>`a
inoremap <leader>M <esc>ma$a;<esc>`a


" }}}

" Nerd Tree {{{
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.class$', '\.jpg$', '\.gif$', '\.bluej$', '\.png$', '\.o$', '\.DS_Store$']
let g:NERDTreeWinSize=25
let g:NERDTreeDirArrowExpandable = '❯'
let g:NERDTreeDirArrowCollapsible = '~'
" let g:NERDTreeHijackNetrw = 0
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark<Space>
" map <leader>nf :NERDTreeFind<cr>
" map <leader>ncd :NERDTreeCWD<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
     \ b:NERDTree.isTabTree()) | q | endif

" }}}

" IndentLine {{{
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_defaultGroup = 'Comment'
" }}}

" Maps {{{

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Close buffer and write
" if readonly then just close
nnoremap <silent> zz :call CloseAndOrWrite()<cr>

vnoremap <D-c> "*y
nnoremap <D-v> "*p
inoremap <D-v> "*p


nnoremap H ^
nnoremap L $
onoremap H ^
onoremap L $
vnoremap H ^
vnoremap L $

" Makes typing kinda annoying so its disabled
"inoremap jk <esc>
"inoremap kj <esc>


nnoremap <leader>N :setlocal number!<cr>;
nnoremap <leader>f :call FoldColumnToggle()<cr>
nnoremap <leader>q :call QuickfixToggle()<cr>


" }}}

" Abbreviations {{{
iabbrev waht what
iabbrev tehn then
iabbrev pubicl public
iabbrev pubcli public
iabbrev adn and
iabbrev oen one
iabbrev teh the
iabbrev @@ nathanthomas707@gmail.com

iabbrev stativ static
" }}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
augroup END
" }}}

" Ale (syntax checker and linter) {{{

let g:ale_use_global_executables = 1

let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\}
let g:ale_fixers = {
\   'python': ['black'],
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0  " annoying

let g:ale_fix_on_save = 1
" does not verify AST after fixing
let g:ale_python_black_options = "--fast"

" use quickfix list
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0

" }}}

" FastFold {{{

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" }}}

" C {{{
iabbrev typdef typedef
let g:c_autodoc = 1

augroup filetype_c
    autocmd!
    au FileType c set foldmethod=syntax
    au FileType c setlocal foldlevel=99
augroup END
" }}}

" Helper functions {{{

" Delete trailing white space on save, useful for some filetypes
function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction


function! FoldColumnToggle()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=1
    endif
endfunction

let g:quickfix_is_open = 0
function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" universal close file command, writes if possible
function! CloseAndOrWrite()
    if !&readonly && @% != '' && &buftype != 'nofile'
        :wq
    else
        :q
    endif
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction



" }}}

" Commenting Functions {{{
function! TogglePythonComment()
    let l:line = getline('.')
    let l:comment_pos = match(l:line, '#')
    if l:comment_pos == -1
        " insert # at the first non-space character of the line
        execute "normal! ma^i#\<Space>\<Esc>`a"
    else
        " delete the first # and store
        " character under cursor in register z
        normal! ma^x"zyl
        " if the character is a space, we need to delete that
        if @z ==# ' '
            normal! x
        endif
        " return to original position
        normal `a
    endif
endfunction


function! TogglePythonBlockComment()
    " line numbers of the start and end
    " of the visual selection
    let l:start = line("'<")
    let l:end = line("'>") + 1
    " go to start line, insert triple-string above
    " go to end line, insert triple-string below
    execute 'normal! ' . l:start . 'GO"""' . "\<Esc>" . l:end . 'GO"""' . "\<Esc>"
endfunction


function! ToggleCComment()
    let l:line = getline('.')
    let l:comment_pos = match(l:line, '//')
    if l:comment_pos == -1
        " insert two slashes at the first non-space character of the line
        execute "normal! ma^i//\<Space>\<Esc>`a"
    else
        " delete the first two slashes and store
        " character under cursor in register z
        normal! ma^xx"zyl
        " if the character is a space, we need to delete that
        if @z ==# ' '
            normal! x
        endif
        " return to original position
        normal `a
    endif
endfunction

function! ToggleCBlockComment()
    " line numbers of the start and end
    " of the visual selection
    let l:start = line("'<")
    let l:end = line("'>") + 1
    " go to start line, insert triple-string above
    " go to end line, insert triple-string below
    execute 'normal! ' . l:start . "GO/*\<Esc>" . l:end . "Go*/\<Esc>"
endfunction

" }}}

" Automatically install vim-plug {{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}
