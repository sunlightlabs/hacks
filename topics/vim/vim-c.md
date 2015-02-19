# C things for vim
sometimes helpful c stuff 
 --timball

```vim
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

" The alphabet and other lists of letters 
ab Yalpha abcdefghijklmnopqrstuvwxyz
ab YALPHA ABCDEFGHIJKLMNOPQRSTUVWXYZ 
ab Ydigit 1234567890 
ab Yruler 12345678901234567890123456789012345678901234567890123456789012345678901234567890

" Dates 
iab YISODATE =strftime("%Y-%M-%d") 
iab YDATE   =strftime("%a %d %b %T %Z %Y") 
iab YFDATE  =strftime("%a %b %d %T %Y") 
iab YTIME   =strftime("%d %b %Y %T") 
iab YDate   =strftime("%d %b %Y") 
iab Ydate   =strftime("%b %d") 
iab YTime   =strftime("%H:%M:%S") 
iab Ytime   =strftime("%H:%M") 
```
