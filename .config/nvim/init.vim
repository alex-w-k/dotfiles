set nocompatible "always iMproved

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()
Plug 'vim-ruby/vim-ruby' "Ruby syntax highlighting
if !has('nvim')
  Plug 'scrooloose/nerdtree' "A tree explorer plugin for vim.
  Plug 'Xuyuanp/nerdtree-git-plugin' "A plugin of NERDTree showing git status
else
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  Plug 'nvim-lua/plenary.nvim',
  Plug 'nvim-tree/nvim-web-devicons', " not strictly required, but recommended
  Plug 'MunifTanjim/nui.nvim',
  Plug 'nvim-neo-tree/neo-tree.nvim'
endif
Plug 'airblade/vim-gitgutter' "shows a git diff in the gutter (sign column)
if !has('nvim')
  Plug 'vim-airline/vim-airline' "lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline-themes' "themes for airline
  Plug 'jreybert/vimagit' "you can perform main git operations
else
   " Plug 'itchyny/lightline.vim'
   Plug 'nvim-lualine/lualine.nvim'
  " If you want to have icons in your statusline choose one of these
  Plug 'nvim-tree/nvim-web-devicons'
endif
Plug 'tpope/vim-fugitive' "A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-endwise' "wisely add 'end' in ruby,
Plug 'tpope/vim-commentary' "Comment stuff out. Use gcc to comment out a line, gc to comment a selection
Plug 'tpope/vim-rvm' "Switch Ruby versions from inside Vim
Plug 'tpope/vim-surround' "quoting/parenthesizing made simple
Plug 'tpope/vim-bundler' "Lightweight support for Ruby's Bundler
Plug 'tpope/vim-dotenv' "Basic support for .env and Procfile
Plug 'sheerun/vim-polyglot' "A solid language pack for Vim.
Plug 'pangloss/vim-javascript' "Vastly improved Javascript indentation and syntax support
Plug 'keith/rspec.vim' "Better rspec syntax highlighting for Vim
" Plug 'vim-syntastic/syntastic' "Syntax checking hacks for vim
Plug 'dense-analysis/ale'
Plug 'ecomba/vim-ruby-refactoring' "Refactoring tool for Ruby in vim!
Plug 'skalnik/vim-vroom' "A vim plugin for running your Ruby tests
Plug 'alex-w-k/vim-chef' "my own chef/inspec syntax highlighting
Plug 'ekalinin/Dockerfile.vim' "Vim syntax file & snippets for Docker's Dockerfile
Plug 'ervandew/supertab' "tab completion
Plug 'hashivim/vim-hashicorp-tools' "elf-contained and fairly explanatory agglomeration of HashiVim plugins
Plug 'vim-scripts/bats.vim' "Syntax highlighting for Bats - Bash Automated Testing System
Plug 'junegunn/vader.vim' "A simple Vimscript test framework
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
if has('macunix')
  Plug 'ellisonleao/gruvbox.nvim'
else
  Plug 'morhetz/gruvbox'
endif
if has('nvim')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
endif

" Initialize plugin system
call plug#end()

" lua require('config')

filetype indent plugin on
syntax on "syntax highlighting on

if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

autocmd Filetype html setlocal ts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sw=2
autocmd BufNewFile,BufRead *_spec.rb set syntax=rspec "set syntax for rspec files
autocmd BufNewFile,BufRead *_test.rb set syntax=rspec "set syntax for rspec files
au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */Ansible/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile *.yaml.j2 set ft=yaml.htmldjango
au BufRead,BufNewFile *.yml.j2 set ft=yaml.htmldjango
au BufRead,BufNewFile *.rb.j2 set ft=rb.htmldjango
au BufRead,BufNewFile *.sql.j2 set ft=sql.htmldjango
set tabstop=2 shiftwidth=2 softtabstop=2 "default to 2 space tabs
set autoindent  " indent on enter
set smartindent " do smart indenting when starting a new line
set shiftround  " indent to the closest shiftwidth
set termguicolors
set nohlsearch

set background=dark "theme
colorscheme gruvbox "theme

syntax enable "enable syntax after setting rules
filetype plugin indent on "set filetype detecting after setting rules

set backspace=indent,eol,start " backspace over everything in insert mode
set syntax=whitespace "highlight whitespace

set relativenumber "set both number and relative number for specific line
set number         "number for current line and relative to jump to lines

" When searching try to be smart about cases
set smartcase

" Use spaces instead of tabs
set expandtab

set wrap "Wrap lines

" Smart way to move between windows ctrl-direction to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

au BufWritePost .vimrc so $MYVIMRC
au BufWritePost init.vim so $MYVIMRC

set ls=2  " show a status line even if there's only one window

" Improve vim's scrolling speed
if !has('nvim')
  set ttyfast
  set ttyscroll=3
  set lazyredraw
endif

" don't create extra files
set nobackup      " don't want no backup files
set nowritebackup " don't make a backup before overwriting a file
set noswapfile    " no swap files


" Auto-reload buffers when files are changed on disk
set autoread

"create undo dir if it doesn't exist
if !isdirectory($HOME."/.local/share/nvim/undo")
    call mkdir($HOME."/.local/share/nvim/undo", "", 0700)
endif
set undofile            " Save undo's after file closes
set undodir=~/.local/share/nvim/undo" where to save undo histories
set undolevels=1000     " How many undos
set undoreload=10000    " number of lines to save for undo

"clean up trailing whitespace on save
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
    silent! nunmap <buffer> <En>
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

"vim-airline setup
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_aggregate_errors = 1
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_auto_jump = 0
" let g:syntastic_ruby_checkers = ['rubocop', 'mri', 'jruby']
" let g:syntastic_ruby_rubocop_exec = '/usr/local/bin/cookstyle'

" Automatically start NERDTree/CHADTree
if !has('nvim')
  autocmd VimEnter * NERDTree
else
  au VimEnter * CHADopen
endif

" ALE config
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace']}

let b:ale_linters = {
\   'asnible': ['ansible-lint', 'ansible-language-server'],
\   'python':  ['prospector'],
\   'lua':     ['lua-language-server'],
\ }
" vim-ansible things
let g:ansible_goto_role_paths = './roles,../_common/roles'

function! FindAnsibleRoleUnderCursor()
  if exists("g:ansible_goto_role_paths")
    let l:role_paths = g:ansible_goto_role_paths
  else
    let l:role_paths = "./roles"
  endif
  let l:tasks_main = expand("<cfile>") . "/tasks/main.yml"
  let l:found_role_path = findfile(l:tasks_main, l:role_paths)
  if l:found_role_path == ""
    echo l:tasks_main . " not found"
  else
    execute "edit " . fnameescape(l:found_role_path)
  endif
endfunction

au BufRead,BufNewFile */ansible/*.yml nnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
au BufRead,BufNewFile */ansible/*.yml vnoremap <leader>gr :call FindAnsibleRoleUnderCursor()<CR>
let g:ansible_unindent_after_newline = 1
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
let g:ansible_template_syntaxes = { '*.sql.j2': 'sql' }
let g:ansible_template_syntaxes = { '*.yml.j2': 'yaml' }
let g:ansible_template_syntaxes = { '*.yaml.j2': 'yaml' }
let g:ansible_template_syntaxes = { 'docker-compose.j2': 'yaml' }

" telescope config
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


" Enable syntax highlighting
if has('syntax')
  syntax on
endif
if has('nvim')
  lua require('config')
  set mouse=
endif
