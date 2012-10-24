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
set textwidth=78

set hlsearch
set incsearch
set ignorecase
set smartcase

" disable beeping
set noeb vb t_vb=

set wildignore+=.git,.realsync,.idea
set wildignore+=*.png

" ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

set wildmode=list:longest,full

" where to put backup files
set backupdir=/tmp//

" where to put swap files
set directory=/tmp//

set hidden

set noesckeys

set colorcolumn=80

set cmdheight=2

au BufNewFile *.php exe "normal! i<?php"

" highlight eruby tags at twig templates
au BufNewFile,BufRead *.html.twig set ft=eruby

au FileType php,html,xml,css,javascript setlocal ts=4 sw=4 noet nolist wrap

au FileType apache setlocal ts=4 sw=4 et nolist wrap

au BufNewFile,BufRead * if &ft == '' | set ft=txt | endif
au FileType txt setlocal fo+=t

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'php'
let g:snipMate.scope_aliases['eruby'] = 'eruby-rails,html'

let NERDSpaceDelims=1
let NERDTreeQuitOnOpen=1

let g:ctrlp_working_path_mode = 0

" turn off highlighting and clear any message already displayed
nnoremap <silent> <CR> :nohlsearch<Bar>:echo<CR>

nnoremap <Space> :

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>ga :Gcommit -av<CR><C-w>_
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gr :Gread<CR>

nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>v :NERDTreeFind<CR>

nmap <F5> :GundoToggle<CR>

" switching between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <Leader>z :ZoomWin<CR>

" omni completion
imap <C-b> <C-x><C-o>

if has("autocmd")
  " remember last location in file, but not for commit messages
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" insert relational path
cmap %% <C-r>=expand('%:h').'/'<CR>

" create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" toggle case at normal mode
nmap <Leader>u mQviwU`Q
nmap <Leader>l mQviwu`Q

" toggle case at insert mode
imap <C-u> <Esc>mQviw~`Qa

" clear file
nmap ,clr :e!<CR>ggdG:w<CR>

nmap <Leader>so :so $MYVIMRC<CR>

let phpvar = '<?=\s*\(CHtml::encode(\)*$*\(\_.\{-}\)\(()\)\{0,1})\{0,1};*\s*?>'
let phpblock = '<?\s*\(\_.\{-}\)\(:\|;\)*\s*?>'

nmap <Leader>ph :%s/$PHRASES\[/t[/g<CR>
nmap <Leader>ur :%s/Url::make(/path(/g<CR>
nmap <Leader>jj /<C-r>=phpvar<CR><CR>:s//<%= \2 %>/<CR>
nmap <Leader>jk /<C-r>=phpblock<CR><CR>:s//<% \1 %>/<CR>
nmap <Leader>do :s/->/\./g<CR>

set t_Co=16
set background=light
colorscheme solarized
