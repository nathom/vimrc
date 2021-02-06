
" Color Schemes {{{
autocmd vimenter * ++nested colorscheme gruvbox
"autocmd vimenter * ++nested colorscheme onehalfdark
"autocmd vimenter * ++nested colorscheme solarized
"autocmd vimenter * ++nested colorscheme molokai
"autocmd vimenter * ++nested colorscheme atom-dark
"autocmd vimenter * ++nested colorscheme ayu
"autocmd vimenter * ++nested colorscheme OceanicNext
"autocmd vimenter * ++nested colorscheme nord
"autocmd vimenter * ++nested colorscheme palenight
" }}}

if $TERM =~ 'xterm-256color'
  set noek
endif

syntax enable
"set background=dark
"let g:molokai_original=1


" Plugins {{{
call plug#begin()

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
"

Plug 'Yggdroot/indentLine'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/limelight.vim'
Plug 'Raimondi/delimitMate'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'Konfekt/FastFold'
Plug 'vim-vdebug/vdebug'

call plug#end()

" Pathogen

execute pathogen#infect()
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

" sets true colors in terminal
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"set foldlevelstart=99

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
au FocusGained,BufEnter * checktime

let mapleader = ","
let maplocalleader = "\\"

" Fast saving
nmap <leader>w :w!<cr>

" Set line numbers on/off
set nu

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" }}}

" Moving around, tabs, windows and buffers {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?
nnoremap <esc> :noh<return><esc>
let delimitMate_jump_expansion = 1
let delimitMate_expand_cr = 2
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
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

" Ale (syntax checker and linter) {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['pylint'],
\   'go': ['go', 'golint', 'errcheck']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_enter = 0

" }}}

" VIM user interface {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" remove status bar and other stuff
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
autocmd GUIEnter * set vb t_vb=


" Add a bit extra margin to the left
set foldcolumn=1

" }}}

" Files, backups and undo {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
" }}}

" Yankstack {{{
let g: yankstack_map_keys = 0
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
" }}}

" Text, indents, and tabs {{{
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


" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <D-j> mz:m+<cr>`z
nmap <D-k> mz:m-2<cr>`z
vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" }}}

" Python {{{

" string mappings
inoremap <leader>s ''<ESC>i
inoremap <leader>S ""<ESC>i


augroup filetype_python
    autocmd!
    au FileType python map <buffer> <leader>1 /class<cr>
    au FileType python map <buffer> <leader>2 /def<cr>
    au FileType python setlocal foldlevel=99
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

" }}}


" Markdown {{{
let vim_markdown_folding_disabled = 1
" }}}


" Parenthesis and brackets {{{


" insert parens/brackets/quotes around visual mode selection
vnoremap 1 <esc>`>a)<esc>`<i(<esc>
vnoremap 2 <esc>`>a]<esc>`<i[<esc>
vnoremap 3 <esc>`>a}<esc>`<i{<esc>
vnoremap 4 <esc>`>a'<esc>`<i'<esc>
vnoremap 5 <esc>`>a"<esc>`<i"<esc>


" insert brackets after function e.g. int main()
" cmd-[ for open bracket in new line
" cmd-] for open backet in same line
inoremap <D-[> <ESC>$o{<cr>}<ESC>O
inoremap <D-]> <ESC>$a {<cr>}<ESC>O
 
" add semicolon to end of line and go to next
map <leader>m $a;<ESC>o
imap <leader>m <ESC>$a;<ESC>o

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

" Learn Vimscript the hard way {{{

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap zz :wq<cr>

" abbreviations
iabbrev waht what
iabbrev tehn then
iabbrev adn and
iabbrev oen one
iabbrev @@ nathanthomas707@gmail.com
iabbrev ccopy Copyright 2021 Nathan Thomas, all rights reserved

nmap H 0
nnoremap L $
onoremap L $

inoremap jk <esc>
inoremap kj <esc>


" inside parens
onoremap p i(
" up to return statement
onoremap b /return<cr>
" inside next paren
onoremap in( :<c-u>normal! f(vi(<cr>
" inside last paren
onoremap il( :<c-u>normal! F)vi(<cr>

onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>

nnoremap <leader>M :execute "normal! mqA;\<esc>`q"

nnoremap <leader>g :exe "grep -R " . shellescape(expand("<cWORD>")) . " ."<cr>

nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <leader>N :setlocal number!<cr>
nnoremap <leader>f :call FoldColumnToggle()<cr>
nnoremap <leader>q :call QuickfixToggle()<cr>

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

" }}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}

" Helper functions {{{
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
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



