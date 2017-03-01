filetype off

set runtimepath+=~/.vim.d/bundle/Vundle.vim
call vundle#begin('$HOME/.vim.d/bundle')

Plugin 'VundleVim/Vundle.vim'

" Programming
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'jpalardy/vim-slime'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-syntastic/syntastic'
if v:version >= 703 && !has("win32")
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'elzr/vim-json'

" Utility
Plugin 'CmdlineComplete'
Plugin 'mileszs/ack.vim'
Plugin 'thinca/vim-visualstar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'Mark--Karkat'
Plugin 'FavEx'

Plugin 'junegunn/vim-easy-align'
Plugin 'VisIncr'
Plugin 'itchyny/calendar.vim'
Plugin 'DrawIt'

" Color
Plugin 'flazz/vim-colorschemes'
Plugin 'felixhummel/setcolors.vim'

call vundle#end()
