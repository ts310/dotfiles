" always show tabline
set showtabline=2

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]

" Tab jump
" t1 , t2, ... quick jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc newtab
map <silent> [Tag]c :tablast <bar> tabnew<CR>

" tx close current tab
map <silent> [Tag]x :tabclose<CR>

" tn move to next tab
map <silent> [Tag]n :tabnext<CR>

" tp move to previous tab
map <silent> [Tag]p :tabprevious<CR>
