set nocompatible

" Encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn

" Misc
set noswapfile
set nobackup
set viminfo='100,<1000,s100,h,n~/.vim/info
set undodir=~/.vim/undo
set undofile
set wildmenu
set wildmode=list:full
set visualbell
set hidden

" Display
syntax on
silent! colorscheme ayu
if exists('+termguicolors')  "Enable true color (24-bit)
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
if &term =~ 'screen'
    set t_ts=k
    set t_fs=\
endif
set title
set titlestring=%t
set display=lastline
set ruler
set number
set showcmd
set showmode
set showbreak=↪  " Unicode
" set showbreak=\\\  " ASCII
set listchars=eol:¶,tab:\|→,trail:•,extends:»,precedes:«,nbsp:¬  " Unicode
" set listchars=eol:↲,tab:»-,space:␣,trail:•,extends:→,precedes:←,nbsp:¬  " Unicode
" set listchars=eol:$,tab:\|_,space:.,trail:*,extends:>,precedes:<,nbsp:~  " ASCII
set completeopt=longest,menu
set colorcolumn=+1
set laststatus=2
set statusline=%<[%n]\ %F\ %h%m%r%=%k[%{(&fenc==\'\')?&enc:&fenc}%{(&bomb?\',BOM\':\'\')}][%{&ff}][ASCII=\%04.4B]\ %-10.(%l,%c%V%)\ %P
set splitbelow
set splitright

" Search
set magic
set incsearch
set ignorecase
set smartcase
set hlsearch

" Fold
set foldenable
set foldmethod=indent
set foldminlines=3
set foldlevel=9999

" Format
set autoindent
set smartindent
set cindent
set cinoptions=g0,:N
set backspace=2
set tabstop=4
set shiftwidth=4
set formatoptions+=mB
set expandtab
set textwidth=78

set tags=./.tags;,.tags

filetype plugin indent on
