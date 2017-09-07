set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin('~/.vim/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vimwiki/vimwiki'
Plugin 'google/yapf'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'asins/vimcdoc'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set nu
let python_highlight_all=1 
set sw=4 ts=4 sts=4 expandtab
set nobackup
set hls
set noswapfile
set ignorecase
hi pythonSelf ctermfg=174 guifg=#6094DB cterm=bold gui=bold
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set cc=80
set go=m
set t_Co=256

autocmd FileType python set omnifunc=python3complete#Complete
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nnoremap <C-]> :YcmCompleter GoToDefinitionElseDeclaration<CR>

map <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
autocmd FileType python nnoremap <F4> :0,$!yapf<CR>
map <F5> :call Run()<CR>
map <F10> :exec "%!xxd"<CR>
map <F12> :exec "%!xxd -r"<CR>

func! Run()
    if &filetype == 'python'
        exec "!python3 %"
    endif
endfunc
