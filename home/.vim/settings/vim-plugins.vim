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
