" :W invokes sudo
command W w !sudo tee % > /dev/null

nnoremap <Up> gk
nnoremap <Down> gj
inoremap <Up> <C-O><Up>
inoremap <Down> <C-O><Down>

" Set F8 and F9 to toggle 'Paste'
nnoremap <F8> :set paste<CR>
nnoremap <F9> :set nopaste<CR>
inoremap <F8> <C-O>:set paste<CR>
inoremap <F9> <Nop>
set pastetoggle=<F9>

" Toggle 'List'
nnoremap <C-L> :set list!<CR>
inoremap <C-L> <C-O>:set list!<CR>

" Toggle 'Spell Check'
nnoremap <F6> :set spell!<CR><BAR>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

" Toggle 'Fold'
nnoremap <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" QuickFix Window
nnoremap <F3> :cnext<CR>
nnoremap <Leader><F3> :cprev<CR>

" Inverse Tab
nnoremap <S-Tab> <<
