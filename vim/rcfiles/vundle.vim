filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.Vim'

" Programming
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'winmanager--Fox'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'

" C/C++
Plugin 'a.vim'
Plugin 'c.vim'
Plugin 'OmniCppComplete'
Plugin 'echofunc.vim'

" HTML
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'sukima/xmledit'

" Utility
Plugin 'mbbill/fencview'
Plugin 'powerline/powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'grep.vim'
Plugin 'rking/ag.vim'
Plugin 'FuzzyFinder'
Plugin 'AutoComplPop'
Plugin 'CmdlineComplete'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'Mark'
Plugin 'FavEx'
Plugin 'mru.vim'
Plugin 'Align'
Plugin 'VisIncr'
Plugin 'DrawIt'

" Color
Plugin 'ciaranm/inkpot'
Plugin 'peaksea'
Plugin 'desertEx'
Plugin 'molokai'
Plugin 'Zenburn'
Plugin 'desert256.vim'
Plugin '256-grayvim'
Plugin 'The-Vim-Gardener'

call vundle#end()
