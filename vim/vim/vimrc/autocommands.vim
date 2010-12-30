""" Auto commands, to be run on various occasions

" This is run so that re-sourcing .vimrc won't double the autocmd's
if !exists("custom_autocommands_loaded")

    " Specific filetype auto commands
    autocmd BufRead,BufNewFile ~/blog/*.html set filetype=mason
    autocmd BufRead,BufNewFile ~/viktor_nytt/*.html set filetype=mason
    autocmd BufRead,BufNewFile *.mhtml set filetype=mako
    autocmd BufRead,BufNewFile *.mc set filetype=mako

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

    let custom_autocommands_loaded = 1
endif
