nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj

nnoremap <Leader><F1> :h 

" QuickFix Window
nnoremap <Leader><F2> :cprev<CR>
nnoremap <Leader><F3> :cnext<CR>

" Toggle 'Spell Check'
nnoremap <silent> <Leader><F6> :set spell!<CR>

" Toggle 'Paste'
nnoremap <silent> <Leader><F7> :set paste<CR>
nnoremap <silent> <Leader><F8> :set nopaste<CR>
inoremap <silent> <Leader><F7> <C-O>:set paste<CR>
inoremap <silent> <Leader><F8> <Nop>
set pastetoggle=<Leader><F8>

" Toggle 'List'
nnoremap <silent> <C-L> :set list!<CR>
inoremap <silent> <C-L> <C-O>:set list!<CR>

" Toggle 'Fold'
nnoremap <silent> <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" :W invokes sudo
command W w !sudo tee % > /dev/null

" Inverse Tab
nnoremap <S-Tab> <<

" Toggle 'CursorLine' & 'CursorColumn'
nnoremap <silent> <Leader>g :set cursorline! cursorcolumn!<CR>
