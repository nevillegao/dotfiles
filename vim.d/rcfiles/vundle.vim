filetype off

set rtp+=~/.vim.d/bundle/Vundle.vim
call vundle#begin('$HOME/.vim.d/bundle')

Plugin 'VundleVim/Vundle.vim'

" Programming
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
if v:version >= 703
    Plugin 'Valloric/YouCompleteMe'
endif
"Plugin 'sirver/ultisnips'
"Plugin 'honza/vim-snippets'

" HTML/XML
"Plugin 'mattn/emmet-vim'
"Plugin 'sukima/xmledit'

" Utility
"Plugin 'powerline/powerline'
"Plugin 'bling/vim-airline'
Plugin 'CmdlineComplete'
Plugin 'rking/ag.vim'
Plugin 'thinca/vim-visualstar'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
"Plugin 'mbbill/undotree'
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
