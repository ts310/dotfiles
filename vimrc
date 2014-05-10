" vim: nowrap fdm=marker

" Initial settings {{{
  set nocompatible
  set encoding=utf-8
  let mapleader = " "
  let g:mapleader = " "
  " Shortcut for edit/source vim runtime configuration in command
  command! Ev edit $MYVIMRC
  command! Rv source $MYVIMRC
" }}}

" Load plugins {{{
  filetype off
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  " Plugins {{{
    Bundle 'AndrewRadev/linediff.vim'
    Bundle 'AndrewRadev/switch.vim'
    Bundle 'alpaca-tc/alpaca_tags'
    Bundle 'gmarik/vundle'
    Bundle 'gregsexton/gitv'
    Bundle 'groenewege/vim-less'
    Bundle 'guillemc/vimref'
    Bundle 'kchmck/vim-coffee-script'
    Bundle 'kien/ctrlp.vim'
    Bundle 'majutsushi/tagbar'
    Bundle 'mrtazz/simplenote.vim'
    Bundle 'msanders/cocoa.vim'
    Bundle 'rizzatti/dash.vim'
    Bundle 'rizzatti/funcoo.vim'
    Bundle 'rking/ag.vim'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'scrooloose/nerdtree'
    Bundle 'scrooloose/syntastic'
    Bundle 'tomasr/molokai'
    Bundle 'tpope/vim-endwise'
    Bundle 'tpope/vim-fugitive'
    Bundle 'tpope/vim-git'
    Bundle 'tpope/vim-markdown'
    Bundle 'tpope/vim-rails'
    Bundle 'tpope/vim-surround'
    Bundle 'vim-scripts/Align'
    Bundle 'vim-scripts/CodeReviewer.vim'
    Bundle 'vim-scripts/Color-Sampler-Pack'
    Bundle 'vim-scripts/ZoomWin'
    Bundle 'vim-scripts/matchit.zip'
    Bundle 'vim-scripts/php-doc'
    Bundle 'vim-scripts/php.vim'
    Bundle 'vim-scripts/phpcomplete.vim'
    Bundle 'vim-scripts/sudo.vim'
    Bundle 'vim-scripts/vcscommand.vim'
    Bundle 'thoughtbot/vim-rspec'
    Bundle 'jgdavey/tslime.vim'
    Bundle 'mattn/emmet-vim'
    Bundle 'bling/vim-airline'
    Bundle 'juneedahamed/svnj.vim'
    Bundle 'szw/vim-tags'
    Bundle 'altercation/vim-colors-solarized.git'
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
  set history=1000
  set complete+=k
  set cmdheight=2
  set visualbell t_vb=
  set hidden
  set nojoinspaces
  set wildmode=longest,list
  set wildignore+=.git/*,*/cache/*,.svn/*,*.log,*.o
  set nrformats=
  set fillchars+=stl:\ ,stlnc:\
  if has('mouse')
    set mouse=a
    set guioptions+=a
    set ttymouse=xterm2
  endif
  set cursorline
  set nobackup
  set noswapfile
  set autoindent
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set expandtab
  set foldmethod=indent
  set foldlevel=99
  set foldlevelstart=99
  set virtualedit+=block
  set clipboard+=unnamedplus,unnamed
  set tags+=.tags
  set lazyredraw
  set list!
" }}}

" Mappings {{{
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

  " Automatically move to last cursor position
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  endif

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
" }}}

" Appearance {{{
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
  set ruler
  set showcmd
  set laststatus=2
  set listchars=tab:▸\ ,eol:¬,nbsp:.
  hi NonText guifg=gray cterm=none ctermfg=gray
  hi SpecialKey guifg=gray cterm=none ctermfg=gray
  set number
  set numberwidth=5
  set nocursorcolumn
  set nocursorline
  syntax sync minlines=256
  if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
  endif
  set background=dark
  colorscheme solarized
  hi statusline cterm=none ctermfg=white ctermbg=darkgreen gui=none guifg=white guibg=darkgreen
  au InsertEnter * hi statusline ctermbg=darkred guibg=darkred
  au InsertLeave * hi statusline ctermbg=darkgreen guibg=darkgreen
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
    map <leader>d :NERDTreeToggle<CR>
    nnoremap <leader>nr :NERDTreeFind<CR>
    nnoremap <leader>f :NERDTreeFind<CR>
    let NERDTreeWinSize = 27
    let NERDTreeQuitOnOpen = 1
    let NERDTreeShowBookmarks = 0
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

  " Ctrlp {{{
    "let g:loaded_ctrlp = 1
    let g:ctrlp_map = '<C-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_max_height = 16
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_max_files = 0
    let g:ctrlp_working_path_mode = ''
    let g:ctrlp_extensions = ['tag', 'buffertag', 'dir']
    let g:ctrlp_max_height = 40
    " 'tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir'
    map <Leader>p :CtrlP<CR>
  " }}}

  " YankRing {{{
    "let g:yankring_max_history = 400
    "let g:yankring_window_use_separate = 1
    "let g:yankring_history_dir = $HOME . '/.vim/tmp/'
  " }}}

  " CodeReviewer {{{
    let g:CodeReviewer_reviewer = "saito"
    let g:CodeReviewer_reviewFile = $HOME . "/Dropbox/vim/review.rev"
  " }}}

  " vimref {{{
    let g:ref_phpmanual_path = $HOME . '/Dropbox/manuals/php'
  " }}}

 " vim-quickrun {{{
    "let g:quickrun_config = {}
    "let g:quickrun_config.markdown = {
    "      \ 'outputter' : 'null',
    "      \ 'command'   : 'open',
    "      \ 'cmdopt'    : '-a',
    "      \ 'args'      : 'Marked',
    "      \ 'exec'      : '%c %o %a %s',
    "      \ }
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

  " Simplenote {{{
    if filereadable($HOME . '/.simplenoterc')
      exe 'source ' . $HOME . '/.simplenoterc'
    endif
  " }}}

  " Vim rspec {{{
    let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
  " }}}

  " Vim airline {{{
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
  " }}}

  " Vim tags {{{
    let g:vim_tags_auto_generate = 1
    let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -f .tags -R {OPTIONS} {DIRECTORY} 2>/dev/null &"
    let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null &"
    set tags+=.tags
    set tags+=.Gemfile.lock.tags
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
