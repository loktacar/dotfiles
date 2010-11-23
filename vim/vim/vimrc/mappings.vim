""" Keyboard mappings

" Changes the ESC key to ENTER
inoremap <CR> <ESC>`^
inoremap jj <C-J>
vnoremap <CR> <ESC>

" reselect visual block after in/dedent so we can in/dedent more
vnoremap < <gv
vnoremap > >gv

" The next lines help with folding

" Fold unfold with space in normal mode
nnoremap <silent> <Space> za

" Create a fold with space in visual mode
vnoremap <silent> <Space> zf
