""" Keyboard mappings

" Changes the ESC key to ENTER
inoremap <CR> <Esc>`^
inoremap jj <C-J>

" reselect visual block after in/dedent so we can in/dedent more
vnoremap < <gv
vnoremap > >gv
