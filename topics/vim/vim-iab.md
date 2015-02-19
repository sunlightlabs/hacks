# vim-iab.vim

i abuse vim iab 

--timball

```vim
" 
" Insert thingies for timball...
"
  iab SNIP		--snip--snip--snip--<ESC>o--snip--snip--snip--<ESC>O

""  iab COMMENT_BLOCK /**<RETURN><ESC>xi<SPACE>***********************************************************<RETURN>***********************************************************<RETURN>**<RETURN>**<TAB>$RCSfile$<RETURN>**<TAB><TAB><TAB><TAB>--timball@tux.org<RETURN>**<RETURN>**<RETURN>**<RETURN>**<TAB>$Id$<RETURN>**<RETURN>***********************************************************<RETURN>***********************************************************<RETURN>**/<RETURN><ESC>kkkkkkkA<TAB><TAB>
"  iab COMMENT_BLOCK /**<RETURN><ESC>xi<SPACE>***********************************************************<RETURN>***********************************************************<RETURN><RETURN><TAB>$RCSfile$<RETURN><TAB><TAB><TAB><TAB>--timball@tux.org<RETURN><RETURN><RETURN><RETURN><TAB>$Id$<RETURN><RETURN>***********************************************************<RETURN>***********************************************************<RETURN>**/<RETURN><ESC>kkkkkkkA<TAB><TAB>

"  iab STDC_HEADERS #include <stdio.h><CR>#include <stdlib.h><CR>#include <unistd.h><CR>#include <sys/types.h><CR>#include <stdint.h><CR>#include <string.h><CR><CR>#ifdef SINGLE_COMPILE<CR>int main(int argc, char *argv[])<CR>{<CR><CR><CR>return 0;<CR>}<CR>#endif<CR><ESC>5ko

" this should move one back
  iab STRUCT struct{<CR><CR>};<ESC>kkwi

" File and path name stuff 
iab YPATH <C-R>=expand("%:p")<CR>
iab YFILE <C-R>=expand("%:t:r")<CR>
iab YDIR  <C-R>=expand("%:p:h")<CR>

iab DATE <C-R>=strftime("%a %b %d %T %Z %Y")<CR>

" Help delete character if it is 'empty space'
" stolen from Vim manual
function! Eatchar()
  let c = nr2char(getchar())
  return (c =~ '\s') ? '' : c
endfunction

" Replace abbreviation if we're not in comment or other unwanted places
" stolen from Luc Hermitte's excellent http://hermitte.free.fr/vim/
function! MapNoContext(key, seq)
  let syn = synIDattr(synID(line('.'),col('.')-1,1),'name')
  if syn =~? 'comment\|string\|character\|doxygen'
    return a:key
  else
    exe 'return "' .
    \ substitute( a:seq, '\\<\(.\{-}\)\\>', '"."\\<\1>"."', 'g' ) . '"'
  endif
endfunction

" Create abbreviation suitable for MapNoContext
function! Iab (ab, full)
  exe "iab <silent> <buffer> ".a:ab." <C-R>=MapNoContext('".
    \ a:ab."', '".escape (a:full.'<C-R>=Eatchar()<CR>', '<>\"').
    \"')<CR>"
endfunction

" for shell scripts
" shell
call Iab('#!s', '#!/bin/sh<CR>#<CR># <C-R>=expand("%:t")<CR><CR>#            --timball@sunlightfoundation.com<CR>#<CR># $Id$<CR>#')
" shell
call Iab('#!b', '#!/bin/bash<CR>#<CR># <C-R>=expand("%:t")<CR><CR>#            --timball@sunlightfoundation.com<CR>#<CR># $Id$<CR>#')
" python
call Iab('#!p', '#!/usr/bin/env python<CR>#<CR># <C-R>=expand("%:t")<CR><CR>#            --timball@sunlightfoundation.com<CR>#<CR># $Id$<CR>#')
" generic head comment block
call Iab('#!c', '#<CR># <C-R>=expand("%:t")<CR><CR>#            --timball@sunlightfoundation.com<CR>#<CR># $Id$<CR>#')
" generic head comment block
call Iab('#!r', '#!/usr/bin/ruby<CR>#<CR># <C-R>=expand("%:t")<CR><CR>#            --timball@sunlightfoundation.com<CR>#<CR># $Id$<CR>#')


call Iab('#d', '#define ')
call Iab('#i', '#include <><Left>')
call Iab('#I', '#include ""<Left>')

" python main line
call Iab('pym', 'import sys <CR><CR>def main(argv): <CR>blah<CR><CR><ESC>iif __name__ == "__main__":<CR>main(sys.argv[1:])<ESC>kkk^DA')


" for only C... gotta make this do this only w/ *.c files
"call Iab('printf', 'printf ("\n");<C-O>?\<CR>')
"call Iab('if', 'if ()<CR>{<CR>}<Left><C-O>?)<CR>')
"call Iab('for', 'for (;;)<CR>{<CR>}<C-O>?;;<CR>')
"call Iab('while', 'while ()<CR>{<CR>}<C-O>?)<CR>')
"call Iab('else', 'else<CR>{<CR>x;<CR>}<C-O>?x;<CR><Del><Del>')
"call Iab('ifelse', 'if ()<CR>{<CR>}<CR>else<CR>{<CR>}<C-O>?)<CR>')
"call Iab('intmain', 'int<CR>main (int argc, char **argv)<CR>'.
" \ '{<CR>x;<CR>return 0;<CR>}<CR><C-O>?x;<CR><Del><Del>')

autocmd BufEnter * nmap ,mc !!boxes -d pound-cmt<CR>
autocmd BufEnter * vmap ,mc !boxes -d pound-cmt<CR>
autocmd BufEnter * nmap ,xc !!boxes -d pound-cmt -r<CR>
autocmd BufEnter * vmap ,xc !boxes -d pound-cmt -r<CR>
autocmd BufEnter *.html nmap ,mc !!boxes -d html-cmt<CR>
autocmd BufEnter *.html vmap ,mc !boxes -d html-cmt<CR>
autocmd BufEnter *.html nmap ,xc !!boxes -d html-cmt -r<CR>
autocmd BufEnter *.html vmap ,xc !boxes -d html-cmt -r<CR>
autocmd BufEnter *.[chly],*.[pc]c nmap ,mc !!boxes -d c-cmt<CR>
autocmd BufEnter *.[chly],*.[pc]c vmap ,mc !boxes -d c-cmt<CR>
autocmd BufEnter *.[chly],*.[pc]c nmap ,xc !!boxes -d c-cmt -r<CR>
autocmd BufEnter *.[chly],*.[pc]c vmap ,xc !boxes -d c-cmt -r<CR>
autocmd BufEnter *.C,*.cpp,*.java nmap ,mc !!boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.java vmap ,mc !boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.java nmap ,xc !!boxes -d java-cmt -r<CR>
autocmd BufEnter *.C,*.cpp,*.java vmap ,xc !boxes -d java-cmt -r<CR>
autocmd BufEnter .vimrc*,.exrc nmap ,mc !!boxes -d vim-cmt<CR>
autocmd BufEnter .vimrc*,.exrc vmap ,mc !boxes -d vim-cmt<CR>
autocmd BufEnter .vimrc*,.exrc nmap ,xc !!boxes -d vim-cmt -r<CR>
autocmd BufEnter .vimrc*,.exrc vmap ,xc !boxes -d vim-cmt -r<CR>
nmap ,bf !!~/junk/boxes-dev/boxes -d tjc -s 75<CR>
vmap ,bf !~/junk/boxes-dev/boxes -d tjc -s 75<CR>

" vim: set tw=0:
```
