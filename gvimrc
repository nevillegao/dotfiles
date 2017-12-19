set t_vb=
set winaltkeys=no

" Tab
noremap <M-T> :tabnew<CR>
noremap <M-W> :tabclose<CR>
noremap <M-;> :tabprevious<CR>
noremap <M-'> :tabnext<CR>
noremap <M-1> :tabnext 1<CR>
noremap <M-2> :tabnext 2<CR>
noremap <M-3> :tabnext 3<CR>
noremap <M-4> :tabnext 4<CR>
noremap <M-5> :tabnext 5<CR>
noremap <M-6> :tabnext 6<CR>
noremap <M-7> :tabnext 7<CR>
noremap <M-8> :tabnext 8<CR>
noremap <M-9> :tabnext 9<CR>

set guifont=Consolas\ 14
set guifontwide=Microsoft\ YaHei\ 14

" Toggle horizontal scroll bar according to wrap status
nnoremap <silent><expr> <F2> ':set wrap! go'.'-+'[&wrap]."=b\r"
