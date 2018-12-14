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

" set include path for autocomplete
" mac osx
set path+=/Users/mathk/code/clibs/
" linux
set path+=/home/mathk/code/clibs/

:let pi = 3.14159265359
:let e  = 2.71828182846

let g:solarized_italic=0

if (has("gui_running") == 0)
    set t_Co=256
    let g:rehash256=1
    colorscheme molokai
    set background=dark
else
    " colorscheme solarized
    colorscheme molokai

    set background=dark

    " set guifont=Noto\ Mono\ Regular\ 10
    " set guifont=Bitstream\ Vera\ Sans\ Mono\ Roman\ 9
    " set guifont=Liberation\ Mono\ 8
    " set guifont=Droid\ Sans\ Mono\ Regular\ 9
    " set guifont=Inconsolata\ Regular\ 9
    set guifont=DejaVu\ Sans\ Mono\ Regular\ 9
    " set guifont=Terminus\ Regular\ 8
    " set guifont=Ubuntu\ Mono\ Regular\ 10
    " set guifont=Andale\ Mono:h11
    " set guifont=ProFont\ 10

    set guiheadroom=0

    set guioptions-=r " removes right scrollbar
    set guioptions-=L " removes right scrollbar
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
set nosmartindent
set number
" set clipboard=unnamedplus
set scrolloff=2
set title

set cino+=(0

" !!slowness:
set cursorline
set cursorcolumn
" set relativenumber
set lazyredraw
" set synmaxcol=128

set wildmenu
set textwidth=100
set splitright
set nohidden
set nowrap
set noerrorbells visualbell t_vb=

set spelllang=en_us

set nobackup
set nowritebackup
set noswapfile
set noundofile

function! PrivacyMode()
    " privacy and security
    set viminfo="NONE"
    set noshelltemp
    set history=0
endfunction

command! Privacy :call PrivacyMode()

" configure listchars
set listchars=tab:»·,eol:¶,trail:-,nbsp:-

" search options
set hlsearch
set ignorecase
set tagcase=match
set smartcase
set incsearch

" remap leader key
let mapleader=','
noremap \ ,

" disabling manpage lookup shortcut which constantly annoys me
" and adding split line functionality similar to <S-j>
noremap <S-k> <NOP>
nnoremap <S-k> i<CR><ESC>

" tags stuff
noremap <C-]> g<C-]>
set notagstack

" set makeprg=make\ -j
set makeprg=./build.sh

" navigating quickfix errors
noremap <C-n> :cn<CR>
noremap <C-p> :cp<CR>

" create scratch buffer
function! OpenScratchBuffer()
    :vert new scratch
    :setlocal buftype=nofile
    :setlocal bufhidden=hide
    :setlocal noswapfile
endfunction

command! Scratch :call OpenScratchBuffer()

let g:fuf_file_cache_dir = ''

function! ReplaceCTypeNames()
    set hidden

    argdo %s/\([({;, ]\|^\)uint8_t\([ )]\|$\)/\1u8\2/gIe
    argdo %s/\([({;, ]\|^\)uint16_t\([ )]\|$\)/\1u16\2/gIe
    argdo %s/\([({;, ]\|^\)uint32_t\([ )]\|$\)/\1u32\2/gIe
    argdo %s/\([({;, ]\|^\)uint64_t\([ )]\|$\)/\1u64\2/gIe

    argdo %s/\([({;, ]\|^\)int8_t\([ )]\|$\)/\1i8\2/gIe
    argdo %s/\([({;, ]\|^\)int16_t\([ )]\|$\)/\1i16\2/gIe
    argdo %s/\([({;, ]\|^\)int32_t\([ )]\|$\)/\1i32\2/gIe
    argdo %s/\([({;, ]\|^\)int64_t\([ )]\|$\)/\1i64\2/gIe

    argdo %s/\([({;, ]\|^\)size_t\([ )]\|$\)/\1memt\2/gIe
    argdo %s/\([({;, ]\|^\)ssize_t\([ )]\|$\)/\1smemt\2/gIe

    argdo %s/\([({;, ]\|^\)float\([ )]\|$\)/\1r32\2/gIe
    argdo %s/\([({;, ]\|^\)double\([ )]\|$\)/\1r64\2/gIe
    argdo %s/\([({;, ]\|^\)uintptr_t\([ )]\|$\)/\1intptr\2/gIe

    argdo %s/\([({;, ]\|^\)int\([ )]\|$\)/\1i32\2/gIe

    argdo %s/\([({;,\*+\/\-=%\^!~ ]\)UINT32_MAX\([ );,\*+\/\-=%\^!~]\)/\1U32MAX\2/gIe
    argdo %s/\([({;,\*+\/\-=%\^!~ ]\)INT32_MAX\([ );,\*+\/\-=%\^!~]\)/\1I32MAX\2/gIe
    argdo %s/\([({;,\*+\/\-=%\^!~ ]\)INT32_MIN\([ );,\*+\/\-=%\^!~]\)/\1I32MIN\2/gIe

    argdo %s/\([({;,\*+\/\-=%\^!~ ]\)FLT_MAX\([ );,\*+\/\-=%\^!~]\)/\1R32MAX\2/gIe
    argdo %s/\([({;,\*+\/\-=%\^!~ ]\)FLT_MIN\([ );,\*+\/\-=%\^!~]\)/\1R32MIN\2/gIe

    argdo %s/\([({;,\*+\/\-=%\^!~ ]\)DBL_MAX\([ );,\*+\/\-=%\^!~]\)/\1R64MAX\2/gIe
    argdo %s/\([({;,\*+\/\-=%\^!~ ]\)DBL_MIN\([ );,\*+\/\-=%\^!~]\)/\1R64MIN\2/gIe
endfunction

function! CIncludeGuards()
    let @a = expand('%:t')

    normal gg
    normal O#ifndef 
    normal "ap
    normal F.
    normal r_
    normal gUiw
    normal yiw
    normal o#define 
    normal p
    normal o

    normal G
    normal o#endif // 
    normal p
    normal O
    normal gg
endfunction

function! RegenerateTags()
    if filereadable("tags")
        " let ctags_cmd="ctags --recurse"
        " let ctags_cmd="ctags *.cpp *.c *.h *.scala *.java &"
        " let ctags_cmd="ctags -R --append=no . &"
        " let ctags_cmd="ctags -R --exclude=extern --append=no . &"
        " let ctags_cmd="ctags -R --exclude=extern --exclude=generated --append=no . &"
        let ctags_cmd="ctags -R --exclude=extern --exclude=generated --append=no . &"

        execute "silent !" . ctags_cmd
        " execute "!" . ctags_cmd

        if v:shell_error != 0
            echom "RegenerateTags: '" . ctags_cmd . "' returned error code: " . v:shell_error
        endif
    else
        echom "RegenerateTags: No tags file found, not regenerating"
    endif
endfunction

""""""""""""""""""""""""""""
"       highlighting       "
"                          "

" Set the cursor highlighting
highlight Cursor guifg=white guibg=red

highlight ExtraWhitespace cterm=bold ctermbg=cyan ctermfg=white gui=bold guibg=cyan guifg=white
highlight Important cterm=bold ctermbg=NONE ctermfg=red gui=bold guibg=NONE guifg=red
highlight Done cterm=bold ctermbg=NONE ctermfg=green gui=bold guibg=NONE guifg=green

" mark column 80
" highlight ColorColumn ctermfg=red guifg=red ctermbg=NONE guibg=NONE
" set colorcolumn=81,82,83,84,85

function! OpenQuickfixWindow()
    cwindow
    " if (winnr('$') == 1) && (winwidth(0) > 150)
    "     let winw=(winwidth(0) / 2)
    "     exec "vert cwindow " . winw
    " else
    "     cwindow 15
    " endif
endfunction

function! FindTODOs()
    silent! vim /\C BUG\|TODO\|FIXME\|IDEA/j *.cpp *.c *.h
    call OpenQuickfixWindow()
endfunction

command! TODO call FindTODOs()

command! DATETIME put =strftime('%c')
command! DATE put =strftime('%Y/%m/%d')

""""""""""""""""""""""""""""""""""""
"       enclose with if/for        "
"                                  "

" function! VisualEncloseAndPrepend(prefix)
"     normal! `>
"     normal! o}
"
"     normal! `<
"     normal! O{
"
"     '<,'>normal! >>
"
"     execute 'normal! `<kO' . a:prefix . '('
"     startinsert!
" endfunction
"
" function! EncloseAndPrepend(type, prefix)
"     if a:type == 'v'
"         normal! `<
"         normal! mx
"
"         normal! `>
"         normal! my
"     else
"         normal! `[
"         normal! mx
"
"         normal! `]
"         normal! my
"     endif
"
"     normal! `x
"     normal! O{
"     execute "normal! O" . a:prefix . " ()"
"     normal! 0mx
"
"     normal! `y
"     normal! o}
"     normal! my
"
"     'x,'ynormal! ==
"
"     normal! `x$
"     startinsert
" endfunction
"
" function! EncloseAndPrependFor(type)
"     call EncloseAndPrepend(a:type, "for")
" endfunction
"
" function! EncloseAndPrependIf(type)
"     call EncloseAndPrepend(a:type, "if")
" endfunction
"
" function! EncloseAndPrependWhile(type)
"     call EncloseAndPrepend(a:type, "while")
" endfunction
"
" " enclose with for/if
" vnoremap <Leader>ei <ESC>:call EncloseAndPrepend("v", "if")<CR>
" vnoremap <Leader>ef <ESC>:call EncloseAndPrepend("v", "for")<CR>
" vnoremap <Leader>ew <ESC>:call EncloseAndPrepend("v", "while")<CR>
"
" nnoremap <Leader>ei :setlocal operatorfunc=EncloseAndPrependIf<CR>g@
" nnoremap <Leader>ef :setlocal operatorfunc=EncloseAndPrependFor<CR>g@
" nnoremap <Leader>ew :setlocal operatorfunc=EncloseAndPrependWhile<CR>g@

"""""""""""""""""""""
"       prose       "
"                   "

function! ProseMode()
    " set formatoptions=ta1
    set nonumber
    set norelativenumber
    " let g:goyo_height='100%'
    " noremap <Leader>G :Goyo<CR>

    " wordcount
    noremap <Leader>W :!wc -w %<CR>
    " vnoremap <Leader>w g<C-g>

    " make undo points while typing certain characters in insert mode
    inoremap . .<C-g>u
    inoremap , ,<C-g>u
    inoremap ! !<C-g>u
    inoremap ? ?<C-g>u
    inoremap : :<C-g>u
    " mappings for turning auto format off and on

    noremap <Leader>fm :set formatoptions-=a<CR>
    noremap <Leader>fa :set formatoptions+=a<CR>

    nnoremap p p

    set dictionary+=/usr/share/dict/american-english
    set complete+=k
    set infercase
    " colorscheme morning
    set nohlsearch
endfunction

command! Prose :call ProseMode()

""""""""""""""""""""""""""""
"       autocommands       "
"                          "
"

if has("autocmd")
    autocmd Syntax * call matchadd('Important', '\W\zs\(TEMPORARY\|TODO\|FIXME\|IMPORTANT\|BUG\)')
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(CHANGED\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|TAG\|IDEA\)')
    autocmd Syntax * match ExtraWhitespace /\s\+$/

    " c++ type highlighting
    autocmd FileType cpp syn keyword cppType    u8 u16 u32 u64 i8 i16 i32 i64 r32 r64
    autocmd FileType c syn keyword cType        u8 u16 u32 u64 i8 i16 i32 i64 r32 r64

    " autocmd FileType markdown call ProseMode()

	autocmd FileType go		set noexpandtab tabstop=4 shiftwidth=4	smartindent
	autocmd FileType html	set noexpandtab tabstop=2 shiftwidth=2	nosmartindent

    autocmd BufWritePost *.h,*.cpp,*.c,*.scala,*.java call RegenerateTags()

    autocmd FileType c,cpp command! IncludeGuard call CIncludeGuards()

    autocmd BufWritePost * FufRenewCache
    autocmd FocusGained * FufRenewCache

    """""""""""""""""""""""""""
    " autocompleting brackets "
    "                         "
    function! CPPBrackets()
        inoremap {      {}<Left>
        inoremap {<CR>  {<CR>}<Esc>O
        inoremap {{     {
    endfunction

    autocmd FileType cpp call CPPBrackets()
    autocmd FileType c call CPPBrackets()

    autocmd GUIEnter * set visualbell t_vb=
endif



" show highlighting group(s?) of word under cursor
" (copied from: http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor)
" map <F8> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"""""""""""""""""""
" leader commands "
"                 "

" open this file in a new tab
nnoremap <Leader>vr :tab drop $MYVIMRC<CR>
nnoremap <Leader>sov :so $MYVIMRC<CR>

nnoremap <Leader>w :w<CR>

" search and replace
nnoremap <Leader>sr :%s/
vnoremap <Leader>sr :s/

" splits
nnoremap <Leader>vs :vsplit<CR>
nnoremap <Leader>hs :split<CR>
" swap splits
nnoremap <Leader>ss <C-w>r

" toggle taglist
nnoremap <Leader><CR> :TlistToggle<CR>

" FuzzyFinder (fuzzy everything search
nnoremap <Leader>tf :FufFile<CR>
nnoremap <Leader>tt :FufTag<CR>
nnoremap <Leader>tb :FufBuffer<CR>
nnoremap <Leader>th :FufHelp<CR>
nnoremap <Leader>td :FufDir<CR>

" kill search highlighting
nnoremap <Leader>ks :nohlsearch<CR>

" makey makey
nnoremap <Leader>m :silent make<CR>:call OpenQuickfixWindow()<CR>

" commenting out code with tComment
nnoremap <Leader>cc :TComment<CR>
vnoremap <Leader>cc :TCommentMaybeInline<CR>

" vimgrep for word under cursor
nnoremap <Leader>* *:vimgrep // **/*.c **/*.cpp **/*.h<CR>

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
inoremap {}     {}
