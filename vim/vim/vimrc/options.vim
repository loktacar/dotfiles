""" General settings

set ts=2
set sw=2
set sts=2

set nu                          " Numbered lines
set expandtab
set nocp                        " No compatibility with vi

set title

set hlsearch                    " Highlights search results
set incsearch                   " Incremental search, searches as you type

set nobackup
set noswapfile                  " No swap or backup files

set list                        " Show erronius whitespace characters
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set encoding=utf-8
set wildmenu                    " Filename completion for command mode
set wildmode=list:longest
set relativenumber              " Shows the relative line numbers for the file specified when running vim
set scrolloff=5                 " Always shows 5 lines above and below cursor

set noerrorbells                " No more loud noises and distractions
set novisualbell
set t_vb=
set tm=500

set nohidden                    " No hidden buffers

set showcmd                     " Shows what characters you've built up in the "command" buffer
set autochdir                   " Switches the dir to where the file which was opened is
set more                        " If there has to be displayed more info that fits on the screen
                                " display it as ' | more' in terminal. 

set clipboard+=unnamed

syntax on
filetype plugin indent on

if has("gui_running")
  set guioptions=achegirLm         " Just some gui options
  set guifont=Andale\ Mono\ 9      " GUI font

  colorscheme liquidcarbon
else
  colorscheme koehler
endif

" Statusline settings
set laststatus=2

set statusline=%F               " Full path to the current file
set statusline+=%m%r%w\         " Modified flag, read-only flag, and preview window flag
set statusline+=%Y\             " Type of file in buffer
set statusline+=%{&fenc==\"\"?&enc:&fenc}\ 
                                " File encoding
set statusline+=%{&ff}\         " File format

set statusline+=%=\             " Split left and right

set statusline+=(\line:\ \%l\/%L\ %p%%)\ 
                                " Line number, total line count, and
                                " percentage of current line and total

set statusline+=(\col.:\ %v)\   " Column number
set statusline+=(\buf.:\ %n)    " Buffer number
set statusline+=%<              " Truncate status line (Show beginning)

