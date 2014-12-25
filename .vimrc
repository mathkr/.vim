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

" colorscheme
set t_Co=256
colorscheme molokai
if (has("gui_running") == 0)
	let g:rehash256=1
endif

if (has("gui_running"))
        set guifont=Liberation\ Mono\ 8
        set guiheadroom=0
        set guioptions-=r " removes right scrollbar
        set guioptions-=T " removes toolbar
        set guioptions-=m " removes menubar
endif

" miscellaneous
syntax on
filetype on
filetype plugin on
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set number
set clipboard=unnamedplus
set scrolloff=2
set title

" Set the cursor highlighting
highlight Cursor guifg=white guibg=red

" highlighting comment 'tags' (copied from random stackoverflow post)
highlight Important cterm=bold ctermbg=NONE ctermfg=red gui=bold guibg=NONE guifg=red
if has("autocmd")
    autocmd Syntax * call matchadd('Important', '\W\zs\(FIXME\|IMPORTANT\|BUG\)')
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|CHANGED\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
endif

" disable backup and swap files
set nobackup
set noswapfile

" set textwidth to 120 columns. 21st century and all...
set textwidth=120

" show highlighting group(s?) of word under cursor
" (copied from: http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor)
" map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" mark trailing whitespace
highlight ExtraWhitespace cterm=bold ctermbg=cyan ctermfg=white gui=bold guibg=cyan guifg=white
match ExtraWhitespace /\s\+$/

" configure listchars
set listchars=tab:»·,eol:¶,trail:-,nbsp:-

" mark column 80
" highlight ColorColumn ctermfg=red guifg=red ctermbg=NONE guibg=NONE
" set colorcolumn=81,82,83,84,85

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

"""""""""""""""""""
" taglist options "
"                 "

let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 30
let Tlist_Enable_Fold_Column = 0
let Tlist_Display_Tag_Scope = 0

""""""""""""""""""""
" snipmate options "
"                  "

let g:snips_author="Matthis Krause"

"""""""""""""""""""""
" syntastic options "
"                   "

let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_mode_map = { 'mode': 'passive',
                               \ 'active_filetypes': [],
                               \ 'passive_filetypes': [] }

"""""""""""""""""""
" leader commands "
"                 "

" open this file in a new tab
nnoremap <Leader>vr :tab drop $MYVIMRC<CR>

" uppercase current word
inoremap <Leader>u <esc>viwUea
nnoremap <Leader>u viwUe

" build with build script
nnoremap <Leader>b :w<CR> :! ./build.sh<CR>

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

" toggle taglist
nnoremap <Leader><CR> :TlistToggle<CR>

" rebuild tags file and update taglist
nnoremap <Leader>ct :silent !ctags -R<CR>:redraw!<CR>:TlistUpdate<CR>

" ctrl-p (fuzzy file search)
let g:ctrlp_map = ''
nnoremap <Leader>t :CtrlP<CR>

" kill search highlighting
nnoremap <Leader>ks :nohlsearch<CR>

" syntastic
nnoremap <Leader>syt :SyntasticToggleMode<CR>
nnoremap <Leader>syc :SyntasticCheck<CR>
nnoremap <Leader>syr :SyntasticReset<CR>

""""""""""""""""""""""""""""
" commenting with tComment "
"	                   "

" commenting out code
nnoremap <Leader>cc :TComment<CR>
vnoremap <Leader>cc :TCommentMaybeInline<CR>

" creating block comments
nnoremap <Leader>cb :TCommentBlock<CR>
vnoremap <Leader>cb :TCommentBlock<CR>

" java/cpp/javascript
" autocmd FileType java,javascript,cpp noremap <buffer><Leader>c <esc>I// <esc>$
" autocmd FileType java,javascript,cpp vnoremap <buffer><Leader>c <esc>`>a */<esc>`<i/* <esc>

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

nnoremap <space> :m .+1<CR>==
nnoremap <S-space> :m .-2<CR>==
vnoremap <space> :m '>+1<CR>gv=gv
vnoremap <S-space> :m '<-2<CR>gv=gv

"""""""""""""""""""""""""""
" autocompleting brackets "
"                         "

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
