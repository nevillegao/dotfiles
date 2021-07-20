" :W invokes sudo
command W w !sudo tee % > /dev/null

nnoremap B ^
nnoremap E $

nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

" Inverse Tab
nnoremap <S-Tab> <<

nnoremap <Leader><F1> :help 

" Quickfix List
nnoremap <silent> <Leader>cc :copen<CR>
autocmd FileType qf nnoremap <silent> <buffer> <Leader>cq :cclose<CR>

" Location List
nnoremap <silent> <Leader>ll :lopen<CR>
autocmd FileType qf nnoremap <silent> <buffer> <Leader>lq :lclose<CR>

" Toggle 'Fold'
nnoremap <silent> <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
