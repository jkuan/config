" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

:syntax on
set ignorecase
set smartcase
set title
set scrolloff=5
set sw=4
set tw=100
set hlsearch
set ruler
set showcmd
set tabstop=4
if has("gui_running")
	set guioptions=egmrt
endif
autocmd FileType text setlocal wrap linebreak textwidth=0
set wildmenu

" use letters to escape to normal mode
ino jj <esc>
cno jj <c-c>
vno v <esc>

