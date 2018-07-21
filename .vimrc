execute pathogen#infect()
" make sure these pathogen lines come before enabling filetype detection

syntax on
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor="latex"

let mapleader=" "
filetype plugin indent on
set nocompatible
set scrolloff=5
set tw=100
nnoremap n nzz
nnoremap N Nzz
set ignorecase
set smartcase
set autoindent
" don't align c preprocessor macros to column 1
set cinkeys-=0#
set showmatch
set expandtab
set shiftwidth=4
set tabstop=4
set title
set laststatus=2
set hlsearch
set incsearch
set shiftround
set ruler
set showcmd
set backspace=indent,eol,start
set visualbell
"nostartofline, makes vim remember cursor column
set nosol 
if has("gui_running")
	set guioptions=egmrt
	let g:indent_guides_enable_on_vim_startup = 1
	let g:indent_guides_color_change_percent = 4
	colorscheme solarized
endif
autocmd FileType text setlocal wrap linebreak textwidth=0
set wildmode=list:longest
map <leader>g Vgq

" use included matchit plugin
source $VIMRUNTIME/macros/matchit.vim

" use arrow keys to navigate screen lines in normal mode
nmap <Down> gj
nmap <Up> gk

command WQ wq
command Wq wq
command Q q

let g:SuperTabLongestEnhanced=1
let g:SuperTabLongestHighlight=1 

let g:easy_align_delimiters = {
\ '\': { 'pattern': '\\$', 'left_margin': 2, 'right_margin': 0, 'stick_to_left': 0 },
\ }

function TabsOrSpaces()
    " Determines whether to use spaces or tabs on the current buffer.
    "if getfsize(bufname("%")) > 256000
    if getfsize(bufname("%")) > 10000
        " File is very large, just use the default.
        return
    endif

    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^ "'))

    if numTabs > numSpaces
        setlocal noexpandtab
    else
        setlocal expandtab
    endif
endfunction

" Call the function after opening a buffer
autocmd BufReadPost * call TabsOrSpaces()

nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>w :Ack!<Space><C-R><C-W><CR>
"make Y consistent with C and D
nnoremap Y y$ 
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

