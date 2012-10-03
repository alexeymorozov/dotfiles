" remove menu bar
set guioptions-=M
set guioptions-=m

" remove toolbar
set guioptions-=T

" hide all scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

" disable beeping
set vb t_vb=

if has('mac')
  set gfn=Monaco:h14
elseif has('unix')
  set gfn=Ubuntu\ Mono\ 14
endif
