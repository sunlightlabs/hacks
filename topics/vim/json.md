```
filetype on
filetype plugin on

autocmd BufRead,BufNewFile *.json set filetype=json
autocmd FileType json json-pretty
autocmd FileType json remove-trailing-spaces
autocmd FileType json 0
```
