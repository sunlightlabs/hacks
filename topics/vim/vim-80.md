# Highlight 80 char limit in the Vim UI

```
highlight OverLength  ctermbg=red ctermfg=white guibg=red
highlight TailSpace   ctermbg=red ctermfg=white guibg=red
highlight ColorColumn ctermbg=red ctermfg=white guibg=red
match OverLength /\%81v.\+/
match TailSpace  /\ +$/

set colorcolumn=81
```
