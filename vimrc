"-------------------------------------------------------------------------------
" Vim cheatsheet
" Folding cheet sheet
"-------------------------------------------------------------------------------
" zR    open all folds
" zM    close all folds
" za    toggle fold at cursor position
" zj    move down to start of next fold
" zk    move up to end of previous fold

"-------------------------------------------------------------------------------
" Basic configuration
"-------------------------------------------------------------------------------
set nocompatible                 " Not compatible with vi
set encoding=utf-8
set scrolloff=5
set showmode                     " Show current mode 'Insert',  'Visual' etc
set showcmd                      " Show (partial) command in the last line of the screen
set hidden                       " Enable buffers
set browsedir=buffer
set backspace=indent,eol,start
set modelines=0                  " No modeline

" Do not make beep sound
set visualbell
set vb t_vb=

" Backups
set nobackup
set noswapfile

" Soft/hard wrapping
set wrap
" set textwidth=79
" set formatoptions=qrn1
" set formatoptions=cqt

" Replace : with ;
nnoremap ; :

" Replace mapleader key
let mapleader=","

"-------------------------------------------------------------------------------
" Mouse
"-------------------------------------------------------------------------------
set mouse=a
set guioptions+=a
set ttymouse=xterm2

"-------------------------------------------------------------------------------
" Bundles
"-------------------------------------------------------------------------------
set nocompatible
filetype off                 

set rtp+=~/.vim/vundle.git/  
call vundle#rc()             

Bundle 'unite.vim'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'ctags.vim'
Bundle 'ack.vim'
Bundle 'neocomplcache'
Bundle 'YankRing.vim'
Bundle 'vim-diff'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'SuperTab'

filetype plugin indent on

"-------------------------------------------------------------------------------
" Navigation / Movement
"-------------------------------------------------------------------------------
" Force vim style navigation
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" Natural behavior with wordwrap on
nnoremap j gj
nnoremap k gk

" insert mode
imap  <C-e> <END>
imap  <C-a> <HOME>

" Enable vim navigation in insert mode
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" Automatically move to last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
endif

" Move last edit position
nnoremap gb '[
nnoremap gp ']

" Move between matching bracket
nnoremap [ %
nnoremap ] %
nmap <tab> %
vmap <tab> %

" Select last edit text object
nnoremap gc  `[v`]
vnoremap gc ;<C-u>normal gc<Enter>
onoremap gc ;<C-u>normal gc<Enter>

" Yank under cursor
nnoremap vy vawy

set virtualedit+=block

"-------------------------------------------------------------------------------
" Windows Buffers
"-------------------------------------------------------------------------------
" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Cycle window with ctrl tab
nnoremap <C-tab> <C-w><C-w>

" New vertical or horizontal split window and gain foucus
nnoremap <leader>v :vsp<CR><C-w>l
nnoremap <leader>h :split<CR><C-w>j

" Use the arrows to switch buffers
map <D-A-right> :bn<CR>
map <D-A-left> :bp<CR>

" Close the current buffer
map <leader>q :Bclose<CR>

command! Bclose call <SID>BufcloseCloseIt()

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

"-------------------------------------------------------------------------------
" Tabs
"-------------------------------------------------------------------------------
" nnoremap <C-t> <Nop>
" nnoremap <C-t>n ;<C-u>tabnew<CR>
" nnoremap <C-t>c ;<C-u>tabclose<CR>
" nnoremap <C-t>o ;<C-u>tabonly<CR>
" nnoremap <C-t>j ;<C-u>execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
" nnoremap <C-t>k gT

"-------------------------------------------------------------------------------
" Appearance
"-------------------------------------------------------------------------------
set showmatch
set number
set display=uhex
if version >= 703
  " set relativenumber
  set colorcolumn=85
endif

" :set lazyredraw
set ttyfast

hi ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

set cursorline
augroup cch
  au! cch
  au WinLeave * set nocursorline
  au WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
hi CursorLine ctermbg=black guibg=black

" Enable auto fullscreen
if has("gui_running")
  " set fuoptions=maxvert,maxhorz
  " au GUIEnter * set fullscreen
endif

"-------------------------------------------------------------------------------
" Invisible characters
"-------------------------------------------------------------------------------
" Show invisible characters
set list

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"-------------------------------------------------------------------------------
" StatusLine
"-------------------------------------------------------------------------------
set laststatus=2
set ruler

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

"if winwidth(0) >= 120
"set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
"else
"set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
"endif

augroup InsertHook
  autocmd!
  autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
  autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction

" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc

" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

"-------------------------------------------------------------------------------
" Clip borad management
"-------------------------------------------------------------------------------
" Use os's clipboard
set clipboard+=unnamed

" imap <C-K> <ESC>"*pa

"-------------------------------------------------------------------------------
" Indentation
"-------------------------------------------------------------------------------
set autoindent
" set paste
set smartindent
set cindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Enable osx style indent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

if has("autocmd")
  " au FileType php filetype indent off
  au FileType html :set indentexpr=
  au FileType xhtml :set indentexpr=

  au FileType make         setlocal ts=8 sts=8 sw=8 noto
  au FileType yaml         setlocal ts=2 sts=2 sw=2 et
  au FileType php          setlocal ts=4 sts=4 sw=4 et foldmethod=syntax
  au FileType vim          setlocal ts=2 sts=2 sw=2 et
  au FileType html         setlocal ts=2 sts=2 sw=2 et
  au FileType css          setlocal ts=2 sts=2 sw=2 et foldmethod=indent
  au FileType javascript   setlocal ts=2 sts=2 sw=2 et
  au FileType sh           setlocal ts=2 sts=2 sw=2 et
  au FileType actionscript setlocal ts=2 sts=2 sw=2 et
  " au FileType ruby         setlocal foldmethod=syntax

  au BufNewFile,BufRead *.rss setfiletype xml
  au BufNewFile,BufRead *.thtml setfiletype php

  " For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
  au BufNewFile,BufRead *_spec.rb compiler rspec

  au BufNewFile,BufRead *.as set filetype=actionscript
  " au Syntax actionscript source $MYVIMRC/syntax/actionscript.vim
endif

"-------------------------------------------------------------------------------
" Complete / History
"-------------------------------------------------------------------------------
set wildmenu
set wildchar=<Tab>
set wildmode=list:full
set history=1000
set complete+=k
set cmdheight=2
set laststatus=2

"-------------------------------------------------------------------------------
" Tags
"-------------------------------------------------------------------------------
" set tags
if has("autochdir")
  set autochdir
  set tags=tags;
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif

nnoremap t <Nop>
nnoremap tt <C-]>
nnoremap tj ;<C-u>tag<CR>
nnoremap tk ;<C-u>pop<CR>
nnoremap tl ;<C-u>tags<CR>

"-------------------------------------------------------------------------------
" Search
"-------------------------------------------------------------------------------
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set gdefault
nmap <ESC><ESC> ;nohlsearch<CR><ESC>
map <leader><space> :noh<CR>
nnoremap / /\v
vnoremap / /\v

vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap /r "xy;%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>

nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" Open help for the word under the cursor
nnoremap <C-i> :<C-u>help<Space><C-r><C-w><Enter>

" :Gb <args> GrepBuffer
command! -nargs=1 Gb :GrepBuffer <args>

" GrepBuffer under cursor
nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>

" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

"-------------------------------------------------------------------------------
" Colors
"-------------------------------------------------------------------------------
" Terminal colors
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "xterm-256color"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Color scheme (terminal)
" set background=light
" colorscheme! molokai

" Popup menu color
"hi Pmenu guibg=#666666
"hi PmenuSel guibg=#8cd0d3 guifg=#666666
"hi PmenuSbar guibg=#333333

syntax enable

"hi Pmenu ctermbg=white ctermfg=darkgray
"hi PmenuSel ctermbg=blue ctermfg=white
"hi PmenuSbar ctermbg=0 ctermfg=9

"-------------------------------------------------------------------------------
" Editing
"-------------------------------------------------------------------------------
" Add word to register under cursor
nmap ye ;let @"=expand("<cword>")<CR>

" Visual mode p replace with register
vnoremap p <Esc>;let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Use whitespace for tab
set expandtab

" After comma add space automatically
" inoremap , ,<Space>

" Automatically insert closing tag for XML
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

" Enable word/line deletion undo in insert mode
inoremap <C-u>  <C-g>u<C-u>
inoremap <C-w>  <C-g>u<C-w>

" :Pt change indent mode
command! Pt :set paste!

" y9 yank till end of the line
nmap y9 y$
" y0 yank till begginig of the line
nmap y0 y^

" Auto close brackets stays inside the brackets
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

if has("autocmd")
  " Auto remove line end white space upon save
  " au BufWritePre * :%s/\s\+$//ge

  " Replace tab with whitespace upon save
  " au BufWritePre * :%s/\t/  /ge
endif

" Insert dates
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" Turn off IME apart from Insert mode
" set noimdisable
" set iminsert=0 imsearch=0
" set noimcmdline
" inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
set imdisable " Disable IM

"-------------------------------------------------------------------------------
" Folding
"-------------------------------------------------------------------------------
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

" Map this function to Space key.
noremap <space> :call ToggleFold()<CR>

"-------------------------------------------------------------------------------
" Misc stuff
"-------------------------------------------------------------------------------
" Faster Esc
"inoremap <Esc> <nop>
inoremap jj <ESC>

" Strip all trading whitespace in current while
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" HTML fold tag
nnoremap <leader>f Vatzf

" Sort css properties alphabetically
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>i :set list!<CR>

" Formatting, TextMate-style
map <leader>Q gqip

" Make shortcut
"nmap <leader>m :make<CR>

" Save on losing focus
"au focuslost * :wa

" Disable help key
map <F1> <nop>

" Move current line down/up
map <C-Down> ddp
map <C-Up> dd<Up>P

" Move visually selected lines down/up
vmap <C-Down> xp`[V`]
vmap <C-Up> x<Up>P`[V`]

" Move visual selection back/forwards
vmap <C-Left> x<BS>P`[v`]
vmap <C-Right> x<Space>P`[v`]

" Shortcut to buffers
" nnoremap <leader>b :buffers<CR>:buffer<Space>

" Xcode header to implementation shortcut
vmap <D-A-Up> :e %:p:s,.h$,.X123X,:s,.m$,.h,:s,.X123X$,.m,<CR>

" Forgot sudo
cmap w!! w !sudo tee % >/dev/null

" Shortcut for edit/source vim runtime configuration in command
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------

"-------------------------------------------------------------------------------
" NerdTree
"-------------------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>
map <F1> :NERDTreeToggle<CR>
" map <F2> :NERDTreeFind<CR>
" let NERDTreeWinSize = 30
let NERDTreeQuitOnOpen = 1

"-------------------------------------------------------------------------------
" TagList
"-------------------------------------------------------------------------------
map <leader>5 :TlistToggle<CR>
map <F2> :TlistToggle<CR>

"-------------------------------------------------------------------------------
" NERDCommenter
"-------------------------------------------------------------------------------
" I turn this off to make it simple
" let NERDCreateDefaultMappings=0
let NERDSpaceDelims = 1
let NERDShutUp=1
map <Leader>x, c<space>

" Enable textmate style comment toggle
map <D-/> :call NERDComment(0, "toggle")<CR>

"-------------------------------------------------------------------------------
" Ack
"-------------------------------------------------------------------------------
map <leader>a :Ack<space>

"-------------------------------------------------------------------------------
" Yankring
"-------------------------------------------------------------------------------
nnoremap <silent> <leader>y :YRShow<CR>
let g:yankring_max_element_length = 4194304 " 4M
let g:yankring_history_dir='$HOME/.vim/tmp/'

"-------------------------------------------------------------------------------
" Fugitive
"-------------------------------------------------------------------------------
" nmap <Space>gd :Gdiff<CR>
" nmap <Space>gc :Gcommit<CR>
" nmap <Space>gw :Gwrite<CR>
" nmap <Space>gs :Gstatus<CR>
command! Gd :Gdiff
command! Gc :Gcommit
command! Gw :Gwrite
command! Gs :Gstatus

"-------------------------------------------------------------------------------
" Rainbows!
"-------------------------------------------------------------------------------
nmap <leader>R :RainbowParenthesesToggle<CR>

"-------------------------------------------------------------------------------
" Command-T options
"-------------------------------------------------------------------------------
" let g:CommandTMaxHeight=30
nmap <silent> <leader>1 :CommandT<CR>

"-------------------------------------------------------------------------------
" sparkup plugin
"-------------------------------------------------------------------------------
let g:sparkupExecuteMapping = '<D-e>'
let g:sparkupNextMapping = '<D-n>'

"-------------------------------------------------------------------------------
" Zen coding
"-------------------------------------------------------------------------------
let g:user_zen_leader_key = '<c-e>'
let g:use_zen_complete_tag = 1

"-------------------------------------------------------------------------------
" Unite
"-------------------------------------------------------------------------------
" 入力モードで開始する
" let g:unite_enable_start_insert=1
nnoremap <leader>o :Unite buffer<CR>
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

"-------------------------------------------------------------------------------
" Load local vimrc
"-------------------------------------------------------------------------------
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
