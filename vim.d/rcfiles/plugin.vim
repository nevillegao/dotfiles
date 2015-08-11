" netrw
let g:netrw_home = $HOME . '/.vim/netrw'
let g:netrw_liststyle = 3
let g:netrw_winsize = 40
noremap <silent> <C-E> :Lexplore<CR>


" Cmdline Complete
cmap <C-Y> <Plug>CmdlineCompleteBackward
cmap <C-E> <Plug>CmdlineCompleteForward


" Ag
let g:ag_highlight = 1
nnoremap <silent> <Leader><F10> :Ag <C-R>=expand('<cword>')<CR><CR>


" Gundo
let g:gundo_width = 30
let g:gundo_preview_height = 25
let g:gundo_preview_bottom = 1
nnoremap <silent> <C-U> :GundoToggle<CR>

" undotree
"let g:undotree_WindowLayout = 2
"let g:undotree_DiffpanelHeight = 25
"let g:undotree_SetFocusWhenToggle = 1
"nnoremap <silent> <C-U> :UndotreeToggle<CR>


" Tagbar
nnoremap <silent> <Leader><F9> :TagbarToggle<CR>


" syntastic
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1


" YouCompleteMe
"let g:ycm_disable_for_files_larger_than_kb = 0
"let g:ycm_register_as_syntastic_checker = 1
"let g:ycm_key_list_select_completion = ['<C-N>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-P>', '<Up>']
"let g:ycm_collect_identifiers_from_tags_files = 1


" EasyMotion
" surround
