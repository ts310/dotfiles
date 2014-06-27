" Netrw {{{
let g:netrw_browse_split = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_alto = 1
" }}}

" Ag {{{
map <leader>ag :Ag -i<space>
abbrev ag Ag
" }}}

" Fugitive {{{
command! Gd :Gdiff
command! Gc :Gcommit
command! Gw :Gwrite
command! Gs :Gstatus
" }}}

" VCSCommand
nnoremap [VCS] <Nop>
nmap <Leader>v [VCS]
let g:VCSCommandMapPrefix = '[VCS]'
" }}}

" Gitv {{{
let g:Gitv_OpenHorizontal = 0
let g:Gitv_WrapLines = 0
let g:Gitv_OpenPreviewOnLaunch = 1
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>
cabbrev git Git
" }}}

" Switch {{{
nnoremap - :Switch<cr>
" }}}

" Vim airline {{{
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" }}}

