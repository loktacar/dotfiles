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
"set cursorline                 " Shows a line under the cursor and to the edges of the screen
"set ttyfast                    " More responsive

set noerrorbells                " No more loud noises and distractions
set novisualbell
set t_vb=
set tm=500

set nohidden                    " No hidden buffers

set laststatus=2
set statusline=%F%m%r%h%w\ %Y\ %{&fenc==\"\"?&enc:&fenc}\ %{&ff}%=(\lines:\ \%l\/%L\ %p%%)\ (\column:\ %v)\ (\buffer:\ %n)
" Status line:
"     right: path flags filetype encoding newline_char_type
"     left: (lines: currline/line_count scroll_down_%) (columns: curr_col) (buffer: buffer_number)

syntax on
filetype plugin indent on

colorscheme sienna
