" When editing a file, always jump to the last known cursor position and line
" it at center of window
autocmd BufEnter *
    \ let last_cur_pos = line("'\"") |
    \ if last_cur_pos >= 1 && last_cur_pos <= line("$") |
    \     exe "normal! " . last_cur_pos . "zz" |
    \ endif

" Only open the file smaller than 10MB
autocmd BufReadPre *
    \ if getfsize(expand('<afile>')) >= 10*1024*1024 |
    \     exit |
    \ endif

" Put current filename in register 'n'
let @n=fnameescape(expand('%:p'))

autocmd FileType help resize
autocmd FileType json setlocal tabstop=2 shiftwidth=2 foldmethod=syntax
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead Makefile setlocal noexpandtab
