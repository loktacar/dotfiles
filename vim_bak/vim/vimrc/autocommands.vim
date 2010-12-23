""" Auto commands, to be run on various occasions

" This is run so that re-sourcing .vimrc won't double the autocmd's
autocmd!

" Specific filetype auto commands
autocmd BufRead,BufNewFile ~/blog/*.html setfiletype mason
autocmd BufRead,BufNewFile ~/viktor_nytt/*.html setfiletype mason
autocmd BufRead,BufNewFile *.mhtml setfiletype mako
autocmd BufRead,BufNewFile *.mc setfiletype mako

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Auto commands to be run upon opening/re-opening files
autocmd BufRead,BufNewFile * set relativenumber

" Auto commands to be run upon switching modes

" Turn off relative numbers when in insert mode
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber
