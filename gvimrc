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

" change cursor color when language mappings are used
highlight lCursor guifg=NONE guibg=DarkGreen

if has('mac')
  set gfn=DejaVu\ Sans\ Mono:h18
elseif has('unix')
  set gfn=Ubuntu\ Mono\ 18
endif
