" GUI {{{1
  set encoding=utf-8
  set antialias
  set go-=T
  set go-=l
  set go-=L
  set go-=r
  set go-=R
  highlight SpellBad term=underline gui=undercurl guisp=Orange
" }}}

" MacVIM {{{1
  if has("gui_macvim")
    set guifont=Monaco:h11
    macmenu File.New\ Tab key=<nop>
    macmenu File.Print key=<nop>
  end
" }}}
