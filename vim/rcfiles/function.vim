" Put current filename in register 'p'
let @n=expand("%:p")

" When editing a file, always jump to the last known cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g`\"" |
    \ endif

" Only open the file smaller than 10MB
autocmd BufReadPre *
    \ if getfsize(expand("<afile>")) >= 10*1024*1024 |
    \     exit |
    \ endif