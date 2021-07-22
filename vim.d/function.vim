" Jump to the last known position when opening a file
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
    \     exe "normal! g`\"" |
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
