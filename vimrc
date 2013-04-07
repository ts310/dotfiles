" vim: nowrap fdm=marker

" Initial settings {{{
  set nocompatible
  set encoding=utf-8
  let mapleader = ","
  let g:mapleader = ","
  " Shortcut for edit/source vim runtime configuration in command
  command! Ev edit $MYVIMRC
  command! Rv source $MYVIMRC
" }}}

" Load plugins {{{
  filetype off
  "runtime macros/matchit.vim
  "runtime ftplugin/man.vim
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  " Plugins {{{
    " plugin manager {{{
      Bundle 'gmarik/vundle'
    " }}}
    " unite {{{
      Bundle 'Shougo/neocomplcache'
      Bundle 'Shougo/unite.vim'
      Bundle 'Shougo/vimfiler'
      Bundle 'Shougo/vimproc'
      "Bundle 'Shougo/vimshell'
      "Bundle 'h1mesuke/unite-outline'
      "Bundle 'hrsh7th/vim-unite-vcs'
      "Bundle 'kmnk/vim-unite-svn'
      Bundle 'tsukkee/unite-tag'
      Bundle 'ujihisa/unite-colorscheme'
    " }}}
    " diff {{{
      Bundle 'AndrewRadev/linediff.vim'
    " }}}
    " syntax {{{
      Bundle 'groenewege/vim-less'
      Bundle 'kchmck/vim-coffee-script'
      Bundle 'msanders/cocoa.vim'
    " }}}
    " php {{{
      Bundle 'vim-scripts/php-doc'
      Bundle 'vim-scripts/php.vim'
      Bundle 'vim-scripts/phpcomplete.vim'
    " }}}
    " git {{{
      Bundle 'tpope/vim-fugitive'
      Bundle 'tpope/vim-git'
    " }}}
    " rails {{{
      Bundle 'tpope/vim-rails'
    " }}}
    " navigation {{{
      Bundle 'scrooloose/nerdtree'
      Bundle 'kien/ctrlp.vim'
      Bundle 'vim-scripts/taglist.vim'
    " }}}
    " search {{{
      Bundle 'mileszs/ack.vim'
    " }}}
    " editing {{{
      Bundle 'vim-scripts/ZenCoding.vim'
      Bundle 'vim-scripts/matchit.zip'
      Bundle 'tpope/vim-surround'
      Bundle 'scrooloose/nerdcommenter'
      Bundle 'vim-scripts/Align'
    " }}}
    " svn {{{
      "Bundle 'vim-scripts/vcscommand.vim'
    " }}}
    " debugging {{{
      Bundle 'joonty/vdebug'
    " }}}
    " misc {{{
      Bundle 'thinca/vim-ref'
      Bundle 'vim-scripts/Color-Sampler-Pack'
      Bundle 'vim-scripts/SQLComplete.vim'
      Bundle 'vim-scripts/SearchComplete'
      "Bundle 'vim-scripts/YankRing.vim'
      Bundle 'vim-scripts/CodeReviewer.vim'
    " }}}
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
" }}}

" Mappings {{{
  nnoremap ; :

  " Natural behavior with wordwrap on
  nnoremap j gj
  nnoremap k gk

  nmap <ESC><ESC> :nohlsearch<CR><ESC>
  map <leader><space> :nohlsearch<CR>

  nmap <silent> <Leader>ww :w!<CR>

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
  set cursorline
  if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
  endif
  colorscheme molokai
  "hi statusline cterm=none ctermfg=white ctermbg=darkgreen gui=none guifg=white guibg=darkgreen
  "au InsertEnter * hi statusline ctermbg=darkred guibg=darkred
  "au InsertLeave * hi statusline ctermbg=darkgreen guibg=darkgreen
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
    nnoremap <silent> <leader>y :TlistToggle<CR>
    nnoremap <silent> <F3> :TlistToggle<CR>
  " }}}
  
  " easytags {{{
    "let g:easytags_dynamic_files = 1
    "let g:easytags_always_enabled = 0
  " }}}

  " Tagbar {{{
    "let g:tagbar_width = 27
    "let g:tagbar_left = 0
    "let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
    "let g:tagbar_compact = 1
    "let g:tagbar_expand = 1
    "nnoremap <silent> <F3> :TagbarToggle<CR>
    "nnoremap <silent> <Leader>y :TagbarToggle<CR>
  " }}}

  " phpctags {{{
    "let g:tagbar_phpctags_bin = '/usr/local/src/phpctags/phpctags'
  " }}}

  " Ack {{{
    map <leader>aa :Ack<space>
  " }}}

  " Fugitive {{{
    command! Gd :Gdiff
    command! Gc :Gcommit
    command! Gw :Gwrite
    command! Gs :Gstatus
  " }}}

  " Neocomplcache {{{
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_underbar_completion = 1
  " }}}

  " Zen coding {{{
    let g:user_zen_leader_key = '<c-e>'
    let g:use_zen_complete_tag = 1
  " }}}

  " Unite {{{
    let g:unite_enable_start_insert=1
    let g:unite_source_file_mru_filename_format=''
    let g:unite_source_file_mru_limit=50
    let g:unite_split_rule = "botright"
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
    " For ack.
    if executable('ack-grep')
      let g:unite_source_grep_command = 'ack-grep'
      let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
      let g:unite_source_grep_recursive_opt = ''
    endif
    autocmd FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()
      " 単語単位からパス単位で削除するように変更
      imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
      " ESCキーを2回押すと終了する
      nmap <silent><buffer> <ESC><ESC> q
      imap <silent><buffer> <ESC><ESC> <ESC>q
    endfunction
  " }}}

  " CommantT {{{
    "let g:CommandTMaxFiles = 55000
    "let g:CommandTMaxDepth = 40
    "let g:CommandTMaxHeight = 30
    "let g:CommandTMatchWindowAtTop = 0
    "let g:CommandTMatchWindowReverse = 0
    "nnoremap <silent> <Leader>ff :CommandT<CR>
    "nnoremap <silent> <Leader>bb :CommandTBuffer<CR>
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
    " 'tag', 'buffertag', 'quickfix', 'dir', 'rtscript', 'undo', 'line', 'changes', 'mixed', 'bookmarkdir'
  " }}}

  " YankRing {{{
    "let g:yankring_max_history = 400
    "let g:yankring_window_use_separate = 1
    "let g:yankring_history_dir = '~/.vim/tmp/'
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
    "autocmd BufEnter *
    "\   if empty(&buftype)
    "\|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
    "\|  endif
  " }}}
    
  " Powerline {{{
    "set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
    "let g:Powerline_symbols = 'fancy'
    "set t_Co=256
  " }}}

  " vdebug {{{
    let g:vdebug_options = {
      \ 'path_maps': {"/home/buyma/apps/trunk": "/Volumes/buyma_vbox/trunk"},
      \ 'server': '192.168.56.101'
    \}
  " }}}
  "
  " CodeReviewer {{{
    let g:CodeReviewer_reviewer = "saito"
    let g:CodeReviewer_reviewFile = "./Dropbox/vim/review.rev"
  " }}}

  " vimfiler {{{
    nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
    autocmd! FileType vimfiler call g:my_vimfiler_settings()
    function! g:my_vimfiler_settings()
      nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
      nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
      nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
    endfunction

    let s:my_action = { 'is_selectable' : 1 }
    function! s:my_action.func(candidates)
      wincmd p
      exec 'split '. a:candidates[0].action__path
    endfunction
    call unite#custom_action('file', 'my_split', s:my_action)

    let s:my_action = { 'is_selectable' : 1 }
    function! s:my_action.func(candidates)
      wincmd p
      exec 'vsplit '. a:candidates[0].action__path
    endfunction
    call unite#custom_action('file', 'my_vsplit', s:my_action)
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
