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

inoremap jk <esc>
inoremap Jk <esc>
inoremap jK <esc>
inoremap JK <esc>

nnoremap <leader>f ggVG=<C-o><C-o>

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
set softtabstop=4 " Backspace behaves properly

set tabstop=4
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

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
set hidden " Sane handling of buffers

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set scrolloff=5 " Keep 3 lines below and above the cursor

set list
set listchars=tab:▸\ ,eol:¬

set autoread " Load files changed outside of vim

" Save ticks
nmap <leader>w :w!<cr>

" Don't redraw while executing macros (good performance config)
"set lazyredraw

" Window Setup
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

"noremap  <buffer> <silent> k gk
"noremap  <buffer> <silent> j gj

set wildmenu

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
