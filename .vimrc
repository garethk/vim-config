" vim: fdm=marker:fdls=0:fdl=0
" Just my vimrc file

" Bundle setup ----------------------------------------------------------- {{{
source ~/.vim/bundles.vim
" }}}
" Basic options ---------------------------------------------------------- {{{
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set modeline
set modelines=5
set autoindent
set showmode
set showcmd
set hidden
set ttyfast
set ruler
set backspace=indent,eol,start
set norelativenumber
set history=1000
set undofile
set undoreload=10000
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set autowrite
set autoread
set shiftround
set title
set linebreak
set colorcolumn=+1
set nocompatible        " We don't want vi compatibility.
set laststatus=2        " Always show the statusline
set cf                  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256         " Number of things to remember in history.
set nu                  " Line numbers on
set ttimeoutlen=10      " Time to wait after ESC (default causes a delay)
set timeoutlen=150
set nospell
set ts=4                " Tabs are 4 spaces
set bs=2                " Backspace over everything in insert mode
set shiftwidth=4        " Tabs under smart indent

set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab
set wildmenu
set incsearch
set ignorecase
set smartcase
set infercase
" Visual
set showmatch           " Show matching brackets.
set mat=5               " Bracket blinking.
set novisualbell        " No blinking .
set noerrorbells        " No noise.
" gvim specific
set mousehide           " Hide mouse after chars typed
set mouse=a             " Mouse in all modes

filetype on             " Automatically detect file types.
syntax enable
" }}}
" Leader and Basic Keymappings ------------------------------------------- {{{
let mapleader = " "      " set the <leader> placeholder to be a space 
let maplocalleader = "," " localleader can be used for specific files

" set jk in insert mode to be esc 
inoremap jk <esc>

" training mappings to discourage the use of certain keys
" stop esc being esc
inoremap <esc> <nop>

" remove the arrow keys in normal mode, use hjkl instead
nnoremap <silent> <Up> :wincmd k<CR>
nnoremap <silent> <Down> :wincmd j<CR>
nnoremap <silent> <Left> :wincmd h<CR>
nnoremap <silent> <Right> :wincmd l<CR>
" same for insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

"toggle line numbers
noremap <C-l> :set invnu<CR>

" some tab maps
noremap tl :tabnext<CR>
noremap th :tabprev<CR>
noremap tn :tabnew<CR>
noremap td :tabclose<CR>

" open your vimrc file in a new split
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" reload your vimrc in the current buffer
nnoremap <leader>sv :source $MYVIMRC<CR>:echom 'Resourced vimrc file'<CR>

" other leader mappings
nnoremap <leader><leader> V
nnoremap <leader>w :w<CR>
nnoremap <leader>o :CtrlP<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" paste mode
nnoremap <leader>pm :set invpaste<CR>

" control-u will now uppercase the word you are typing while in insertmode
inoremap <c-u> <esc>viwUA<CR>
" control-u will uppercase the word the cursor is on when in normal-mode
nnoremap <c-u> viwU
" }}}
" Backups & Files -------------------------------------------------------- {{{
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.
set undodir=~/.vim/undo      " Where undo files will go
" }}}
" Folding ---------------------------------------------------------------- {{{
set foldlevelstart=0
set foldmethod=marker
set foldopen-=search
set foldcolumn=2
nnoremap zO zczO

function! MyFoldText() 
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction 
set foldtext=MyFoldText()

" }}}
" Colour Settings -------------------------------------------------------- {{{
" Force 256 colours in term
set t_Co=256
set background=dark
colorscheme hybrid
" }}}
" Plugin Bindings -------------------------------------------------------- {{{
" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

" Quick scope - only highlight on keypress
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" bindings

" NerdTree on Control-N
inoremap <silent><C-N> <ESC>:NERDTreeTabsToggle<CR>
nnoremap <silent><C-N> :NERDTreeTabsToggle<CR>
vnoremap <silent><C-N> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_autofind = 1


" XDEBUG
" xdebug mapping instead of f12 
map <F10> :python debugger_watch_input("property_get", '<cword>')<cr>A<cr>
let g:debuggerMaxDepth=10
map <silent> <leader>bp :Bp<CR>
map <leader>dbg :python debugger_run()<cr>

" Poweline optionv
let g:Powerline_symbols='fancy'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" Taglist bindings and settings
nnoremap <silent> <leader>tl :TlistToggle<CR>
let g:Tlist_Use_Right_Window=1
let g:Tlist_GainFocus_On_ToggleOpen=1

let g:ctrlp_working_path_mode=''
let g:ctrlp_root_markers='.ctrlp'

" phpctags config
let g:tagbar_phpctags_bin='~/.vim/bundle/tagbar-phpctags/bin/phpctags'

" ctags new tab
" nmap <C-\> <C-w><C-]><C-w>T
nmap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Startify stuff
let g:startify_bookmarks = [ '~/.vimrc' ]

" grep replace
set grepprg=ack-grep\ -k


" go bindings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" }}}
" Autocommands ----------------------------------------------------------- {{{

" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}

autocmd User fugitive
            \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
            \   nnoremap  <buffer> .. :edit %:h<CR> |
            \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete

" fix html indenting a little
autocmd FileType html setlocal indentkeys-=*<Return>

augroup filetype_php
  autocmd!
  autocmd FileType php :iabbrev iff if ( ) {<Left><Left><Left><Left>
  autocmd FileType php :iabbrev protfun /** * */protected function _(){
  setl foldlevelstart=20
  setl foldmethod=syntax
augroup END

au BufRead,BufNewFile *.slim set filetype=slim
au! Syntax slim source ~/.vim/syntax/slim.vim

au BufRead,BufNewFile *.notes set filetype=note
augroup filetype_note
    setl spell
augroup END

au BufNewFile,BufReadPost *.coffee set filetype=coffee
augroup filetype_coffee
    setl shiftwidth=2 expandtab
    setl foldmethod=indent
augroup END

au BufNewFile,BufReadPost *.go set filetype=go
augroup filetype_go
    setl foldlevelstart=20
    nmap <leader>r <Plug>(go-run)
    nmap <leader>b <Plug>(go-build)
    nmap <leader>t <Plug>(go-test)
    nmap <leader>c <Plug>(go-coverage)

    nmap <leader>ds <Plug>(go-def-split)
    nmap <leader>dv <Plug>(go-def-vertical)
    nmap <leader>dt <Plug>(go-def-tab)
augroup END

" }}}
