" :W invokes sudo
command W w !sudo tee % > /dev/null

nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Up> <C-O><Up>
inoremap <Down> <C-O><Down>

" Set F8 and F9 to toggle 'Paste'
nnoremap <silent> <F8> :set paste<CR>
nnoremap <silent> <F9> :set nopaste<CR>
inoremap <silent> <F8> <C-O>:set paste<CR>
inoremap <F9> <Nop>
set pastetoggle=<F9>

" Toggle 'List'
nnoremap <silent> <C-L> :set list!<CR>
inoremap <silent> <C-L> <C-O>:set list!<CR>

" Toggle 'Spell Check'
nnoremap <silent> <F6> :set spell!<CR><BAR>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

" Toggle 'Fold'
nnoremap <silent> <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" QuickFix Window
nnoremap <silent> <F4> :cnext<CR>
nnoremap <silent> <Leader><F4> :cprev<CR>

" Inverse Tab
nnoremap <S-Tab> <<

" Toggle 'CursorLine' & 'CursorColumn'
nnoremap <silent> <Leader>c :set cursorline! cursorcolumn!<CR>
