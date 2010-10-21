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

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set encoding=utf-8
set wildmenu                    " Filename completion for command mode
set wildmode=list:longest
set relativenumber              " Shows the relative line numbers for the file specified when running vim
set scrolloff=5                 " Always shows 5 lines above and below cursor
"set cursorline                 " Shows a line under the cursor and to the edges of the screen
"set ttyfast                    " More responsive

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nohidden                    " No hidden buffers

set laststatus=2
set statusline=%F%m%r%h%w\ %Y\ %{&fenc==\"\"?&enc:&fenc}\ %{&ff}%=%L\ \lines\ %04l,%04v\ \ %p%%\ \buffer\ %n

set showmatch matchpairs+=<:>
