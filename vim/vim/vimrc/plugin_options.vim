filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Options for Supertab
let g:SuperTabCrMapping=0          " Doesn't set <CR> in insert mode

let NERDTreeChDirMode=2            " Current root node is working directory
let NERDChristmasTree=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let NERDTreeHighlightCursorline=1
