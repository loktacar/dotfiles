""" Auto commands, to be run on various occasions

" Specific filetype auto commands
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Auto commands to be run upon opening/re-opening files
au BufRead,BufNewFile * set relativenumber
au BufRead,BufNewFile *.mhtml setfiletype mako
au BufRead,BufNewFile *.mc setfiletype mako
