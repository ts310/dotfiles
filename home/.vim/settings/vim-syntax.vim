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
