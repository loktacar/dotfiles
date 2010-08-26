set ts=4
set sw=4
set sts=4

syntax on
set nu
set expandtab

set title

set ruler
set backspace=start,indent,eol

map :set indentexpr= ft=mason

set nohidden

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
filetype plugin indent on

colo zellner

autocmd VimEnter * NERDTree
autocmd VimEnter * vertical resize +20
autocmd VimEnter * sv ~/vim_notes.txt
autocmd VimEnter * wincmd l

