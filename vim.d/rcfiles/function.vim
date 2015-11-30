" Put current filename in register 'n'
let @n=expand('%:p')

autocmd BufNewFile,BufRead Makefile
    \ set noexpandtab

" When editing a file, always jump to the last known cursor position and line
" it at center of window
autocmd BufEnter *
    \ let last_cur_pos = line("'\"") |
    \ if last_cur_pos >= 1 && last_cur_pos <= line("$") |
    \     exe "normal! " . last_cur_pos . "zz" |
    \ endif

" Only open the file smaller than 100MB
autocmd BufReadPre *
    \ if getfsize(expand('<afile>')) >= 100*1024*1024 |
    \     exit |
    \ endif
