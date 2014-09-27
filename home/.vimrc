" ------------------------------------------------------------
" Plugin
" ------------------------------------------------------------
" {{{
  set nocompatible
  filetype off

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " {{{
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tpope/vim-sensible'
    Plugin 'Shougo/unite.vim'
    Plugin 'Shougo/vimproc.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'kien/ctrlp.vim'
    Plugin 'gregsexton/gitv'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'rking/ag.vim'
    Plugin 'bling/vim-airline'
    Plugin 'szw/vim-tags'
    Plugin 'vim-scripts/vcscommand.vim'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'vim-scripts/Align'
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/syntastic'
    Plugin 'vim-scripts/matchit.zip'
    Plugin 'mattn/emmet-vim'
    Plugin 'tomasr/molokai'
    Plugin 'nanotech/jellybeans.vim'
    Plugin 'mkitt/tabline.vim'
    Plugin 'majutsushi/tagbar'
  " }}}

  call vundle#end()
  filetype plugin indent on
" }}}

" ------------------------------------------------------------
" Basic settings
" ------------------------------------------------------------
" {{{
  set hidden
  set number
  set backspace=indent,eol,start
  set history=1000
  set showcmd
  set showmode
  set visualbell t_vb=
  set autoread
  set encoding=utf-8
  set virtualedit+=block
  set clipboard+=unnamedplus,unnamed,autoselect
  set tags+=.tags
  set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
  set ruler
  set laststatus=2
  set cmdheight=1
  set cursorline
" }}}
"
" ------------------------------------------------------------
"  Optimization
" ------------------------------------------------------------
" {{{
  set noshowmatch
  set lazyredraw
  set scrolljump=8
  let loaded_matchparen=1
  let html_no_rendering=1
" }}}

" ------------------------------------------------------------
" Basic settings
" ------------------------------------------------------------
" {{{
  syntax sync minlines=256 " Fof performance gain

  " Shortcut for edit/source vim runtime configuration in command
  command! Ev edit $MYVIMRC
  command! Rv source $MYVIMRC

  " Automatically move to last cursor position
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  endif
" }}}

" ------------------------------------------------------------
" Turn Off Swap Files
" ------------------------------------------------------------
" {{{
  set noswapfile
  set nobackup
  set nowb
" }}}

" ------------------------------------------------------------
" Persistent undo settings
" ------------------------------------------------------------
" {{{
  if has('persistent_undo')
    silent !mkdir ~/.vim/tmp/backups > /dev/null 2>&1
    set undodir=~/.vim/tmp/backups
    set undofile
  endif
" }}}

" ------------------------------------------------------------
" Indentation settings
" ------------------------------------------------------------
" {{{
  set autoindent
  set smartindent
  set smarttab
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab
  set list
  set listchars=eol:¬,tab:▸\ ,nbsp:.
  set wrap
  set linebreak
" }}}

" ------------------------------------------------------------
" Folds settings
" ------------------------------------------------------------
" {{{
  set foldmethod=indent
  set foldnestmax=3
  set foldenable
  set foldlevel=99
  set foldlevelstart=99
" }}}

" ------------------------------------------------------------
" Completion settings
" ------------------------------------------------------------
" {{{
  set wildmode=list:longest
  set wildchar=<Tab>
  set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
  set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
  set wildignore+=*vim/tmp/backups*
  set wildignore+=.git/*,*/cache/*,.svn/*,*.log,*.html
  set wildignore+=*sass-cache*
  set wildignore+=*DS_Store*
  set wildignore+=vendor/rails/**
  set wildignore+=vendor/cache/**
  set wildignore+=*.gem
  set wildignore+=log/**
  set wildignore+=tmp/**
  set wildignore+=*.png,*.jpg,*.gif
" }}}

" ------------------------------------------------------------
" Mouse settings
" ------------------------------------------------------------
" {{{
  if has('mouse')
    set mouse=a
    set guioptions+=a
    set ttymouse=xterm2
  endif
" }}}

" ------------------------------------------------------------
" Search settings
" ------------------------------------------------------------
" {{{
  set incsearch
  set hlsearch
  set viminfo='100,f1
  set ignorecase
  set smartcase
  set wrapscan
  set showmatch
  set gdefault
  set complete+=k
  set nojoinspaces
  set nrformats=
  set fillchars+=stl:\ ,stlnc:\
" }}}

" ------------------------------------------------------------
" Appearance
" ------------------------------------------------------------
" {{{
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
" }}}

" ------------------------------------------------------------
" Scrolling settings
" ------------------------------------------------------------
"  {{{
  set scrolloff=8
  set sidescrolloff=15
  set sidescroll=1
" }}}

" ------------------------------------------------------------
" Key mapping
" ------------------------------------------------------------
" {{{
  let mapleader=" "

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

  imap  <C-e> <END>
  imap  <C-a> <HOME>

  imap <C-j> <Down>
  imap <C-k> <Up>
  imap <C-h> <Left>
  imap <C-l> <Right>

  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
  nnoremap <C-tab> <C-w><C-w>
  nnoremap <leader>v :vsp<CR><C-w>l
  nnoremap <leader>h :split<CR><C-w>j
  map <D-A-right> :bn<CR>
  map <D-A-left> :bp<CR>

  " Strip all trading whitespace in current while
  nmap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

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

" ------------------------------------------------------------
" Syntax
" ------------------------------------------------------------
" {{{
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
  command! Cphp :!php -l %
  nnoremap <F6> :Cphp<CR>
  let tlist_php_settings = 'php;c:class;f:function'
" }}}

" ------------------------------------------------------------
" CtrlP
" ------------------------------------------------------------
" {{{
  let g:ctrlp_map = '<C-p>'
  let g:ctrlp_cmd = 'CtrlP'
  map <Leader>p :CtrlP<CR>
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_max_height = 40
  let g:ctrlp_max_files = 0 " unlimited
  let g:ctrlp_working_path_mode = ''
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_extensions = ['tag', 'buffertag', 'dir']
  let g:ctrlp_clear_cache_on_exit = 0
  let g:ctrlp_use_migemo = 1
" }}}


" ------------------------------------------------------------
" Nerdtree
" ------------------------------------------------------------
" {{{
  nnoremap <leader>nr :NERDTreeFind<CR>
  nnoremap <leader>n :NERDTreeToggle<CR>
  nnoremap <F1> :NERDTreeToggle<CR>
  nnoremap <leader>d :NERDTreeToggle<CR>
  let NERDTreeWinSize = 27
  let NERDTreeQuitOnOpen = 1
  let NERDTreeShowBookmarks = 0
  let NERDTreeShowHidden=1
" }}}

" ------------------------------------------------------------
" Netrw
" ------------------------------------------------------------
" {{{
  let g:netrw_browse_split = 0
  let g:netrw_liststyle = 3
  let g:netrw_altv = 1
  let g:netrw_alto = 1
" }}}

" ------------------------------------------------------------
" Ag
" ------------------------------------------------------------
" {{{
  map <leader>ag :Ag -i<space>
  abbrev ag Ag
" }}}

" ------------------------------------------------------------
" Fugitive
" ------------------------------------------------------------
" {{{
  command! Gd :Gdiff
  command! Gc :Gcommit
  command! Gw :Gwrite
  command! Gs :Gstatus
" }}}

" ------------------------------------------------------------
" VCSCommand
" ------------------------------------------------------------
" {{{
  nnoremap [VCS] <Nop>
  nmap <Leader>v [VCS]
  let g:VCSCommandMapPrefix = '[VCS]'
" }}}

" ------------------------------------------------------------
" Gitv
" ------------------------------------------------------------
" {{{
  let g:Gitv_OpenHorizontal = 0
  let g:Gitv_WrapLines = 0
  let g:Gitv_OpenPreviewOnLaunch = 1
  nmap <leader>gv :Gitv --all<cr>
  nmap <leader>gV :Gitv! --all<cr>
  vmap <leader>gV :Gitv! --all<cr>
  cabbrev git Git
" }}}

" ------------------------------------------------------------
" Switch
" ------------------------------------------------------------
" {{{
  nnoremap - :Switch<cr>
" }}}

" ------------------------------------------------------------
" Vim airline
" ------------------------------------------------------------
" {{{
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
" }}}

" ------------------------------------------------------------
" Tab
" ------------------------------------------------------------
" {{{
  set showtabline=2
  nnoremap [Tag] <Nop>
  nmap     t [Tag]
  " Tab jump  t1 , t2, ... quick jump
  for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
  endfor
  map <silent> [Tag]c :tablast <bar> tabnew<CR>
  map <silent> [Tag]x :tabclose<CR>
  map <silent> [Tag]n :tabnext<CR>
  map <silent> [Tag]p :tabprevious<CR>
" }}}

" ------------------------------------------------------------
" Unite
" ------------------------------------------------------------
" {{{
  cabbrev unite Unite
  let g:unite_enable_start_insert=1
  let g:unite_source_history_yank_enable =1
  let g:unite_source_file_mru_limit = 200
  let g:unite_enable_ignore_case = 1
  let g:unite_enable_smart_case = 1
  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
  endif
  nnoremap <silent> <leader>ud :<C-u>Unite file_rec/async:!<CR>
  nnoremap <silent> <leader>uy :<C-u>Unite history/yank<CR>
  nnoremap <silent> <leader>ub :<C-u>Unite buffer<CR>
  nnoremap <silent> <leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  nnoremap <silent> <leader>ur :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> <leader>uu :<C-u>Unite file_mru buffer<CR>
  nnoremap <silent> <leader>g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
  nnoremap <silent> <leader>cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
  nnoremap <silent> <leader>r  :<C-u>UniteResume search-buffer<CR>
" }}}
