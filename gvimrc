set t_vb=
set winaltkeys=no

if has("unix")
    set guifont=Consolas\ 14
else
    set guifont=Consolas:h14
endif

" Toggle horizontal scroll bar according to wrap status
nnoremap <silent><expr> <F2> ':set wrap! go'.'-+'[&wrap]."=b\r"
