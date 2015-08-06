filetype off

set rtp+=~/.vim.d/bundle/Vundle.vim
call vundle#rc("$HOME/.vim.d/bundle")
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Programming
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
if v:version >= 703
    Plugin 'Valloric/YouCompleteMe'
endif
"Plugin 'sirver/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'

" HTML/XML
"Plugin 'mattn/emmet-vim'
"Plugin 'othree/xml.vim'

" Utility
Plugin 'CmdlineComplete'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'mbbill/fencview'
"Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'mbbill/undotree'
"Plugin 'Mark--Karkat'
"Plugin 'FavEx'
"Plugin 'VisIncr'
"Plugin 'DrawIt'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'powerline/powerline'
"Plugin 'bling/vim-airline'

" Color
Plugin 'desert256.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vividchalk'
Plugin 'ciaranm/inkpot'

call vundle#end()
