runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible
syntax on
filetype plugin indent on
set hidden

let mapleader = ","
set noesckeys

set number
set ruler
set colorcolumn=80
set cmdheight=2

set hlsearch
set incsearch
set ignorecase
set smartcase

" disable beeping
set noeb vb t_vb=

set autowriteall
au FocusLost * :wa

set noswapfile
set nobackup
set nowritebackup

set wildmode=list:longest,full

set wildignore+=.git,.realsync,.idea
set wildignore+=*.png,*.jpg,*.gif

" ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" ignore composer and symfony cache
set wildignore+=*/vendor/*,*/app/cache/*

set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set textwidth=78
set formatoptions=tcrqwn

au FileType php,yaml,html,xml,css,javascript,apache setl et ts=4 sw=4 wrap
au FileType text setl fo-=r
au FileType snippets setl fo-=c
au FileType gitconfig setl noet ts=4 sw=4

" put these in an autocmd group, so that we can delete them easily
augroup vimrcEx

  " delete all commands in this group
  au!

  " remember last location in file, but not for commit messages
  " see :help last-position-jump
  au BufReadPost *
    \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  au BufNewFile *.php exe "normal! i<?php\r\r"

augroup END

let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['php'] = 'php'
let g:snipMate.scope_aliases['eruby'] = 'eruby-rails,html'

let g:buffergator_autoexpand_on_split = 0

let NERDSpaceDelims=1

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files = 0

" turn off highlighting and clear any message already displayed
nnoremap <silent> <CR> :nohlsearch<Bar>:echo<CR>

" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

nnoremap <Space> :

" jump after parentheses
inoremap ;<CR> <End>;<CR>
inoremap ;<Esc> <End>;<Esc>
inoremap ;j <End>;<Down>
inoremap ,j <End>,<Down>
inoremap jj <C-o>o

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

" insert relational path
cmap %% <C-r>=expand('%:h').'/'<CR>

" create the directory containing the file in the buffer
nmap <silent> <Leader>md :!mkdir -p %:p:h<CR>

" toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

nmap <F12> :syntax sync fromstart<CR>

" toggle case at normal mode
nmap <Leader>u mQviwU`Q
nmap <Leader>l mQviwu`Q

" toggle case at insert mode
imap <C-u> <Esc>mQviw~`Qa

" clear file
nmap <Leader>clr :e!<CR>ggdG:w<CR>

nmap <Leader>so :so $MYVIMRC<CR>

" translate templates
let phpvar = '<?=\s*\(CHtml::encode(\)*$*\(\_.\{-}\)\(()\)\{0,1})\{0,1};*\s*?>'
let phpblock = '<?\(php\)*\s*\(\_.\{-}\)\(:\|;\)*\s*?>'
nmap <Leader>ph :%s/$PHRASES\[/t[/g<CR>
nmap <Leader>ur :%s/Url::make(/path(/g<CR>
nmap <Leader>jj /<C-r>=phpvar<CR><CR>:s//{{ \2 }}/<CR>
nmap <Leader>jk /<C-r>=phpblock<CR><CR>:s//<% \2 %>/<CR>
nmap <Leader>do :s/->/\./g<CR>

function! Namespace()
  return substitute(substitute(expand("%:h"), '\v^\w+\/(\u)', '\1', ''), '\/', '\\', 'g')
endfunction

set t_Co=16
set background=light
colorscheme solarized
