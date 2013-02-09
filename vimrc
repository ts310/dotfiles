" vim: nowrap fdm=marker

" Initial settings {{{
  set nocompatible
  set encoding=utf-8
  let mapleader = ","
  " Shortcut for edit/source vim runtime configuration in command
  command! Ev edit $MYVIMRC
  command! Rv source $MYVIMRC
" }}}

" Load plugins {{{
  filetype off
  runtime macros/matchit.vim
  runtime ftplugin/man.vim
  set rtp+=~/.vim/vundle.git/
  call vundle#rc()
  " Plugins {{{
    Bundle 'gmarik/vundle'
    Bundle 'Shougo/neocomplcache'
    Bundle 'Shougo/vimproc'
    Bundle 'thinca/vim-ref'
    Bundle 'Shougo/unite.vim'
    Bundle 'unite-colorscheme'
    Bundle 'h1mesuke/unite-outline'
    Bundle 'tsukkee/unite-tag'
    Bundle 'kmnk/vim-unite-svn'
    Bundle 'Color-Sampler-Pack'
    Bundle 'Source-Explorer-srcexpl.vim'
    Bundle 'scrooloose/nerdtree'
    Bundle 'vim-scripts/taglist.vim'
    Bundle 'mileszs/ack.vim'
    Bundle 'wincent/Command-T'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'tpope/vim-surround'
    Bundle 'vim-scripts/Align'
    Bundle 'vim-scripts/YankRing.vim'
    Bundle 'linediff.vim'
    Bundle 'vim-scripts/matchit.zip'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-git'
    Bundle 'svn-diff.vim'
    Bundle 'php.vim'
    Bundle 'phpcomplete.vim'
    Bundle 'php-doc'
    Bundle 'tpope/vim-rails'
    Bundle 'groenewege/vim-less'
    Bundle 'cocoa.vim'
    Bundle 'vim-scripts/ZenCoding.vim'
    Bundle 'vcscommand.vim'
    Bundle 'SearchComplete'
    Bundle 'SQLComplete.vim'
    Bundle 'vim-coffee-script'
  " }}}
  filetype plugin indent on
" }}}

" Behaviour {{{
  set backspace=indent,eol,start
  set wrapscan
  "set spell spelllang=en_us
  set ignorecase
  set smartcase
  set incsearch
  set hlsearch
  set showmatch
  set gdefault
  set wildmenu
  set wildchar=<Tab>
  set wildmode=list:full
  set history=100
  set complete+=k
  set cmdheight=2
  set visualbell t_vb=
  set hidden
  set nojoinspaces
  set wildmode=longest,list
  set nrformats=
  if has('mouse')
    set mouse=a
    set guioptions+=a
    set ttymouse=xterm2
  endif
  set nobackup
  set noswapfile
  set autoindent
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set foldmethod=indent
  set virtualedit+=block
  set clipboard+=unnamed
  set tags+=.tags
" }}}

" Mappings {{{
  nnoremap ; :

  " Natural behavior with wordwrap on
  nnoremap j gj
  nnoremap k gk

  nmap <ESC><ESC> ;nohlsearch<CR><ESC>
  map <leader><space> :noh<CR>

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

  " Automatically move to last cursor position
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  endif

  noremap <space> :call ToggleFold()<CR>

  " Fast escape insert mode
  inoremap <Esc> <nop>
  inoremap jj <ESC>

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
" }}}

" Appearance {{{
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
  set ruler
  set showcmd
  set laststatus=2
  set listchars=tab:▸\ ,eol:¬
  set number
  set numberwidth=5
  set cursorline
  if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
  endif
  if has("gui")
    colorscheme molokai
  end
" }}}

" Syntax {{{
  au FileType make         setlocal ts=8 sts=8 sw=8 noet
  au FileType yaml         setlocal ts=2 sts=2 sw=2 et
  au FileType php          setlocal ts=4 sts=4 sw=4 noet foldmethod=indent
  au FileType smarty       setlocal ts=2 sts=2 sw=2 noet foldmethod=indent
  au FileType java         setlocal ts=4 sts=4 sw=4 et   foldmethod=syntax
  au FileType vim          setlocal ts=2 sts=2 sw=2 et
  au FileType html         setlocal ts=2 sts=2 sw=2 et
  au FileType css          setlocal ts=2 sts=2 sw=2 et   foldmethod=indent
  au FileType javascript   setlocal ts=4 sts=4 sw=4 et   foldmethod=indent
  au FileType sh           setlocal ts=2 sts=2 sw=2 et
  au FileType actionscript setlocal ts=2 sts=2 sw=2 et
  au FileType ruby         setlocal ts=2 sts=2 sw=2 et   foldmethod=indent
  au FileType sql          setlocal ts=2 sts=2 sw=2 noet foldmethod=indent

  au BufNewFile,BufRead *.rss     setfiletype xml
  au BufNewFile,BufRead *.thtml   setfiletype php
  au BufNewFile,BufRead *.tpl     setfiletype smarty
  au BufNewFile,BufRead *_spec.rb compiler    rspec
  au BufNewFile,BufRead *.as      setfiletype actionscript

  " PHP
  command! Cphp :!php -l %
  nnoremap <F6> :Cphp<CR>
  let tlist_php_settings = 'php;c:class;f:function'
" }}}

" Plugin Settings {{{
  " Netrw {{{
    let g:netrw_browse_split = 0
    let g:netrw_liststyle = 3
    let g:netrw_altv = 1
    let g:netrw_alto = 1
  " }}}

  " NerdTree {{{
    map <leader>n :NERDTreeToggle<CR>
    map <F1> :NERDTreeToggle<CR>
    nnoremap <leader>nr :NERDTreeFind<CR>
    let NERDTreeWinSize = 27
    let NERDTreeQuitOnOpen = 1
    let NERDTreeShowBookmarks = 0
  " }}}

  " TagList {{{
    let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
    let Tlist_Use_Right_Window = 1
    map <leader>5 :TlistToggle<CR>
    map <F3> :TlistToggle<CR>
  " }}}

  " Tagbar {{{
    "let g:tagbar_width = 27
    "map <F3> :TagbarToggle<CR>
  " }}}

  " Ack {{{
    map <leader>a :Ack<space>
  " }}}

  " Fugitive {{{
    command! Gd :Gdiff
    command! Gc :Gcommit
    command! Gw :Gwrite
    command! Gs :Gstatus
  " }}}

  " Neocomplcache {{{
    let g:neocomplcache_enable_at_startup = 1
  " }}}

  " Zen coding {{{
    let g:user_zen_leader_key = '<c-e>'
    let g:use_zen_complete_tag = 1
  " }}}

  " Unite {{{
    let g:unite_enable_start_insert = 1
    nnoremap <silent> <leader>ub :<C-u>Unite buffer -toggle<CR>
    nnoremap <silent> <leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
    nnoremap <silent> <leader>ur :<C-u>Unite -buffer-name=register register -toggle<CR>
    nnoremap <silent> <leader>um :<C-u>Unite file_mru -toggle<CR>
    nnoremap <silent> <leader>uu :<C-u>Unite buffer file_mru -toggle<CR>
    nnoremap <silent> <leader>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file -toggle<CR>
    nnoremap <silent> <leader>uo :<C-u>Unite outline -toggle<CR>
    nnoremap <silent> <leader>uc :<C-u>Unite colorscheme -toggle<CR>
    nnoremap <silent> <leader>ut :<C-u>Unite tag -toggle<CR>
    map <F2> <leader>ua
    "map <F3> <leader>uf
  " }}}

  " CommantT {{{
    let g:CommandTMaxFiles = 55000
    let g:CommandTMaxDepth = 40
    let g:CommandTMaxHeight = 30
    let g:CommandTMatchWindowAtTop = 0
    let g:CommandTMatchWindowReverse = 0
    nnoremap <silent> <Leader>t :CommandT<CR>
    nnoremap <silent> <Leader>b :CommandTBuffer<CR>
  " }}}

  " YankRing {{{
    let g:yankring_max_history = 400
    let g:yankring_window_use_separate = 1
    let g:yankring_history_dir = '~/.vim/tmp/'
  " }}}

  " Gtags {{{
    "map <C-g> :Gtags 
    "map <F3> :Gtags -f %<CR>
    "map <C-u> :Gtags -f %<CR>
    "map <C-t><C-t> :GtagsCursor<CR>
    "map <C-n> :cn<CR>
    "map <C-p> :cp<CR>
  " }}}

  " Unite tag {{{
    "if empty(&buftype)
      "nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
    "endif
  " }}}
    
  " Powerline {{{
    "let g:Powerline_symbols = 'fancy'
    "set t_Co=256
  " }}}
" }}}

" Functions {{{
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
" }}}

" Notes {{{
  " Vim folding commands
  " zf#j creates a fold from the cursor down # lines.
  " zf/string creates a fold from the cursor to string .
  " zj moves the cursor to the next fold.
  " zk moves the cursor to the previous fold.
  " zo opens a fold at the cursor.
  " zO opens all folds at the cursor.
  " zm increases the foldlevel by one.
  " zM closes all open folds.
  " zr decreases the foldlevel by one.
  " zR decreases the foldlevel to zero -- all folds will be open.
  " zd deletes the fold at the cursor.
  " zE deletes all folds.
  " [z move to start of open fold.
  " ]z move to end of open fold.
" }}}
