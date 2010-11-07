" ------------------------------------------
" Vim configuration
" ------------------------------------------

" Folding cheet sheet

" zR    open all folds
" zM    close all folds
" za    toggle fold at cursor position
" zj    move down to start of next fold
" zk    move up to end of previous fold


" Manage plugins.

runtime macros/matchit.vim
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
let g:GetLatestVimScripts_allowautoinstall=1


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.

set nocompatible

filetype off
filetype plugin indent on

" Security
set modelines=0

" Tabs/spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Basic options
set encoding=utf-8
set scrolloff=7
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cmdheight=2
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set number
"set numberwidth=5
set laststatus=2
set visualbell

"function TSCheckVersion()
    "echo version
"endfunction

if version >= 703 
    "set relativenumber
    set colorcolumn=85
endif

" Backups
set nobackup
set noswapfile

set history=1000

" Leader
let mapleader = ","

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
map <leader><space> :noh<CR>
runtime macros/matchit.vim
nmap <tab> %
vmap <tab> %

" Soft/hard wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
"set formatoptions=cqt

" Use the same symbols as TextMate for tabstops and EOLs
"set list
set listchars=tab:▸\ ,eol:¬

" Save on losing focus
"au focuslost * :wa

" Replace : with ;
nnoremap ; :

" Force vim style navigation
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Natural behavior with wordwrap on
nnoremap j gj
nnoremap k gk

" Strip all trading whitespace in current while
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" HTML fold tag
nnoremap <leader>f Vatzf

" Sort css properties alphabetically
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Edit ~/.vimrc file
"nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>

" Source ~/.vimrc
"nnoremap <leader>sv :source $MYVIMRC<CR>
"nnoremap <leader>svg :source $MYGVIMRC<CR>

" Source the vimrc after saving it
"au bufwritepost .vimrc source $MYVIMRC

" New vertical split window and gain foucus
"nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>v :vsp<CR><C-w>l
nnoremap <leader>h :split<CR><C-w>j

" Easy buffer navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Cycle window
nnoremap <C-tab> <C-w><C-w>

" Maximize current window
"map <F5> <C-W>_<C-W><Bar>

" Enable osx style indent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Quick save
nmap <leader>s :w<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>i :set list!<CR>

" Shortcut to buffers
"nnoremap <leader>b :buffers<CR>:buffer<Space>

" Xcode header to implementation shortcut
vmap <D-A-Up> :e %:p:s,.h$,.X123X,:s,.m$,.h,:s,.X123X$,.m,<CR>

" Forgot sudo
cmap w!! w !sudo tee % >/dev/null

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

" Close all the buffers
"map <leader>X :1,300 bd!<CR>

" Use the arrows to switch buffers
map <D-A-right> :bn<CR>
map <D-A-left> :bp<CR>

" Tab configuration
"map <leader>tt :tabnew<CR>
"map <leader>te :tabedit
"map <leader>tc :tabclose<CR>
"map <leader>to :tabonly<CR>
"map <leader>tn :tabnext<CR>
"map <leader>tp :tabprevious<CR>
"map <leader>tf :tabfirst<CR>
"map <leader>tl :tablast<CR>
"map <leader>tm :tabmove

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Enable syntax
syntax on

" Color scheme (terminal)
"set background=light
"colorscheme pyte
"colorscheme derek
"colorscheme wombat
"colorscheme vividchalk

" Syntax of these languages is fussy over tabs Vs spaces
au FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Customisations based on house-style (arbitrary)
au FileType html setlocal ts=2 sts=2 sw=2 expandtab
au FileType css setlocal ts=2 sts=2 sw=2 expandtab
au FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

" Treat .rss files as XML
au BufNewFile,BufRead *.rss setfiletype xml

" Style for each languages
au FileType sh setlocal ts=2 sts=2 sw=2 expandtab

" Automatic fold settings for specific files. Uncomment to use.
au FileType ruby setlocal foldmethod=syntax
"au FileType html setlocal foldmethod=indent shiftwidth=4 tabstop=4 expandtab
au FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
au FileType php  setlocal foldmethod=syntax shiftwidth=4 tabstop=4 expandtab

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
au BufNewFile,BufRead *_spec.rb compiler rspec

" Actionscript
au BufNewFile,BufRead *.as set filetype=actionscript
au FileType actionscript setlocal ts=2 sts=2 sw=2 expandtab
"au Syntax actionscript source $MYVIMRC/syntax/actionscript.vim

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

" Open url with browser
function! Browser()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No URI found in line."
  endif
endfunction

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

" HTML tag closing
inoremap <C-.> <Space><BS><Esc>:call InsertCloseTag()<CR>

" Faster Esc
"inoremap <Esc> <nop>
inoremap jj <ESC>

" Sort CSS
map <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Clean whitespace
map <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Formatting, TextMate-style
map <leader>Q gqip

" Make shortcut
"nmap <leader>m :make<CR>

" Show only line number in active window
"au WinEnter * setlocal number
"au WinLeave * setlocal nonumber

" Disable help key
map <F1> <nop>

" ------------------------------------------------------------
"  Plugins
" ------------------------------------------------------------
" NERDTree
" Toggle nerdtree window
map <leader>n :NERDTreeToggle<CR>
map <F1> :NERDTreeToggle<CR>
map <F2> :NERDTreeFind<CR>
let NERDTreeWinSize = 30

" NERDCommenter
" I turn this off to make it simple
"let NERDCreateDefaultMappings=0 
map <D-/> :call NERDComment(0, "toggle")<CR> 

" TlistTag
" Exuberant ctags!
map <leader>5 :TlistToggle<CR>
"nmap <leader>m :TlistToggle<CR>
"let Tlist_Ctags_Cmd = /usr/local/bin/ctags
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Close_On_Select = 1
"let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Compact_Format = 1
let Tlist_WinWidth = 30
let Tlist_Enable_Fold_Column = 0

" Ack
map <leader>a :Ack

" Fuzzy finder
nnoremap <leader>1 :FufBuffer<CR>
nnoremap <leader>l :FufBuffer<CR>
nnoremap <leader>2 :FufFile<CR>

" Yankring
nnoremap <silent> <F3> :YRShow<CR>
nnoremap <silent> <leader>y :YRShow<CR>
let g:yankring_history_dir='$HOME/.vim/tmp/'

" Fugitive
" git diff
nmap <leader>d :Gdiff<CR>

" Rainbows!
nmap <leader>R :RainbowParenthesesToggle<CR>

" Command-T options
let g:CommandTMaxHeight=30
"let g:CommandTMatchWindowAtTop=1
nmap <silent> <leader>t :CommandT<CR>

" Buffer explorer plugin
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<CR>

" sparkup plugin
let g:sparkupExecuteMapping = '<D-e>'
let g:sparkupNextMapping = '<D-n>'

" requires NERDCommenter plugin
vmap <D-/> ,c<space>gv
map <D-/> ,c<space>

" Move current line down/up
map <C-Down> ddp
map <C-Up> dd<Up>P

" Move visually selected lines down/up
vmap <C-Down> xp`[V`]
vmap <C-Up> x<Up>P`[V`]

" Move visual selection back/forwards
vmap <C-Left> x<BS>P`[v`]
vmap <C-Right> x<Space>P`[v`]
