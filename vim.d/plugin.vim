call plug#begin('$HOME/.vim/bundle')

" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

" Programming
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
" Plug 'benmills/vimux'
Plug 'jpalardy/vim-slime'
Plug 'majutsushi/tagbar', { 'on':  'TagbarToggle' }
Plug 'Yggdroot/indentLine'
" Plug 'w0rp/ale'
" Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'

" File
Plug 'tpope/vim-vinegar'
Plug 'Shougo/defx.nvim'
Plug 'sjl/gundo.vim', { 'on':  'GundoToggle' }
" Plug 'mbbill/undotree'
Plug 'vim-scripts/FavEx'
Plug 'Shougo/deoplete.nvim'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim', { 'on':  'Ack' }
" Plug 'inkarkat/vim-ingo-library' | Plug 'inkarkat/vim-mark'
Plug 'thinca/vim-visualstar'
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


" SLIME
let g:slime_target = "tmux"


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


" defx
" 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
" let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

call defx#custom#option('_', {
\   'winwidth': 30,
\   'split': 'vertical',
\   'direction': 'topleft',
\   'show_ignored_files': 0,
\   'buffer_name': '',
\   'toggle': 1,
\   'resume': 1,
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
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


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


" denite
call denite#custom#option('_', {
    \ 'prompt': '❯',
    \ 'auto_resume': 1,
    \ 'start_filter': 1,
    \ 'statusline': 1,
    \ 'smartcase': 1,
    \ 'vertical_preview': 1,
    \ 'max_dynamic_update_candidates': 50000,
    \ })
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

nnoremap <silent> <C-P> :Denite buffer file<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction


" EasyMotion
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1


" setcolors
nnoremap <silent> <Leader><F8> :SetColors
\   spacegray
\   hybrid
\   jellybeans
\   inkpot
\   molokai
\   vividchalk
\   solarized
\   gruvbox
\   onedark
\   lucius
\   iceberg
\   OceanicNext
\   solarized8_dark
\   ayu
\   desert256
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
let g:beancount_separator_col = 68
let b:beancount_root = expand('%:p:h') . '/accounts.beancount'
autocmd FileType beancount inoremap . .<C-\><C-O>:AlignCommodity<CR>
autocmd FileType beancount setlocal foldnestmax=1 | normal zM
