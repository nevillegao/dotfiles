" :W invokes sudo
command W w !sudo tee % > /dev/null

nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

nnoremap <Leader><F1> :h 

" Toggle 'Fold'
nnoremap <silent> <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Inverse Tab
nnoremap <S-Tab> <<
