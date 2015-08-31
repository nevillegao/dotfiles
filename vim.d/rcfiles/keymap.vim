" :W invokes sudo
command W w !sudo tee % > /dev/null

nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

nnoremap <Leader><F1> :h 

" Toggle 'Spell Check'
nnoremap <silent> <Leader><F4> :set spell!<CR>

" Toggle 'Paste'
nnoremap <silent> <Leader><F2> :set paste<CR>
nnoremap <silent> <Leader><F3> :set nopaste<CR>
inoremap <silent> <Leader><F2> <C-O>:set paste<CR>
inoremap <silent> <Leader><F3> <Nop>
set pastetoggle=<Leader><F3>

" Toggle 'List'
nnoremap <silent> <C-L> :set list!<CR>
inoremap <silent> <C-L> <C-O>:set list!<CR>

" Toggle 'Fold'
nnoremap <silent> <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Inverse Tab
nnoremap <S-Tab> <<

" Toggle 'CursorLine' & 'CursorColumn'
nnoremap <silent> <Leader>g :set cursorline! cursorcolumn!<CR>
