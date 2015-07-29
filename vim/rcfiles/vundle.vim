filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.Vim'

" Programming
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'msanders/snipmate.vim'
"Plugin 'majutsushi/tagbar'
"Plugin 'winmanager--Fox'
Plugin 'rstacruz/sparkup'

" C/C++
"Plugin 'a.vim'
"Plugin 'c.vim'
"Plugin 'OmniCppComplete'
"Plugin 'echofunc.vim'

" Utility
Plugin 'mbbill/fencview'
Plugin 'CmdlineComplete'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'Mark--Karkat'
Plugin 'FavEx'
Plugin 'VisIncr'
Plugin 'DrawIt'

" Color
Plugin 'desert256.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vividchalk'
Plugin 'ciaranm/inkpot'

call vundle#end()
