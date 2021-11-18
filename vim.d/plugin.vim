" Polyglot
let g:polyglot_disabled = ['calendar']


call plug#begin('$HOME/.vim/bundle')

" Status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'

" Color
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim', { 'on':  'SetColors' }

" Programming
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
" Plug 'preservim/nerdcommenter'
Plug 'jpalardy/vim-slime'
" Plug 'preservim/vimux'
Plug 'preservim/tagbar'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'davidhalter/jedi-vim'

" File
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-vinegar'
Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' }
" Plug 'mbbill/undotree'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim', { 'on':  'Ack' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/CmdlineComplete'

" Format
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'

" Utility
Plug 'itchyny/calendar.vim', { 'on':  'Calendar' }
" http://www.drchip.org/astronaut/vim/vbafiles/calutil.vba.gz
" http://www.drchip.org/astronaut/vim/vbafiles/visincr.vba.gz
" http://www.drchip.org/astronaut/vim/vbafiles/DrawIt.vba.gz

" Support
Plug 'nathangrigg/vim-beancount'

call plug#end()


" netrw
let g:netrw_home = $HOME . '/.vim/netrw'
noremap <silent> <Leader><F2> :20Lexplore<CR>


" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" setcolors
nnoremap <silent> <Leader><F8> :SetColors
    \ spacegray
    \ hybrid
    \ jellybeans
    \ inkpot
    \ molokai
    \ vividchalk
    \ solarized
    \ gruvbox
    \ onedark
    \ lucius
    \ iceberg
    \ OceanicNext
    \ solarized8_dark
    \ ayu
    \ desert256
\<CR>


" gitgutter
let g:gitgutter_preview_win_floating = 1

function! GitGutterNextHunkCycle()
    let line = line('.')
    GitGutterNextHunk
    if line('.') == line
        1
        GitGutterNextHunk
    endif
endfunction

function! GitGutterPrevHunkCycle()
    let line = line('.')
    GitGutterPrevHunk
    if line('.') == line
        normal! G
        GitGutterPrevHunk
    endif
endfunction

nnoremap <silent> ]c :call GitGutterNextHunkCycle()<CR>
nnoremap <silent> [c :call GitGutterPrevHunkCycle()<CR>


" SLIME
let g:slime_target = "tmux"
let g:slime_paste_file = $HOME . '/.vim/slime_paste'


" Tagbar
nnoremap <silent> <Leader><F5> :TagbarToggle<CR>


" ALE
" " let g:ale_set_highlights = 0
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '!'
" " let g:ale_statusline_format = ['✗ %d', '! %d', '✔ OK']
" " let g:ale_echo_msg_error_str = 'E'
" " let g:ale_echo_msg_warning_str = 'W'
" " let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_lint_on_enter = 0
" let g:ale_linters = {
"     \ 'python': ['pylint']
" \}
" let g:ale_python_pylint_executable = 'pylint3'
" let g:ale_python_pylint_options = '--rcfile=' . $HOME . '/googlecl-pylint.rc'
" let g:ale_pattern_options = {'\.beancount$': {'ale_enabled': 0}}
" nmap sp <Plug>(ale_previous_wrap)
" nmap sn <Plug>(ale_next_wrap)
" nmap <Leader>s :ALEToggle<CR>
" nmap <Leader>d :ALEDetail<CR>


" CoC
let g:coc_config_home = $HOME . '/.vim.d'


" NERDTree
nnoremap <silent> <Leader>n :NERDTreeFind<CR>
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" Cmdline Complete
cmap <C-Y> <Plug>CmdlineCompleteBackward
cmap <C-E> <Plug>CmdlineCompleteForward


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


" fzf
let g:fzf_command_prefix = 'Fzf'


" ack
let g:ackprg = 'ag --vimgrep'
let g:ackhighlight = 1
nnoremap <silent> <Leader><F3> :Ack! <C-R>=expand('<cword>')<CR><CR>
vnoremap <silent> <Leader><F3> y:Ack! "<C-R>=fnameescape(@")<CR>"<CR>


" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_cache_dir = $HOME . '/.vim/ctrlp/cache'
let g:ctrlp_arg_map = 1
let g:ctrlp_extensions = ['dir', 'mixed']
let g:ctrlp_cmd = 'exe "CtrlP".get(["", "Buffer", "MRU", "Dir", "Mixed"], v:count)'


" EasyMotion
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1


" indentLine
let g:indentLine_enabled = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_leadingSpaceChar = '˰'
nnoremap <silent> <Leader><F6> :IndentLinesToggle<CR>:LeadingSpaceToggle<CR>


" Calendar
let g:calendar_first_day = 'sunday'
let g:calendar_date_endian = 'big'
let g:calendar_date_separator = '-'
let g:calendar_week_number = 1
let g:calendar_view = 'year'
let g:calendar_views = ['year', 'month', 'clock']
let g:calendar_cyclic_view = 1
let g:calendar_cache_directory = $HOME . '/.vim/calendar/cache'
nnoremap <silent> <Leader><F9> :Calendar<CR>

augroup calendar-mappings
    autocmd!

    autocmd FileType calendar nmap <buffer> h <Plug>(calendar_view_left)
    autocmd FileType calendar nmap <buffer> l <Plug>(calendar_view_right)
augroup END


" beancount
let g:beancount_separator_col = 92
let b:beancount_root = expand('%:p:h') . '/accounts.beancount'
autocmd FileType beancount inoremap . .<C-\><C-O>:AlignCommodity<CR>
autocmd FileType beancount setlocal textwidth=0
