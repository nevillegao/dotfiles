filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Programming
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
if v:version >= 703
    "Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'tpope/vim-fugitive'

"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'

"Plugin 'rstacruz/sparkup'

" C/C++
"Plugin 'a.vim'
"Plugin 'c.vim'
"Plugin 'OmniCppComplete'
"Plugin 'echofunc.vim'

" Utility
Plugin 'CmdlineComplete'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'mbbill/fencview'
"Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
"Plugin 'mbbill/undotree'
"Plugin 'Mark--Karkat'
"Plugin 'FavEx'
"Plugin 'VisIncr'
"Plugin 'DrawIt'
"Plugin 'fholgado/minibufexpl.vim'

" Color
Plugin 'desert256.vim'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-vividchalk'
Plugin 'ciaranm/inkpot'

call vundle#end()
