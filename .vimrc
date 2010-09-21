set ts=2
set sw=2
set sts=2

syntax on
set nu
set expandtab
set nocp

set title

set hlsearch                    " Highlights search results
set incsearch                   " Incremental search, searches as you type

set nobackup                    
set noswapfile                  " No swap or backup files

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

map :set indentexpr= ft=mason

set hidden                      " Hides buffers instead of closing them

set encoding=utf-8
set wildmenu                    " Tab completion for command mode
set wildmode=list:longest
set relativenumber              " Shows the relative line numbers
set scrolloff=5                 " Always shows 5 lines above and below cursor
set cursorline                  " Shows a line under the cursor and to the edges of the screen
set ttyfast                     " More responsive
set laststatus=2

set nohidden

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
filetype plugin indent on

colo zellner

let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let NERDTreeHighlightCursorline=1

hi SpellBad ctermbg=lightgray

set laststatus=2
set statusline=[%02n]%F%m%r%h%w\ \ %Y%=%04l,%04v\ \ %p%%\ \ %L\ \lines
