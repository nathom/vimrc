" Color Schemes {{{
let s:theme = 'OceanicNext'

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
augroup color_scheme
    autocmd!
    execute 'autocmd vimenter * ++nested colorscheme ' . s:theme
augroup END
" }}}

" Plugins {{{
call plug#begin()
" Automatically install plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

" Themes {{{2
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'altercation/vim-colors-solarized'
Plug 'gosukiwi/vim-atom-dark'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tomasr/molokai'
Plug 'Lokaltog/vim-distinguished'
Plug 'arcticicestudio/nord-vim'
Plug 'sjl/badwolf'
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'ayu-theme/ayu-vim'
" }}}

Plug 'Yggdroot/indentLine'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'Konfekt/FastFold'

call plug#end()

" Pathogen {{{
"execute pathogen#infect()
" }}}

" }}}

" Ayu Theme {{{
"let ayucolor="light"
"let ayucolor="mirage"
let ayucolor="dark"
" }}}

" General {{{
" Sets how many lines of history VIM has to remember
set history=500

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

" remove status bar and other stuff
" for a minimal look
set noshowmode
set laststatus=0
set noshowcmd


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
set si "Smart indent
set wrap "Wrap lines
" }}}

" Moving around, tabs, windows and buffers {{{

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
nnoremap <space> /
nnoremap <C-space> ?
nnoremap <esc> :noh<return><esc>
let delimitMate_jump_expansion = 1
let delimitMate_expand_cr = 2

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

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


" Useful mappings for managing tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>t<leader> :tabnext
nnoremap <leader>l gt
nnoremap <leader>h gT

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <leader>tl :exe "tabn ".g:lasttab<CR>


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

" }}}

" Python {{{

" string mappings
inoremap <leader>s ''<esc>i
inoremap <leader>S ""<esc>i


augroup filetype_python
    autocmd!
    au FileType python map <buffer> <leader>1 /class<cr>
    au FileType python map <buffer> <leader>2 /def<cr>
    au FileType python setlocal foldlevel=99
    au FileType python nnoremap <leader>c :call TogglePythonComment()<cr>
    "au FileType python xnoremap <leader>c os'''<cr>'''<esc>P
    "au FileType python xnoremap <leader>c o:<c-u>call TogglePythonBlockComment()<cr>
augroup END
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
let vim_markdown_folding_disabled = 1
" }}}

" Polyglot (syntax highlighting) {{{

let g:cpp_member_highlight = 1

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
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.class$', '\.jpg$', '\.gif$', '\.bluej$', '\.png$']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
map <leader>ncd :NERDTreeCWD<cr>

" }}}

" IndentLine {{{
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_setColors = 0
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
onoremap H ^
nnoremap L $
onoremap L $

" Makes typing kinda annoying so its disabled
"inoremap jk <esc>
"inoremap kj <esc>


" inside parens
onoremap p i(
" up to return statement
onoremap b /return<cr>
" inside next paren
onoremap in( :<c-u>normal! f(vi(<cr>
" inside last paren
onoremap il( :<c-u>normal! F)vi(<cr>
" replace header and go to insert mode
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>



nnoremap <leader>N :setlocal number!<cr>;
nnoremap <leader>f :call FoldColumnToggle()<cr>
nnoremap <leader>q :call QuickfixToggle()<cr>


" }}}

" Abbreviations {{{
iabbrev waht what
iabbrev tehn then
iabbrev adn and
iabbrev oen one
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

" Helper functions {{{

" Delete trailing white space on save, useful for some filetypes
function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

" Commenting {{{
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
    let l:indent_level = indent('.')
    echom l:indent_level
    "execute "normal! " . l:indent_level . "i\<Space>\<Esc>a'''\<Esc>\"cyy\"cpP"
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
" }}}

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

function! CloseAndOrWrite()
    " if writable, write
    " else just quit
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

" Ale (syntax checker and linter) {{{
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['yapf', 'remove_trailing_lines'],
\   'javascript': ['eslint'],
\}

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\}

let g:ale_fix_on_save = 1

" }}}

" FastFold {{{

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

" }}}

" C {{{
augroup filetype_c
    autocmd!
    au FileType c setlocal foldmethod=syntax
    au FileType c setlocal foldlevel=99
    au FileType c nnoremap <leader>c :call ToggleCComment()<cr>
augroup END
" }}}
