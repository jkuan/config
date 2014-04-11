call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" make sure these 2 pathogen lines come before enabling filetype detection

syntax on
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
let g:tex_flavor="latex"

" use , as leader
let mapleader = ","
set sw=4
set tw=100
set ignorecase
set smartcase
set title
set laststatus=2
set scrolloff=6
set hlsearch
set incsearch
set ruler
set showcmd
set backspace=indent,eol,start
set visualbell
"nostartofline, makes vim remember cursor column
set nosol 
set tabstop=4
if has("gui_running")
	set guioptions=egmrt
	let g:indent_guides_enable_on_vim_startup = 1
	let g:indent_guides_color_change_percent = 4
	colorscheme solarized
endif
autocmd FileType text setlocal wrap linebreak textwidth=0
set wildmode=list:longest
map <leader>g Vgq
" just use included matchit plugin
source $VIMRUNTIME/macros/matchit.vim

" use arrow keys to navigate screen lines in normal mode
nmap <Down> gj
nmap <Up> gk
"make Y consistent with C and D
nnoremap Y y$ 
" hopefully ack.vim is installed
nmap g/ :Ack 
nnoremap <leader>v `[v`]
" clear search highlighting
nmap // :nohlsearch<CR>
" use less css syntax highlighting file
au BufNewFile,BufRead *.less set filetype=less

" hide source control metadata for ctrlp
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
"set wildignore+=.git\*,.hg\*,.svn\*         " for Windows

" either cul or syntax highlighting needs to be off for latex files
au FileType latex set nocursorline
au FileType tex set nocursorline
" use {{{ and }}} for folds
set foldmethod=marker

" use letters to escape to normal mode
ino jj <esc>
cno jj <c-c>
"for visual mode only
xn v <esc> 
"for select mode only
snor jj <esc> 

" bracketed paste mode -- turn off auto-indent when pasting in terminal vim
if &term =~ "xterm.*"
	let &t_ti = &t_ti . "\e[?2004h"
	let &t_te = "\e[?2004l" . &t_te
	function XTermPasteBegin(ret)
		set pastetoggle=<Esc>[201~
		set paste
		return a:ret
	endfunction
	map <expr> <Esc>[200~ XTermPasteBegin("i")
	imap <expr> <Esc>[200~ XTermPasteBegin("")
	cmap <special> <Esc>[200~ <nop>
 	cmap <special> <Esc>[201~ <nop>
endif

