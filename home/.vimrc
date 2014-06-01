" vim: nowrap fdm=marker

" ------------------------------------------------------------
" Initial settings
" ------------------------------------------------------------
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ------------------------------------------------------------
"  General settings
" ------------------------------------------------------------
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set encoding=utf-8
set virtualedit+=block
set clipboard+=unnamedplus,unnamed
set tags+=.tags
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set ruler
set laststatus=2
set cmdheight=1
set lazyredraw
set cursorline

" Shortcut for edit/source vim runtime configuration in command
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC

" Automatically move to last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
endif

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=" "

" ------------------------------------------------------------
" Vundle initialization
" ------------------------------------------------------------
" This loads all the plugins specified in ~/.vim/vundle.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ------------------------------------------------------------
" Turn Off Swap Files
" ------------------------------------------------------------
set noswapfile
set nobackup
set nowb

" ------------------------------------------------------------
" Persistent undo settings
"
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" ------------------------------------------------------------
if has('persistent_undo')
  silent !mkdir ~/.vim/tmp/backups > /dev/null 2>&1
  set undodir=~/.vim/tmp/backups
  set undofile
endif

" ------------------------------------------------------------
" Indentation settings
" ------------------------------------------------------------
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ------------------------------------------------------------
" Folds settings
" ------------------------------------------------------------
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set foldlevel=99
set foldlevelstart=99

" ------------------------------------------------------------
" Completion settings
" ------------------------------------------------------------
set wildmode=list:longest
set wildchar=<Tab>
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
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

" ------------------------------------------------------------
" Scrolling settings
" ------------------------------------------------------------
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ------------------------------------------------------------
" Mouse settings
" ------------------------------------------------------------
if has('mouse')
  set mouse=a
  set guioptions+=a
  set ttymouse=xterm2
endif

" ------------------------------------------------------------
" Search settings
" ------------------------------------------------------------
set incsearch       " Find the next match as we type the search
set hlsearch        " Hilight searches by default
set viminfo='100,f1 " Save up to 100 marks, enable capital marks
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
set wrapscan
set showmatch
set gdefault
set complete+=k
set nojoinspaces
set nrformats=
set fillchars+=stl:\ ,stlnc:\

" ------------------------------------------------------------
" Custom settings
" ------------------------------------------------------------
source ~/.vim/settings.vim
