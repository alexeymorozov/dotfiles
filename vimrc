set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
source ~/.vim/plugins.vim
call vundle#end()

filetype plugin indent on

syntax enable

runtime macros/matchit.vim

let mapleader = ","
set noesckeys

set number
set ruler
set colorcolumn=80

set hlsearch
set incsearch
set ignorecase
set smartcase

" disable beeping
set noeb vb t_vb=

set hidden
set autoread

set noswapfile
set nobackup
set nowritebackup

set wildmode=list:longest,full

set wildignore+=.git,.idea
set wildignore+=*.png,*.jpg,*.gif

" ignore bundles
set wildignore+=*/vendor/bundle/*
set wildignore+=*/vendor/bundler/*

" ignore node modules
set wildignore+=*/node_modules/*

set wildignore+=*/tmp/*

set smartindent

set expandtab
set tabstop=2
set shiftwidth=2
set wrap
set linebreak
set textwidth=0
set formatoptions=tcrqwn
set cmdheight=2

set langmap=№#,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\",Ё\|,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',ё\\\\,яz,чx,сc,мv,иb,тn,ьm,ю.,б\\,

" put these in an autocmd group, so that we can delete them easily
augroup vimrc

  " delete all commands in this group
  au!

  au FileType php,html,html.twig,xml,css,apache setl et ts=4 sw=4 sts=4 wrap
  au FileType yaml setl et ts=2 sw=2 sts=2 wrap
  au FileType php setl smartindent
  au FileType text setl fo-=r
  au FileType snippets setl fo-=c
  au FileType gitconfig setl noet ts=4 sw=4

  " remember last location in file, but not for commit messages
  " see :help last-position-jump
  au BufReadPost *
    \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  au BufNewFile *.php exe "normal! i<?php\r\r"

  au FocusLost * silent! wa

  au BufWritePost $MYVIMRC,vimrc source $MYVIMRC

augroup END

set tags+=.git/tags

let g:buffergator_autoexpand_on_split = 0
let g:buffergator_suppress_keymaps = 1

let NERDSpaceDelims=1

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files = 0

let g:syntastic_javascript_checkers = ['eslint']

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>ga :Gcommit -av<CR><C-w>_
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gr :Gread<CR>

vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>v :NERDTreeFind<CR>

nmap <Leader>b :BuffergatorOpen<CR>
nmap <Leader>B :BuffergatorClose<CR>

nmap <F5> :GundoToggle<CR>

nmap <Leader>z :ZoomWin<CR>

" phpunit compilation
com! -nargs=* Phpunit make -c app <q-args> | cw

nmap <Leader>t :Phpunit %<CR>

" toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <Esc>:set invpaste<CR>:set paste?<CR>

" highlight again (sometimes highlighting breaks)
nmap <F12> :syntax sync fromstart<CR>

nmap <Leader>s :wa<CR>

" open an edit command with the path of the currently edited file filled in
nmap <Leader>e :e <C-R>=expand('%:h') . '/' <CR>

" insert relational path
cmap %% <C-r>=expand('%:h').'/'<CR>

" open vimrc
nmap <Leader>, :e <C-r>=resolve($MYVIMRC)<CR><CR>

" create the directory containing the file in the buffer
nmap <silent> <Leader>md :!mkdir -p %:p:h<CR>

" clear file
nmap <Leader>clr :e!<CR>ggdG:w<CR>

" switching between windows
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

nnoremap <Space> :

" omni completion
imap <C-b> <C-x><C-o>

" toggle case at normal mode
nmap <Leader>u mQviwU`Q
nmap <Leader>l mQviwu`Q

" toggle case at insert mode
imap <C-u> <Esc>mQviw~`Qa

" format JSON
map <Leader>j !python -m json.tool<CR>

" remove all comments and blank lines
nmap <Leader>dc :%g/\v^\s*(#\|$)/d<CR>

function! Namespace()
  return substitute(substitute(expand("%:h"), '\v^\w+\/(\u)', '\1', ''), '\/', '\\', 'g')
endfunction

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

set t_Co=16
set background=light
colorscheme solarized
