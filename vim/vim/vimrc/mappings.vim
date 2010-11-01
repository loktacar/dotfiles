""" Keyboard mappings

" Changes the ESC key to ENTER
inoremap <CR> <ESC>`^
inoremap jj <C-J>
vnoremap <CR> <ESC>

" reselect visual block after in/dedent so we can in/dedent more
vnoremap < <gv
vnoremap > >gv
