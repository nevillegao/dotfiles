" netrw
let g:netrw_home = $HOME . '/.vim/netrw'
let g:netrw_liststyle = 3
let g:netrw_winsize = 40
noremap <silent> <Leader><F2> :Lexplore<CR>

" Cmdline Complete
cmap <C-Y> <Plug>CmdlineCompleteBackward
cmap <C-E> <Plug>CmdlineCompleteForward

" Ag
let g:ag_highlight = 1
nnoremap <silent> <Leader><F3> :Ag <C-R>=expand('<cword>')<CR><CR>

" Gundo
let g:gundo_width = 30
let g:gundo_preview_height = 25
let g:gundo_preview_bottom = 1
nnoremap <silent> <Leader><F4> :GundoToggle<CR>

" undotree
" let g:undotree_WindowLayout = 2
" let g:undotree_DiffpanelHeight = 25
" let g:undotree_SetFocusWhenToggle = 1
" nnoremap <silent> <Leader><F4> :UndotreeToggle<CR>

" Tagbar
nnoremap <silent> <Leader><F5> :TagbarToggle<CR>

" syntastic
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" YouCompleteMe
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_collect_identifiers_from_tags_files = 1

" SLIME
let g:slime_target = "tmux"
let g:slime_paste_file = $HOME . '/.vim/slime_paste'
let g:slime_python_ipython = 1

" EasyMotion
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

" CtrlP
let g:ctrlp_cache_dir = $HOME . '/.vim/ctrlp/cache'
let g:ctrlp_arg_map = 1
let g:ctrlp_extensions = ['dir', 'mixed']
let g:ctrlp_cmd = 'exe "CtrlP".get(["", "Buffer", "MRU", "Dir", "Mixed"], v:count)'

" indentLine
let g:indentLine_enabled = 0
nnoremap <silent> <Leader><F6> :IndentLinesToggle<CR>

" vim-json
let g:vim_json_syntax_conceal = 0

" setcolors
nnoremap <silent> <Leader><F8> :SetColors
    \ desert256
    \ inkpot
    \ vividchalk
    \ molokai
    \ <CR>
