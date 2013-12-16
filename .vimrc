""""""""""""""""""""""""""""""""
"        my vimrc              "
"        author: @mathk        "
"                              "


"""""""""""""""""""""""
"	general       "
"                     "
syntax on

set autoindent

set number

set clipboard=unnamedplus 

" search options
set hlsearch
set smartcase

let mapleader=','

filetype on

" let g:tex_flavor = 'latex'

" setup for gvim
if has('gui_running')
	set background=dark
	colorscheme solarized
endif

"""""""""""""""""""
" leader commands "
"                 "
nnoremap <Leader>f :e .<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>sr :%s/
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>te :tab drop 
nnoremap <Leader>vs :vsplit<CR> 
nnoremap <Leader>hs :split<CR> 
nnoremap <Leader>vr :tab drop ~/.vimrc<CR>
nnoremap <Leader>ls :!ls -l<CR>

" kill search highlightling
nnoremap <Leader>cs :let @/ = ""<CR>


"""""""""""""""""""""""""""""
" navigating between splits "
"                           "
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h


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
autocmd FileType java map <F9> :w<CR>:!javac %; java `basename % .java`<CR>
autocmd FileType tex map <F8> :w<CR>:!latex %; dvipdf `basename % .tex`.dvi<CR>
autocmd FileType tex map <F9> :w<CR>:!latex -interaction=nonstopmode %; dvipdf `basename % .tex`.dvi<CR>
autocmd FileType tex map <S-F9> :w<CR>:!latex -interaction=nonstopmode %; dvipdf `basename % .tex`.dvi; evince `basename % .tex`.pdf&<CR>

"""""""""""""""""""""""""""
" autocompleting brackets "
"                         "
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
