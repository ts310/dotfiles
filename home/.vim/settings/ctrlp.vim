"let g:loaded_ctrlp = 1 " disable ctrp plugin

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

map <Leader>p :CtrlP<CR>

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_max_height = 40
let g:ctrlp_max_files = 0 " unlimited
let g:ctrlp_working_path_mode = ''
let g:ctrlp_show_hidden = 1

" ---------------------------------------------------------------
" available extensions
"
" 'tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
" 'undo', 'line', 'changes', 'mixed', 'bookmarkdir'
" ---------------------------------------------------------------
let g:ctrlp_extensions = ['tag', 'buffertag', 'dir']
