:set cul
:set guifont=DejaVu\ Sans\ Mono:h12

":set statusline=%<\(%n\)\ %f\ %h%m%r%=%y[%{&encoding}:%{&fileformat}]\ %-14.(%l,%c%V%)\ %P
:set statusline=%<\(%n\)\ %f\ %h%m%r%=%y\ %-14.(%l,%c%V%)\ %P
:set statusline=%<\(%n\)\ %f\ %h%m%r%#warningmsg#%{SyntasticStatuslineFlag()}%*%=%y\ %-14.(%l,%c%V%)\ %P

set history=500

" toggle showing whitespace
set listchars=tab:▸\ ,eol:¬
nmap <silent> <leader>l :set list!<CR>

