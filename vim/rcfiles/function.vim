" Put current filename in register 'n'
let @n=expand("%:p")

autocmd BufNewFile,BufRead Makefile
    \ set noexpandtab

" When editing a file, always jump to the last known cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g`\"" |
    \ endif

" Only open the file smaller than 10MB
autocmd BufReadPre *
    \ if getfsize(expand("<afile>")) >= 100*1024*1024 |
    \     exit |
    \ endif
