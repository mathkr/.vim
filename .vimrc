""""""""""""""""""""""""""""""""
"        my vimrc              "
"        author: @mathk        "
"                              "

""""""""""""""""""
"    pathogen    "
"                "

execute pathogen#infect()

" configure sessions to play nice with pathogen
set sessionoptions-=options

"""""""""""""""""""""""
"       general       "
"                     "

" miscellaneous
syntax on
filetype on
set autoindent
set number
set clipboard=unnamedplus
set scrolloff=2

" mark trailing whitespace
highlight ExtraWhitespace cterm=bold ctermbg=cyan ctermfg=white gui=bold guibg=cyan guifg=white
match ExtraWhitespace /\s\+$/

" search options
set hlsearch
set ignorecase
set smartcase

" remap leader key
let mapleader=','
noremap \ ,

" center on search results
noremap n nzz
noremap N Nzz

"""""""""""""""""
" abbreviations "
"               "

" java abbreviations
:iabbrev sysout System.out.println
:iabbrev mainfunc public static void main(String[] args)

"""""""""""""""""""
" leader commands "
"                 "

" open this file in a new tab
nnoremap <Leader>vr :tab drop $MYVIMRC<CR>

" uppercase current word
inoremap <Leader>u <esc>viwUea
nnoremap <Leader>u viwUe

" save
nnoremap <Leader>w :w<CR>

" search and replace
nnoremap <Leader>sr :%s/
vnoremap <Leader>sr :s/

" splits
nnoremap <Leader>vs :vsplit<CR>
nnoremap <Leader>hs :split<CR>

" open selection in firefox
vnoremap <Leader>ff y<esc>:!firefox <C-R>0<CR><CR>

" rebuild tags file
nnoremap <Leader>ct :!ctags -R .<CR><CR>

" ctrl-p (fuzzy file search)
let g:ctrlp_map = ''
nnoremap <Leader>t :CtrlP<CR>

" kill search highlighting
nnoremap <Leader>ks :let @/ = ""<CR>

""""""""""""""""""""""""""""
" commenting with tComment "
"	                   "
 
" commenting out code
nnoremap <Leader>cc :TCommentMaybeInline<CR>
vnoremap <Leader>cc :TCommentMaybeInline<CR>

" creating block comments
nnoremap <Leader>cb :TCommentBlock<CR>
vnoremap <Leader>cb :TCommentBlock<CR>

" java/cpp/javascript
" autocmd FileType java,javascript,cpp noremap <buffer><Leader>c <esc>I// <esc>$
" autocmd FileType java,javascript,cpp vnoremap <buffer><Leader>c <esc>`>a */<esc>`<i/* <esc>

" html
" autocmd FileType html noremap <buffer><Leader>c <esc>I<!-- <esc>A --><esc>
" autocmd FileType html vnoremap <buffer><Leader>c <esc>`>a --><esc>`<i<!-- <esc>

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

"""""""""""""""""""""""""""
" autocompleting brackets "
"                         "

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
