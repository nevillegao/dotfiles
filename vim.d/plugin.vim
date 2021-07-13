call plug#begin('$HOME/.vim/bundle')

" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Programming
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
" Plug 'benmills/vimux'
Plug 'jpalardy/vim-slime'
Plug 'preservim/tagbar'
Plug 'Yggdroot/indentLine'
" Plug 'dense-analysis/ale'
" Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'

" File
Plug 'tpope/vim-vinegar'
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/defx.nvim'
Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' }
" Plug 'mbbill/undotree'
Plug 'Shougo/deoplete.nvim'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim', { 'on':  'Ack' }
Plug 'thinca/vim-visualstar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/denite.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/CmdlineComplete'
Plug 'Raimondi/delimitMate'

" Format
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'

" Utility
Plug 'itchyny/calendar.vim', { 'on':  'Calendar' }
" http://www.drchip.org/astronaut/vim/vbafiles/calutil.vba.gz
" http://www.drchip.org/astronaut/vim/vbafiles/visincr.vba.gz
" http://www.drchip.org/astronaut/vim/vbafiles/DrawIt.vba.gz

" Color
Plug 'flazz/vim-colorschemes'
Plug 'felixhummel/setcolors.vim', { 'on':  'SetColors' }

" Support
Plug 'nathangrigg/vim-beancount'

" Dependency
Plug 'roxma/nvim-yarp'  " Required by defx
Plug 'roxma/vim-hug-neovim-rpc'  " Required by defx

call plug#end()


" netrw
" let g:netrw_home = $HOME . '/.vim/netrw'
" noremap <silent> <Leader><F2> :20Lexplore<CR>


" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" SLIME
let g:slime_target = "tmux"
let g:slime_paste_file = $HOME . '/.vim/slime_paste'


" Tagbar
nnoremap <silent> <Leader><F5> :TagbarToggle<CR>


" indentLine
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_leadingSpaceChar = '˰'
nnoremap <silent> <Leader><F6> :IndentLinesToggle<CR>:LeadingSpaceToggle<CR>


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
" \   'python': ['pylint']
" \}
" let g:ale_python_pylint_executable = 'pylint3'
" let g:ale_python_pylint_options = '--rcfile=' . $HOME . '/googlecl-pylint.rc'
" let g:ale_pattern_options = {'\.beancount$': {'ale_enabled': 0}}
" nmap sp <Plug>(ale_previous_wrap)
" nmap sn <Plug>(ale_next_wrap)
" nmap <Leader>s :ALEToggle<CR>
" nmap <Leader>d :ALEDetail<CR>


" NERDTree
nnoremap <Leader>n :NERDTreeFind<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'✹',
    \ 'Staged'    :'✚',
    \ 'Untracked' :'✭',
    \ 'Renamed'   :'➜',
    \ 'Unmerged'  :'═',
    \ 'Deleted'   :'✖',
    \ 'Dirty'     :'✗',
    \ 'Ignored'   :'☒',
    \ 'Clean'     :'✔︎',
    \ 'Unknown'   :'?',
\}
let g:NERDTreeGitStatusShowClean = 1
let g:NERDTreeGitStatusConcealBrackets = 1


" defx
" 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
" let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

call defx#custom#option('_', {
    \ 'winwidth': 30,
    \ 'split': 'vertical',
    \ 'direction': 'topleft',
    \ 'show_ignored_files': 0,
    \ 'buffer_name': '',
    \ 'toggle': 1,
    \ 'resume': 1,
    \ 'columns': 'indent:git:icons:filename',
    \ 'listed': 1,
    \ 'root_marker': '≡ ',
    \ 'ignored_files':
    \     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
    \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
\})

function! s:defx_mappings() abort
    " Defx window keyboard mappings
    setlocal signcolumn=no
    " 使用回车打开文件
    nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
endfunction

autocmd FileType defx call s:defx_mappings()


" Cmdline Complete
cmap <C-Y> <Plug>CmdlineCompleteBackward
cmap <C-E> <Plug>CmdlineCompleteForward


" deoplete
let g:deoplete#enable_at_startup = 1


" fzf
let g:fzf_command_prefix = 'Fzf'


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
let g:ctrlp_extensions = ['dir', 'mixed']
let g:ctrlp_cmd = 'exe "CtrlP".get(["", "Buffer", "MRU", "Dir", "Mixed"], v:count)'


" denite

"" 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call denite#custom#option('_', {
"    \ 'prompt': '❯',
"    \ 'auto_resume': 1,
"    \ 'start_filter': 1,
"    \ 'statusline': 1,
"    \ 'smartcase': 1,
"    \ 'vertical_preview': 1,
"    \ 'max_dynamic_update_candidates': 50000,
"    \ })
"call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
"call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

"nnoremap <silent> <C-P> :Denite buffer file<CR>

"autocmd FileType denite call s:denite_my_settings()
"function! s:denite_my_settings() abort
"  nnoremap <silent><buffer><expr> <CR>
"  \ denite#do_map('do_action')
"  nnoremap <silent><buffer><expr> d
"  \ denite#do_map('do_action', 'delete')
"  nnoremap <silent><buffer><expr> p
"  \ denite#do_map('do_action', 'preview')
"  nnoremap <silent><buffer><expr> q
"  \ denite#do_map('quit')
"  nnoremap <silent><buffer><expr> i
"  \ denite#do_map('open_filter_buffer')
"  nnoremap <silent><buffer><expr> <Space>
"  \ denite#do_map('toggle_select').'j'
"endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if executable('rg')
"  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
"  call denite#custom#var('grep', 'command', ['rg'])
"  call denite#custom#var('grep', 'recursive_opts', [])
"  call denite#custom#var('grep', 'final_opts', [])
"  call denite#custom#var('grep', 'separator', ['--'])
"  call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading', '--ignore-case'])
"else
"  call denite#custom#var('file_rec', 'command',
"      \ ['grep', '--follow', '--nocolor', '--nogroup', '-g', ''])
"endif

"" allow grep source filtering on either path or text
"call denite#custom#source('grep', 'converters', ['converter_abbr_word'])

"call denite#custom#map('insert', '<C-h>', '<denite:move_to_first_line>', 'noremap')
"call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
"call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
"call denite#custom#map('insert', '<C-l>', '<denite:move_to_last_line>', 'noremap')

"call denite#custom#option('default', 'prompt', '>')
"call denite#custom#option('default', 'cursor_wrap', v:true)

"nnoremap <C-p> :Denite -direction=topleft file_rec<CR>
"nnoremap <space>/ :Denite -direction=topleft grep<CR>
"nnoremap <space>f :Denite -direction=topleft -no-quit -mode=normal grep:.<CR>
"nnoremap <space>s :Denite -direction=topleft buffer<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Change file_rec command.
"call denite#custom#var('file_rec', 'command',
"      \ ['ag', '--follow', '--nocolor', '--nogroup', '--ignore=*.pyc', '-g', ''])

"" Change mappings.
"call denite#custom#map(
"      \ 'insert',
"      \ 'K',
"      \ '<denite:move_to_next_line>',
"      \ 'noremap'
"      \)
"call denite#custom#map(
"      \ 'insert',
"      \ 'L',
"      \ '<denite:move_to_previous_line>',
"      \ 'noremap'
"      \)

"" Change sorters.
"call denite#custom#source(
"      \ 'file_rec', 'sorters', ['sorter_sublime'])

"" Change default prompt
"call denite#custom#option('default', 'prompt', '➤ ')

"" " Change ignore_globs
"" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
""       \ [ '.git/', '.ropeproject/', '__pycache__/*', '*.pyc',
""       \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/', '*.png'])

"nnoremap <space>v :Denite file_rec -default-action=vsplit<cr>
"nnoremap <space>s :Denite file_rec -default-action=split<cr>
"nnoremap <space>e :Denite file_rec -winheight=10 <cr>
"nnoremap <space>m :Denite file_mru -winheight=10 -vertical-preview -auto-preview <cr>
"nnoremap <space>l :Denite line -auto-preview<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EasyMotion
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1


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


" Calendar
let g:calendar_first_day = 'sunday'
let g:calendar_date_endian = 'big'
let g:calendar_date_separator = '-'
let g:calendar_week_number = 1
let g:calendar_view = 'year'
let g:calendar_views = ['year', 'month', 'clock']
let g:calendar_cyclic_view = 1
let g:calendar_cache_directory = $HOME . '/.vim/calendar/cache'


" beancount
let g:beancount_separator_col = 68
let b:beancount_root = expand('%:p:h') . '/accounts.beancount'
autocmd FileType beancount inoremap . .<C-\><C-O>:AlignCommodity<CR>
autocmd FileType beancount setlocal foldnestmax=1 | normal zM
