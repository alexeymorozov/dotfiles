set nocompatible
syntax on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/PIV'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/ZoomWin'

filetype plugin indent on

let mapleader = ","

set number
set ruler

set nowrap
set tabstop=4
set shiftwidth=4
set noexpandtab

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

set backupdir=/tmp//    " where to put backup files.
set directory=/tmp//    " where to put swap files.

set hidden

set noesckeys

set colorcolumn=120

autocmd FileType php setlocal tabstop=4 shiftwidth=4 noexpandtab nolist wrap

let NERDSpaceDelims=1

let g:ctrlp_working_path_mode = 0

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>ga :Gcommit -av<CR>

nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>v :NERDTreeFind<CR>

nmap <F5> :GundoToggle<CR>

" Switching between windows
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

nmap <Leader>z :ZoomWin<CR>

if has("autocmd")
  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

" insert relational path
cmap %% <C-R>=expand('%:h').'/'<CR>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" upper/lower word
nmap <Leader>u mQviwU`Q
nmap <Leader>l mQviwu`Q

" toggle case at insert mode
imap <C-U> <Esc>mQviw~`Qa

nmap <Leader>so :so %<CR>

set t_Co=16
set background=light
colorscheme solarized
