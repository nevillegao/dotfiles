filetype off

set rtp+=~/.vim.d/bundle/Vundle.vim
call vundle#begin('$HOME/.vim.d/bundle')

Plugin 'VundleVim/Vundle.vim'

" Programming
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'jpalardy/vim-slime'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
if v:version >= 703
    Plugin 'Valloric/YouCompleteMe'
endif
" Plugin 'sirver/ultisnips'
" Plugin 'honza/vim-snippets'

" HTML/XML
" Plugin 'mattn/emmet-vim'
" Plugin 'sukima/xmledit'

" Utility
Plugin 'CmdlineComplete'
Plugin 'rking/ag.vim'
Plugin 'thinca/vim-visualstar'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
" Plugin 'mbbill/undotree'
Plugin 'Mark--Karkat'
Plugin 'FavEx'

Plugin 'junegunn/vim-easy-align'
Plugin 'VisIncr'
Plugin 'itchyny/calendar.vim'
Plugin 'DrawIt'

" Color
Plugin 'desert256.vim'
Plugin 'ciaranm/inkpot'
Plugin 'tpope/vim-vividchalk'
Plugin 'tomasr/molokai'

call vundle#end()
