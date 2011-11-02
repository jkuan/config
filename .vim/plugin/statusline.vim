" solarized colors
"let s:base03      = "#002b36"
"let s:base02      = "#073642"
"let s:base01      = "#586e75"
"let s:base00      = "#657b83"
"let s:base0       = "#839496"
"let s:base1       = "#93a1a1"
"let s:base2       = "#eee8d5"
"let s:base3       = "#fdf6e3"
"let s:yellow      = "#b58900"
"let s:orange      = "#cb4b16"
"let s:red         = "#dc322f"
"let s:magenta     = "#d33682"
"let s:violet      = "#6c71c4"
"let s:blue        = "#268bd2"
"let s:cyan        = "#2aa198"
"let s:green       = "#859900" "original
"let s:green       = "#719e07" "experimental

" first, enable status line always
set laststatus=2

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guifg=#d33682
  elseif a:mode == 'r'
    hi statusline guifg=#dc322f
  " vim has no event VisualEnter
  "elseif a:mode == 'v'
    "hi statusline guifg=#b58900
  else
    hi statusline guifg=#268bd2
  endif
endfunction

" now set it up to change the status line based on mode
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guifg=#839496
" default the statusline to base0 when entering Vim
hi statusline guifg=#839496

