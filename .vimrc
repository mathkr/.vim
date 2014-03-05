""""""""""""""""""""""""""""""""
"        my vimrc              "
"        author: @mathk        "
"                              "

"""""""""""""""""""""""
"	general       "
"                     "
syntax on

filetype on

set autoindent

filetype indent on

set autoread

set number

set clipboard=unnamedplus 

" search options
set hlsearch
set ignorecase
set smartcase

let mapleader=','

" let g:tex_flavor = 'latex'

" setup for gvim
if has('gui_running')
	set background=dark
	colorscheme solarized
endif

"""""""""""""""""
" abbreviations "
"               "

" java abbreviations
:iabbrev sysout System.out.println(
:iabbrev mainfunc public static void main(String[] args){<cr>

"""""""""""""""""""
" leader commands "
"                 "
inoremap <Leader>u <esc>viwUea
nnoremap <Leader>u viwUe

nnoremap <Leader>w :w<CR>
nnoremap <Leader>sr :%s/
nnoremap <Leader>vs :vsplit<CR> 
nnoremap <Leader>hs :split<CR> 
nnoremap <Leader>vr :tab drop $MYVIMRC<CR>
nnoremap <Leader>svr :source $MYVIMRC<CR>:echo "- sourced your .vimrc -"<CR>

" command-t
nnoremap <Leader>rf :CommandTFlush<CR>

" kill search highlightling
nnoremap <Leader>ks :let @/ = ""<CR>

"
" commenting
"

" java/c++/javascript
autocmd FileType java noremap <buffer><Leader>c <esc>I// <esc>$
autocmd FileType java vnoremap <buffer><Leader>c <esc>`>a */<esc>`<i/* <esc>
autocmd FileType javascript noremap <buffer><Leader>c <esc>I// <esc>$
autocmd FileType javascript vnoremap <buffer><Leader>c <esc>`>a */<esc>`<i/* <esc>
autocmd FileType c++ noremap <buffer><Leader>c <esc>I// <esc>$
autocmd FileType c++ vnoremap <buffer><Leader>c <esc>`>a */<esc>`<i/* <esc>

" html
autocmd FileType html noremap <buffer><Leader>c <esc>I<!-- <esc>A --><esc>
autocmd FileType html vnoremap <buffer><Leader>c <esc>`>a --><esc>`<i<!-- <esc>

"""""""""""""""""""""""""""""
" navigating between splits "
"                           "
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"""""""""""""""""""""""
" moving lines/blocks "
"                     "
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

""""""""""""""""""""""""""""
" compiling and/or running "
"                          "
autocmd FileType java noremap <buffer> <F9> :w<CR>:!javac %; java `basename % .java`<CR>
autocmd FileType tex noremap <buffer> <F8> :w<CR>:!latex %; dvipdf `basename % .tex`.dvi<CR>
autocmd FileType tex noremap <buffer> <F9> :w<CR>:!latex -interaction=nonstopmode %; dvipdf `basename % .tex`.dvi<CR>
autocmd FileType tex noremap <buffer> <S-F9> :w<CR>:!latex -interaction=nonstopmode %; dvipdf `basename % .tex`.dvi; evince `basename % .tex`.pdf&<CR>

"""""""""""""""""""""""""""
" autocompleting brackets "
"                         "
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
