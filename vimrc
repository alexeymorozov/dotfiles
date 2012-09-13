runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible
syntax on
filetype plugin indent on

let mapleader = ","

set number
set ruler

set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set textwidth=72

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set wildignore+=.git,.realsync,.idea
set wildignore+=*.png

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

set wildmode=list:longest,full

set backupdir=/tmp//    " where to put backup files.
set directory=/tmp//    " where to put swap files.

set hidden

set noesckeys

set colorcolumn=80

set cmdheight=2

au BufNewFile *.php exe "normal! i<?"
au FileType php setlocal tabstop=4 shiftwidth=4 noexpandtab nolist wrap

au BufNewFile,BufRead * if &ft == '' | set ft=txt | endif
au FileType txt setlocal fo+=t

au FileType xml setlocal tabstop=2 shiftwidth=2 noexpandtab nolist wrap
au FileType apache setlocal tabstop=4 shiftwidth=4 expandtab nolist wrap

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'php,html'
let g:snipMate.scope_aliases['eruby'] = 'eruby-rails,html'

let NERDSpaceDelims=1
let NERDTreeQuitOnOpen=1

let g:ctrlp_working_path_mode = 0

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>ga :Gcommit -av<CR><C-W>_
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gr :Gread<CR>

nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>v :NERDTreeFind<CR>

nmap <F5> :GundoToggle<CR>

" Switching between windows
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

nmap <Leader>z :ZoomWin<CR>

" Omni completion
imap <C-B> <C-X><C-O>

if has("autocmd")
  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" insert relational path
cmap %% <C-R>=expand('%:h').'/'<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" upper/lower word
nmap <Leader>u mQviwU`Q
nmap <Leader>l mQviwu`Q

" toggle case at insert mode
imap <C-U> <Esc>mQviw~`Qa

nmap <Leader>so :so $MYVIMRC<CR>

set t_Co=16
set background=light
colorscheme solarized
