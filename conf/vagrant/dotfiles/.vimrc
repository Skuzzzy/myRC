set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Put plugins here
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Skuzzzy/vim-trailing-whitespace'
Bundle 'ctrlpvim/ctrlp.vim'
"Bundle 'Valloric/YouCompleteMe'
"Plugin 'bling/vim-airline'
"Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'scrooloose/syntastic'
"Plugin 'elzr/vim-json'
"Plugin 'ConradIrwin/vim-bracketed-paste'
"Plugin 'luochen1990/rainbow'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


let mapleader = " "

nnoremap <Leader>n :NERDTreeToggle<cr>
let g:NERDTreeIgnore=['\.swp$', '\~$'] " Nerd tree ignore patterns (see docs)
" let NERDTreeShowHidden=1 " Just use shift+i to show hidden files
"
noremap <Leader><Leader> :call NERDComment(1, "Toggle")<cr>

" Get my clown colors in here
syntax enable
colorscheme monokai

let g:airline_powerline_fonts = 1 " enable unicde chars on powerline

set cursorline " highlight current line

" Reccomended Settings for https://github.com/scrooloose/syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1 " start syntax checking immediately
"let g:syntastic_check_on_wq = 0
" End of Reccomended Settings
let g:syntastic_python_checkers=['flake8']
" The following line disables pretty much all of pep8
let g:syntastic_python_flake8_args='--ignore=E101,E111,E112,E113,E114,E115,E116,E121,E122,E123,E124,E125,E126,E127,E128,E129,E131,E133,E201,E202,E203,E211,E221,E222,E223,E224,E225,E226,E227,E228,E231,E241,E242,E251,E261,E262,E265,E266,E271,E272,E273,E274,E301,E302,E303,E304,E401,E402,E501,E502,E701,E702,E703,E704,E711,E712,E713,E714,E721,E731,E901,E902,W191,W291,W292,W293,W391,W503,W601,W602,W603,W604'

inoremap jk <esc>
inoremap Jk <esc>
inoremap jK <esc>
inoremap JK <esc>

" REEEEEEEE
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

set showmatch " show matching parens
set encoding=utf-8

set shiftwidth=4
set softtabstop=4
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

" Dumb parenthesis stuff
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

set laststatus=2 " fix wierd airline issue


" SEARCH START
set incsearch " begin searching immediately (do not wait for enter)
set ignorecase " ignore case by default
set smartcase " search only is case sensitive if search includes capital letter
set hlsearch " Highlight all matches of search
" SEARCH END

set colorcolumn=80 " Highlight column 80 for formatting suggestions

set number " Show current line number

set nowrap " Do not wrap lines

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set scrolloff=5 " Keep 3 lines below and above the cursor

set list

set autoread " Load files changed outside of vim

" Save ticks
nmap <leader>w :w!<cr>

" Don't redraw while executing macros (good performance config)
"set lazyredraw

" Testing this window setup
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tt :tabnew<cr>
map <leader>tl :tabnext<cr>
map <leader>th :tabprevious<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'


 "set vim to chdir for each file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
