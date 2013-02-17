" GUI {{{1
  " Encoding
  set encoding=utf-8

  " Font
  set antialias

  " Theme
  colorscheme molokai

  " Scrollbars
  set go-=T
  set go-=l
  set go-=L
  set go-=r
  set go-=R

  " Cursor
  highlight SpellBad term=underline gui=undercurl guisp=Orange
" }}}

" MacVIM {{{1
  if has("gui_macvim")
    " set guifont=Monaco:h13
    " set guifont=Menlo:h12
    set guifont=Monaco:h11

    " Disable macvim menu key
    macmenu File.New\ Tab key=<nop>
    macmenu File.Print key=<nop>
  end
" }}}
