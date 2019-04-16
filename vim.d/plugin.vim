call plug#begin('$HOME/.vim/bundle')

" Programming
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'jpalardy/vim-slime'
Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'do': '$HOME/.vim/bundle/YouCompleteMe/install.py' }
Plug 'elzr/vim-json', { 'for': 'json' }

" Utility
Plug 'tpope/vim-vinegar'
Plug 'Raimondi/delimitMate'
Plug 'vim-scripts/CmdlineComplete'
Plug 'mileszs/ack.vim', { 'on':  'Ack' }
Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-mark'
Plug 'thinca/vim-visualstar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' }
Plug 'vim-scripts/FavEx'
Plug 'nathangrigg/vim-beancount'

Plug 'junegunn/vim-easy-align'
Plug 'itchyny/calendar.vim', { 'on':  'Calendar' }
" http://www.drchip.org/astronaut/vim/vbafiles/calutil.vba.gz
" http://www.drchip.org/astronaut/vim/vbafiles/visincr.vba.gz
" http://www.drchip.org/astronaut/vim/vbafiles/DrawIt.vba.gz

" Color
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim', { 'on':  'SetColors' }

call plug#end()


" netrw
" let g:netrw_home = $HOME . '/.vim/netrw'
" noremap <silent> <Leader><F2> :20Lexplore<CR>

" SLIME
let g:slime_target = "tmux"
let g:slime_paste_file = $HOME . '/.vim/slime_paste'
let g:slime_python_ipython = 1

" Tagbar
nnoremap <silent> <Leader><F5> :TagbarToggle<CR>

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_leadingSpaceChar = '˰'
nnoremap <silent> <Leader><F6> :IndentLinesToggle<CR>:LeadingSpaceToggle<CR>

" ALE
" let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
" let g:ale_statusline_format = ['✗ %d', '! %d', '✔ OK']
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'python': ['pylint']
\}
let g:ale_python_pylint_executable = 'pylint3'
let g:ale_python_pylint_options = '--rcfile=' . $HOME . '/googlecl-pylint.rc'
let g:ale_pattern_options = {'\.beancount$': {'ale_enabled': 0}}
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
nmap <Leader>s :ALEToggle<CR>
nmap <Leader>d :ALEDetail<CR>

" YouCompleteMe
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_collect_identifiers_from_tags_files = 1

" vim-json
let g:vim_json_syntax_conceal = 0

" Cmdline Complete
cmap <C-Y> <Plug>CmdlineCompleteBackward
cmap <C-E> <Plug>CmdlineCompleteForward

" ack
let g:ackprg = 'ag --vimgrep'
let g:ackhighlight = 1
nnoremap <silent> <Leader><F3> :Ack! <C-R>=expand('<cword>')<CR><CR>
vnoremap <silent> <Leader><F3> y:Ack! "<C-R>=fnameescape(@")<CR>"<CR>

" Gundo
let g:gundo_prefer_python3 = 1
let g:gundo_width = 30
let g:gundo_preview_height = 25
let g:gundo_preview_bottom = 1
nnoremap <silent> <Leader><F4> :GundoToggle<CR>

" undotree
" let g:undotree_WindowLayout = 2
" let g:undotree_DiffpanelHeight = 25
" let g:undotree_SetFocusWhenToggle = 1
" nnoremap <silent> <Leader><F4> :UndotreeToggle<CR>

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_cache_dir = $HOME . '/.vim/ctrlp/cache'
let g:ctrlp_arg_map = 1
let g:ctrlp_extensions = ['dir', 'line']
let g:ctrlp_cmd = 'exe "CtrlP".get(["Buffer", "", "MRU", "Dir", "Line"], v:count)'

" EasyMotion
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

" setcolors
nnoremap <silent> <Leader><F8> :SetColors
\   inkpot
\   desert256
\   molokai
\   vividchalk
\<CR>

" Calendar
let g:calendar_first_day = 'sunday'
let g:calendar_date_endian = 'big'
let g:calendar_date_separator = '-'
let g:calendar_week_number = 1
let g:calendar_view = 'year'
let g:calendar_views = ['year', 'month', 'clock']
let g:calendar_cyclic_view = 1
let g:calendar_cache_directory = $HOME . '/.vim/calendar/cache'

" vim-beancount
let g:beancount_separator_col = 57
let b:beancount_root = expand('%:p:h') . '/accounts.beancount'
autocmd FileType beancount inoremap . .<C-O>:AlignCommodity<CR>
autocmd FileType beancount setlocal foldnestmax=1 | normal zM
