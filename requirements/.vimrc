set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin('~/.vim/bundle/')
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vimwiki/vimwiki'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'pthrasher/conqueterm-vim'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
set nu
let python_highlight_all=1
set laststatus=2
set showcmd
set nobackup
set cursorline
set hls
set noswapfile
set ignorecase
set linespace=0
set showmatch
set ambiwidth=double

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
let &termencoding=&encoding
set textwidth=79
set cc=80
color solarized

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = '/usr/bin/python3'
autocmd FileType python set omnifunc=python3complete#Complete
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '__pycache__'] 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
call togglebg#map("<F5>")
map <F11> :exec "%!xxd"<CR>
map <F12> :exec "%!xxd -r"<CR>

python3 << EOF
import os
import sys
from subprocess import Popen
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


