set nocompatible

" Encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn

" Misc
set noswapfile
set nobackup
set viminfo+=n~/.vim/info
set undodir=~/.vim/undo
set undofile
set wildmenu
set wildmode=list:full
set visualbell
set hidden

" Display
syntax on
silent! colorscheme desert256
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
set listchars=eol:$,tab:>-,space:.,trail:*,extends:@,precedes:#
set completeopt=longest,menu
set colorcolumn=+1
set laststatus=2
set statusline=%<[%n]\ %F\ %h%m%r%=%k[%{(&fenc==\'\')?&enc:&fenc}%{(&bomb?\',BOM\':\'\')}][%{&ff}][ASCII=\%04.4B]\ %-10.(%l,%c%V%)\ %P

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

filetype plugin indent on