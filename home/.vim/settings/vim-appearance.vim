set background=dark
colorscheme jellybeans

"hi NonText guifg=gray cterm=none ctermfg=gray
"hi SpecialKey guifg=gray cterm=none ctermfg=gray
"hi statusline cterm=none ctermfg=white ctermbg=darkgreen gui=none guifg=white guibg=darkgreen

au InsertEnter * hi statusline ctermbg=darkred guibg=darkred
au InsertLeave * hi statusline ctermbg=darkgreen guibg=darkgreen
