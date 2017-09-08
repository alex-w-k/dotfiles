syntax on

autocmd Filetype html setlocal ts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sw=2

autocmd BufNewFile,BufRead *_spec.rb set syntax=rspec
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

set nu
set number
set nocompatible
set backspace=indent,eol,start " backspace over everything in insert mode
set syntax=whitespace

set relativenumber
set number

" When searching try to be smart about cases
set smartcase

set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Always show the status line
set laststatus=2

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

set cursorline          " highlight current line

set undofile
set undodir=~/.vim/undodir

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle 'vim-ruby/vim-ruby'
Plugin 'nelsyeung/twig.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'jreybert/vimagit'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rvm'
Plugin 'pangloss/vim-javascript'
Plugin 'keith/rspec.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'tmhedberg/matchit'
Plugin 'groenewege/vim-less'
Plugin 'vim-syntastic/syntastic'
Plugin 'tomtom/tlib_vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'garbas/vim-snipmate'
Plugin 'tomlion/vim-solidity'
Plugin 'tpope/vim-surround'
Plugin 'skalnik/vim-vroom'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tpope/vim-bundler'
Plugin 'vadv/vim-chef'
Plugin 'tpope/vim-cucumber'

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

