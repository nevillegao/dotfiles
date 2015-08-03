" netrw
let g:netrw_home = $HOME . '/.vim/info/netrw'
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
nnoremap <silent> <Leader><F5> :Vexplore<CR>

"" fencview
"let g:fencview_autodetect = 1

" Cmdline Complete
cmap <C-Y> <Plug>CmdlineCompleteBackward
cmap <C-E> <Plug>CmdlineCompleteForward

" ag
let g:ag_highlight = 1
nnoremap <silent> <Leader>* :Ag <C-R>=expand("<cword>")<CR><CR>

" gundo
let g:gundo_width = 30
let g:gundo_preview_height = 25
let g:gundo_preview_bottom = 1
nnoremap <silent> <Leader><F4> :GundoToggle<CR>

" undotree
"let g:undotree_WindowLayout = 2
"let g:undotree_DiffpanelHeight = 25
"let g:undotree_SetFocusWhenToggle = 1
"nnoremap <silent> <Leader><F4> :UndotreeToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = {"mode": "passive"}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
nnoremap <silent> <Leader>s :SyntasticCheck<CR>
nnoremap <silent> <Leader>r :SyntasticReset<CR>

" YouCompleteMe
"let g:ycm_disable_for_files_larger_than_kb = 0

" Tagbar
let g:tagbar_width = 20
nnoremap <silent> <Leader><F8> :TagbarToggle<CR>
