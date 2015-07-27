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

" C/C++
Plugin 'a.vim'
Plugin 'c.vim'
Plugin 'OmniCppComplete'
Plugin 'echofunc.vim'

" HTML
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'sukima/xmledit'

" Utility
Plugin 'powerline/powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/calendar-vim'
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'kien/ctrlp.vim'
Plugin 'grep.vim'
Plugin 'rking/ag.vim'
Plugin 'AutoComplPop'
Plugin 'CmdlineComplete'
Plugin 'vimwiki'
Plugin 'bufexplorer.zip'
Plugin 'QuickBuf'
Plugin 'FencView.vim'
Plugin 'Mark'
Plugin 'FavEx'
Plugin 'mru.vim'
Plugin 'Align'
Plugin 'VisIncr'
Plugin 'vim2ansi'
Plugin 'sketch.vim'
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
