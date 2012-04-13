" Remove menu bar
set guioptions-=M
set guioptions-=m

" Remove toolbar
set guioptions-=T

" Hide all scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b

set gfn=Ubuntu\ Mono\ 14

if filereadable($HOME . "/.gvimrc.local")
	source $HOME/.gvimrc.local
end
