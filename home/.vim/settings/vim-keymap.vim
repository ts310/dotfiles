" make typing colon easier
nnoremap ; :

" Natural behavior with wordwrap on
nnoremap j gj
nnoremap k gk

" disable keys
nmap Q gq
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nmap <ESC><ESC> :nohlsearch<CR><ESC>
map <leader><space> :nohlsearch<CR>

nmap <silent> <Leader>ww :w!<CR>
nmap <silent> <Leader>up :up<CR>

" insert mode
imap  <C-e> <END>
imap  <C-a> <HOME>

" Enable vim navigation in insert mode
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" Buffers
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-tab> <C-w><C-w>
nnoremap <leader>v :vsp<CR><C-w>l
nnoremap <leader>h :split<CR><C-w>j
map <D-A-right> :bn<CR>
map <D-A-left> :bp<CR>

" Fast escape insert mode
"inoremap <Esc> <nop>
inoremap jj <ESC>
inoremap <C-c> <ESC>

" Strip all trading whitespace in current while
nmap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Folding
" HTML fold tag
nmap <leader>f Vatzf
nnoremap <leader>zr zR<CR>
nnoremap <leader>zm zM<CR>

" Sort css properties alphabetically
nmap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>i :set list!<CR>

" Formatting, TextMate-style
map <leader>Q gqip

" Make shortcut
nmap <leader>m :make<CR>

" Save on losing focus
"au focuslost * :wa

" Disable help key
map <F1> <nop>

" Move current line down/up
map <C-Up> dd<Up>P
map <C-Down> ddp

" Move visually selected lines down/up
vmap <C-Down> xp`[V`]
vmap <C-Up> x<Up>P`[V`]

" Move visual selection back/forwards
vmap <C-Left> x<BS>P`[v`]
vmap <C-Right> x<Space>P`[v`]

" Xcode header to implementation shortcut
vmap <D-A-Up> :e %:p:s,.h$,.X123X,:s,.m$,.h,:s,.X123X$,.m,<CR>

" Forgot sudo
cmap w!! w !sudo tee % >/dev/null

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" use quickfix for vimrgrep
autocmd QuickFixCmdPost *grep* cwindow

" Close current buffer
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")
  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif
  if bufnr("%") == l:currentBufNum
    new
  endif
  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

" Toggle fold state between closed and opened.
" If there is no fold at current line, just moves forward.
" If it is present, reverse it's state.
function! ToggleFold()
  if foldlevel('.') == 0
    normal! l
  else
    if foldclosed('.') < 0
      . foldclose
    else
      . foldopen
    endif
  endif
  " Clear status line
  echo
endfun
