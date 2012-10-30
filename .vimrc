"r_dump($stor bundles/plugins file to install from
source ~/.vim/bundles.vim

" set the <leader> placeholder to be ,
let mapleader = ","
" localleader can be used for specific files
let maplocalleader = ",,"

" set jk in insert mode to be esc (far faster than reaching all the way to esc)
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


filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.
set laststatus=2   " Always show the statusline


" Add recently accessed projects menu (project plugin)
set viminfo^=!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
"map   :cp 
"map   :cn 

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

syntax enable

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
" colorscheme vividchalk  " Uncomment this to set a default theme


" Make Comments Grey (for ease of reading on dark background
"hi Folded ctermbg=black ctermfg=gray
"hi Comment ctermfg=darkgrey
"
"highlight DiffAdd cterm=none ctermfg=gray ctermbg=darkblue
"highlight DiffDelete cterm=none ctermfg=gray ctermbg=cyan
"highlight DiffChange cterm=none ctermfg=green ctermbg=black 
"highlight DiffText cterm=none ctermfg=green ctermbg=darkgreen 
"highlight Directory cterm=none ctermfg=lightblue ctermbg=none

" Force 256 colours in term
set t_Co=256
colorscheme hybrid

" Formatting (some of these are for coding in C and C++)
set ts=4  " Tabs are 4 spaces
set bs=2  " Backspace over everything in insert mode
set shiftwidth=4  " Tabs under smart indent
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
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.

set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
set noerrorbells  " No noise.

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Backups & Files
set backup                     " Enable creation of backup file.
set backupdir=~/.vim/backups " Where backups will go.
set directory=~/.vim/tmp     " Where temporary files will go.

"folding
set foldmethod=syntax
set foldopen-=search

" bindings

" NerdTree on Control-N
inoremap <C-N> <ESC>:NERDTreeToggle<CR>
nnoremap <C-N> :NERDTreeToggle<CR>
vnoremap <C-N> :NERDTreeToggle<CR>

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

" paste mode
nnoremap <leader>pm :set invpaste<CR>

" control-u will now uppercase the word you are typing while in insertmode
inoremap <c-u> <esc>viwUA<CR>
" control-u will uppercase the word the cursor is on when in normal-mode
nnoremap <c-u> viwU

" XDEBUG
" xdebug mapping instead of f12 
map <F10> :python debugger_watch_input("property_get", '<cword>')<cr>A<cr>
let g:debuggerMaxDepth=10
map <silent> <leader>bp :Bp<CR>

" Poweline optionv
let g:Powerline_symbols='fancy'


let g:ctrlp_working_path_mode=''
let g:ctrlp_root_markers='.ctrlp'

set enc=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" autocommands

augroup filetype_php
  autocmd!
  autocmd FileType php :iabbrev iff if ( ) {<Left><Left><Left><Left>
  autocmd FileType php :iabbrev protfun /** * */protected function _(){
augroup END

au BufRead,BufNewFile *.slim set filetype=slim
au! Syntax slim source ~/.vim/syntax/slim.vim