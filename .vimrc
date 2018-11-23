execute pathogen#infect()
syntax on
set nocompatible
filetype off

autocmd Filetype html setlocal ts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sw=2
autocmd BufNewFile,BufRead *_spec.rb set syntax=rspec
autocmd BufNewFile,BufRead *_test.rb set syntax=rspec
autocmd BufNewFile,BufRead */controls/*.rb set syntax=rspec
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent  " indent on enter
set smartindent " do smart indenting when starting a new line
set shiftround  " indent to the closest shiftwidth

set background=dark
colorscheme gruvbox

syntax enable
filetype plugin indent on

set nu
set number
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

au BufWritePost .vimrc so $MYVIMRC

set ls=2  " show a status line even if there's only one window

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

set nobackup      " don't want no backup files
set nowritebackup " don't make a backup before overwriting a file
set noswapfile    " no swap files


" Auto-reload buffers when files are changed on disk
set autoread

set undofile            " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000     " How many undos
set undoreload=10000    " number of lines to save for undo

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

set cursorline          " highlight current line
" move by visual line
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
let g:syntastic_ruby_checkers = ['rubocop', 'mri', 'jruby']
let g:syntastic_ruby_rubocop_exec = '/usr/local/bin/cookstyle'

" Rust vim stuff:

let g:rust_clip_command = 'pbcopy'
let g:rustfmt_autosave = 1

" Automatically start NERDTree
autocmd VimEnter * NERDTree

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
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
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tomlion/vim-solidity'
Plugin 'tpope/vim-surround'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-bundler'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "vadv/vim-chef"
Plugin 'tpope/vim-cucumber'
Plugin 'rhysd/vim-crystal'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'tpope/vim-dotenv'
Plugin 'ervandew/supertab'
Plugin 'markcornick/vim-kitchen'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'mattn/webapi-vim'
Plugin 'fatih/vim-go'
Plugin 'hashivim/vim-terraform'
Plugin 'bfontaine/Brewfile.vim'
Plugin 'vim-scripts/bats.vim'

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
