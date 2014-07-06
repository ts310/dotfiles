set background=dark
colorscheme jellybeans

hi NonText      guifg=gray   cterm=none ctermfg=gray
hi SpecialKey   guifg=gray   cterm=none ctermfg=gray
hi statusline   guifg=white  cterm=none ctermfg=white ctermbg=darkgreen gui=none guibg=darkgreen

hi TabLine      ctermfg=black  ctermbg=green     cterm=none
hi TabLineFill  ctermfg=black  ctermbg=green     cterm=none
hi TabLineSel   ctermfg=white  ctermbg=darkblue  cterm=none

au InsertEnter * hi statusline ctermbg=darkred   guibg=darkred
au InsertLeave * hi statusline ctermbg=darkgreen guibg=darkgreen
