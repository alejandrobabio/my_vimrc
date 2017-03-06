set nocompatible
filetype off " required

" install plugins
call plug#begin('~/.vim/plugged')
let g:plug_timeout=500

" gui elements
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTree', 'NERDTreeToggle'] }
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'

" formatting and navigation
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-unimpaired'

" git
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

" undo
Plug 'sjl/gundo.vim'

" alignment
" Plug 'junegunn/vim-easy-align'
" Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" autocomplete and ide
"Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'tpope/vim-commentary'
" Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'

" syntax
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-markdown'
" search
"Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPTag'] }
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim', { 'on': ['Gsearch', 'Greplace'] }

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ruby / rails
" Plug 'tpope/vim-rails'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" React
Plug 'mxw/vim-jsx'

" text objects
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }

" linters
"Plug 'dbakker/vim-lint'

" colors
Plug 'flazz/vim-colorschemes'

" Improve code tools
Plug 'ngmy/vim-rubocop'
Plug 'rainerborene/vim-reek'

" Automatic make dirs
Plug 'DataWraith/auto_mkdir'

" wakatime.com
Plug 'wakatime/vim-wakatime'

Plug 'leafgarland/typescript-vim'

" gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" markdown plugin
Plug 'junegunn/goyo.vim'
call plug#end()

runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" options. run  `:options` for help
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 important
" Toggle paste mode while in insert mode with F10
set pastetoggle=<F10>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2 moving around, searching and patterns
" to highlight search results
set incsearch
" together make Vim deal with case-sensitive search intelligently
set ignorecase
set smartcase
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3 tags
" vim-bundler don't do the job
" set tags=.git/tags <-- this is done for vim-fugitive
" function! SetGemsTags()
"   if filereadable('./Gemfile')
"     let tag_paths=system("bundle show --paths")
"     let tag_paths=substitute(tag_paths, "\\n", "/tags,", "g")
"     return tag_paths
"   end
"   return ''
" endfunction
" let &tags=SetGemsTags()

" generate local tags on write buffer
" http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
" let b:git_dir = expand('%:p:h') . '/.git'
" autocmd BufWritePost *
"   \ if exists('b:git_dir') && isdirectory(b:git_dir) && executable(b:git_dir.'/hooks/ctags') |
"   \   call system('"'.b:git_dir.'/hooks/ctags" &') |
"   \ endif

" create tags file in current working directory
command! MakeTags :silent !ctags -R *

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4 displaying text
"set scrolloff=1
set nowrap
set list
set listchars=tab:·\ ,trail:·,precedes:«,extends:»
set number
set lazyredraw                 " no redraw on macros execution
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 5 syntax, highlighting and spelling
set hlsearch
" cursor en doble línea
set cursorline
" mark 72, 80 and 120 characters
set colorcolumn=72,80,120

" prevent lose colors
syntax enable
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 6 multiple windows
" set hidden                   " hide a buffer when abandoned
"" vim-powerline https://github.com/Lokaltog/vim-powerline
set laststatus=2 " Always display the statusline in all windows
set splitright                 " Split vertical windows right to the current windows
set splitbelow                 " Split horizontal windows below to the current windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 7 multiple tab pages
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 8 terminal
"
set term=xterm-256color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 9 using the mouse
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"10 printing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"11 messages and info
set shortmess+=A
set showcmd
set ruler
" vim-Powerline  Hide the default mode text (-- INSERT -- below the statusline)
set noshowmode
set visualbell                 " no beeps, only visual
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"12 selecting text
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"13 editing text
set formatoptions=tcqr
set complete=.,w,b,u,t,i
" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
set backspace=indent,eol,start
" show matching brackets
" set showmatch
set nrformats-=octal
let loaded_matchparen = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"14 tabs and indenting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
" use smartindent or cindent (cinoptions only for cindent)
"set smartindent
"set cindent
"set cinoptions=:0,p0,t0
"set cinwords=if,else,while,do,for,switch,case
set nosmartindent
set indentexpr=GetRubyIndent()
set shiftround
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"15 folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"16 diff mode
set diffopt=vertical
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"17 mapping
" all 3 fixes slow O inserts
set timeout
set timeoutlen=1000
set ttimeoutlen=100
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"18 reading and writing files
set autowrite                  " Automatically save before :next, :make etc.
set autoread                   " Automatically reread changed files without asking me anything
set fileformats=unix,dos,mac   " Prefer Unix over Windows over OS 9 formats
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"19 the swap file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"20 command line editing
set wildmenu
set wildmode=list:longest,full
set undofile
if &undodir =~# '^\.\%(,\|$\)'
  let &undodir = "/home/alejandro/bk/vim/undodir," . &undodir
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"21 executing external commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"22 running make and jumping to errors
set grepprg=ag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"23 language specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"24 multi-byte characters
set encoding=utf-8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"25 various
" applies substitutions globally on lines. Without type /g
set gdefault
let g:netrw_dirhistmax = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" else
"colorscheme darkZ
"colorscheme wombat256
" colorscheme molokai
colorscheme solarized
filetype plugin indent on
syntax on
let mapleader = ","
set bg=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" New Vim users will want the following lines to teach them to do things
" right:
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" utilisnips & YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-s>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets="<c-e>"

" ycm
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

:command! -bang -nargs=1 -range SubstituteUnlesString
    \ <line1>,<line2>call s:SubstituteUnlessString("<bang>", <f-args>)

" taked from http://vi.stackexchange.com/a/3030
" Function: s:SubstituteUnlessString(bang, repl_arg) {{{3
function! s:SubstituteUnlessString(bang, repl_arg) range abort
  let do_loop = a:bang != "!"
  let sep = a:repl_arg[0]
  let fields = split(a:repl_arg, sep)
  let cleansed_fields = map(copy(fields), 'substitute(v:val, "\\\\[<>]", "", "g")')
  " build the action to execute
  if fields[1] =~ '^\\='
    let replacement = matchstr(fields[1], '^\\=\zs.*')
  elseif fields[1] =~ '&\|\\\d'
    let replacement = "'".substitute(fields[1], '&\|\\\(\d\)', '\=string(".submatch(".(submatch(0)=="&"?"0":submatch(1)).").")', 'g') ."'"
  else
    let replacement = string(fields[1])
  endif
  let action = '\=(match(map(synstack(line("."), col(".")), "synIDattr(v:val, \"name\")"), "\\cstring")==-1 ? '.replacement.' : submatch(0))'
  let cmd = a:firstline . ',' . a:lastline . 's'
    \. sep . fields[0]
    \. sep . action
        \. sep.(len(fields)>=3 ? fields[2] : '')
  " echomsg cmd
  exe 'silent' . cmd
endfunction

" snippets don't work after dot, so I use a space and rid the space before write.
function! RidDotSpace()
  " mark current line
  " :normal mZ
  " :normal M
  " let pos = line('.')
    let l = line(".")
    let c = col(".")
  %SubstituteUnlesString/\C\(\.\) \([a-z]\+\)/\1\2/e
    call cursor(l, c)
  " go to marked line
  " :exec 'normal ' . pos . 'G'
  " :normal `Zzz
endfunction
" autocmd BufWritePre *.rb :call RidDotSpace()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autopairs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairs =  {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|':'|', '/':'/'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" matchit
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set set matchpairs+=<:>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-ruby
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ruby_indent_access_modifier_style = 'outdent'

" greplace
let g:grep_cmd_opts = '--line-numbers --noheading'

" alignment
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <plug>(EasyAlign)

" space open/closes folds
" nnoremap <space> za
nnoremap <space> :

" highlight last inserted text
nnoremap gV `[v`]

" change tab with 2 spaces
nnoremap <leader>T :%s/<tab>/\ \ <CR>

" I have a ,v mapping to reselect the text that was just pasted so I can
" perform commands (like indentation) on it:
nnoremap <leader>v V`]

" break line on comma
" nmap <leader>, 0f,li

" This last mapping lets me quickly open up my ~/.vimrc file in a new tab
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>es :tabnew ~/.vim/plugged/vim-snippets/snippets/ruby.snippets<cr>

" <c-^> switch to alternative buffer
nnoremap <leader><leader> <c-^>

noremap <c-t> <esc>:tabnew<cr>
noremap <leader>t <c-t>

" copy to clipboard
"map <leader>cy "*y
" paste from clipboard
map <leader>cp "*p
map <leader>cP "*P

nmap <tab> %
vmap <tab> %

" Map ee to open file in same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ee :edit %%

" paste multiple times from the same yank
" i.e., don't re-yank the replaced line after a paste
xnoremap p pgvy:

" indent entire file with <leader>i
map <leader>i mmgg=G`m<cr>

" NERDTree setting
nnoremap <leader>n :NERDTreeToggle<cr>
let g:NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '^\..*\.sw.$[[file]]']

" jump to css class or id (usually) with <leader>]
nnoremap <leader>] :tag /<c-r>=expand('<cword>')<cr><cr>

" wrapped lines fixes
" noremap $ g$
" noremap ^ g^
" nnoremap j gj
" nnoremap k gk

" keep current visual block selection active after changing indent
"vnoremap < <gv
"vnoremap > >gv

" horizontal scrolling
" map zl zL
" map zh zH

" yank from cursor to end of line with Y, to be consistent with C and D
" nnoremap Y y$
" ◀◀


" clear out a search
nnoremap <leader><space> :nohlsearch<cr>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" map jj to esc
"inoremap jj <esc>

" run makefile
" noremap <silent> mm :!make<cr>

" tab shortcut
"cabbrev tn tabnew


" TagbarToggle
nnoremap tb :TagbarToggle<cr>


" use tagbar with css
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
\ 'kinds'     : [
    \ 'c:classes',
    \ 's:selectors',
    \ 'i:identities'
\ ]
\ }

" from: https://github.com/vijaydev/dotfiles/blob/master/vimrc
nnoremap ss <C-w>s
nnoremap vv <C-w>v
" This next set of mappings maps <C-[h/j/k/l]> to the commands needed to move
" around your splits.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>++ 10<C-w>+
nnoremap <leader>-- 10<C-w>-
nnoremap <leader>>> 10<C-w>>
nnoremap <leader><< 10<C-w><

" easier split resizing
" use with relative [width +3] or absolute [width 30]
"ca width vertical resize
"ca height resize

" relpalce last find with confirmation
nnoremap <leader>s :%s///c<left><left>

let g:browser = 'google-chrome-beta -new-tab '

" replace ':bar =>' with 'bar:'
nnoremap <leader>rh :%s/:\([^=,'"]*\) =>/\1:/c
" replace 'bar:' with ':bar =>'
nnoremap <leader>hr :%s/\(\w*\): \([':]\)/:\1 => \2/c

" switch tabs
noremap <PageUp> :tabprev<cr>
noremap <PageDown> :tabnext<cr>

" switch to previous/next buffer
nnoremap <leader><PageUp> :bp<CR>
nnoremap <leader><PageDown> :bn<CR>

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz
nmap ? ?zz

" session and autosave
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

" multiple_cursors & YCM
function! Multiple_cursors_before()
    let g:ycm_auto_trigger = 0
endfunction

function! Multiple_cursors_after()
    let g:ycm_auto_trigger = 1
endfunction

" airline
let g:airline_theme="molokai"
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':t'

" save on focus lost
autocmd FocusLost * :wa

augroup MyAutoCmd
    autocmd!
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic setup
" from: https://github.com/Casecommons/vim-config/blob/master/init/syntastic.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
" eslint for react
"
let g:syntastic_javascript_checkers = ['eslint']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-reek
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:reek_always_show = 0
let g:reek_on_loading = 0
function! Ree()
  :w
  :RunReek
  " Shortcuts taken from Ack.vim - git://github.com/mileszs/ack.vim.git
  exec "nnoremap <silent> <buffer> q :ccl<CR>"
  exec "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
  exec "nnoremap <silent> <buffer> T <C-W><CR><C-W>TgT<C-W><C-W>"
  exec "nnoremap <silent> <buffer> o <CR>"
  exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
  exec "nnoremap <silent> <buffer> h <C-W><CR><C-W>K"
  exec "nnoremap <silent> <buffer> H <C-W><CR><C-W>K<C-W>b"
  exec "nnoremap <silent> <buffer> v <C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t"
  exec "nnoremap <silent> <buffer> gv <C-W><CR><C-W>H<C-W>b<C-W>J"
  exec "nnoremap <silent> <buffer> e <CR><C-w><C-w>:cclose<CR>"
endfunction
" :RunReek
map <leader>ree :call Ree()<cr>
" use :lopen to open location-list
" use :lnext to next error
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sandi_meter of current file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Sm()
  let metrics = system("sandi_meter -d -p " . expand("%:p"))
  :vnew|put=metrics| setlocal buftype=nofile bufhidden=hide noswapfile |
endfunction

:command! Sm :call Sm()
" map <leader>Sm :call Sm()<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-rubocop
nmap <Leader>rb :w\|:RuboCop<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" see https://github.com/r00k/vimscript_talk/blob/master/examples.vim
function! ShortCwd()
  " Last arg is empty, but you must pass all args to funcs.
  return substitute(getcwd(), '/home/alejandro/', "~/", '')
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically remove trailing whitespaces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" see http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim#356130
function! StripTrailingWhitespaces()
    " :normal mZ
"     :normal M
"     let lnum = line(".")
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
"     :exec "normal " . lnum . "G"
    " :normal `Zzz
endfun
autocmd BufWritePre * :call StripTrailingWhitespaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump to last cursor position unless it's invalid or in an event handler
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exec "normal g`\"" |
  \ endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>f :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
map <leader>l :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRACT VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ExtractVariable()
    let name = input("Variable name: ")
    if name == ''
        return
    endif
    " Enter visual mode (not sure why this is needed since we're already in
    " visual mode anyway)
    normal! gv

    " Replace selected text with the variable name
    exec "normal c" . name
    " Define the variable on the line above
    exec "normal! O" . name . " = "
    " Paste the original selected text to be the variable value
    normal! $p
endfunction
vnoremap <leader>rv :call ExtractVariable()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" INLINE VARIABLE (SKETCHY)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InlineVariable()
    " Copy the variable under the cursor into the 'a' register
    :let l:tmp_a = @a
    :normal "ayiw
    " Delete variable and equals sign
    :normal 2daW
    " Delete the expression into the 'b' register
    :let l:tmp_b = @b
    :normal "bd$
    " Delete the remnants of the line
    :normal dd
    " Go to the end of the previous line so we can start our search for the
    " usage of the variable to replace. Doing '0' instead of 'k$' doesn't
    " work; I'm not sure why.
    normal k$
    " Find the next occurence of the variable
    exec '/\<' . @a . '\>'
    " Replace that occurence with the text we yanked
    exec ':.s/\<' . @a . '\>/' . @b
    :let @a = l:tmp_a
    :let @b = l:tmp_b
endfunction
nnoremap <leader>ri :call InlineVariable()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction

function! OpenInTabTestAlternate()
  let new_file = AlternateForCurrentFile()
  if match(expand("%"), '^spec/') != -1
    :vs
  else
    :leftabove vs
  endif
  exec ':e ' . new_file
endfunction

function! AlternateForCurrentFile()
  if g:framework == 'hanami'
    return HanamiAlternateForCurrentFile()
  else
    return RailsAlternateForCurrentFile()
  end
endfunction

function! HanamiAlternateForCurrentFile()
  let current_file = expand("%")
  let current_file = substitute(current_file, getcwd() . '/', '' , '')
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_apps = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<views\>') != -1
  " let in_app_assets = match(current_file, '\<javascripts\>') != -1
  if going_to_spec
    " if in_app_assets
    "   let new_file = substitute(new_file, '^app/assets/', '', '')
    "   let new_file = substitute(new_file, '\.e\?coffee$', '_spec.coffee', '')
    " else
    "   if in_apps
    "     let new_file = substitute(new_file, '^apps/', '', '')
    "   end
    " end
    let new_file = substitute(new_file, '^\.\?\/\?\(apps\|lib\)/', '', '')
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    " if in_app_assets
    "   let new_file = 'app/assets/' . new_file
    "   let new_file = substitute(new_file, '_spec\.coffee$', '.coffee', '')
    " else
      if in_apps
        let new_file = 'apps/' . new_file
      else
        let new_file = 'lib/' . new_file
      end
    " end
  endif
  return new_file
endfunction

function! RailsAlternateForCurrentFile()
  let current_file = expand("%")
  let current_file = substitute(current_file, getcwd() . '/', '' , '')
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<services\>') != -1 || match(current_file, '\<jobs\>') || match(current_file, '\<decorators\>') || match(current_file, '\<policies\>') != -1 || match(current_file, '\<interactions\>') != -1
  let in_app_assets = match(current_file, '\<javascripts\>') != -1
  if going_to_spec
    if in_app_assets
      let new_file = substitute(new_file, '^app/assets/', '', '')
      let new_file = substitute(new_file, '\.e\?coffee$', '_spec.coffee', '')
    else
      if in_app
        let new_file = substitute(new_file, '^app/', '', '')
      end
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app_assets
      let new_file = 'app/assets/' . new_file
      let new_file = substitute(new_file, '_spec\.coffee$', '.coffee', '')
    else
      if in_app
        let new_file = 'app/' . new_file
      end
    end
  endif
  return new_file
endfunction

" let g:framework = 'hanami'
let g:framework = 'rails'
" nnoremap <leader>. :call OpenTestAlternate()<cr>
nnoremap <leader>. :call OpenInTabTestAlternate()<cr>

function! ToggleFramework()
  if g:framework == 'rails'
    let g:framework = 'hanami'
    let g:test_gem = ' m '
    let g:spring = ''
  else
    let g:framework = 'rails'
    let g:test_gem = ' rspec '
    let g:spring = 'spring'
  end
  call MapSelecta()
endfunction

command! TF :call ToggleFramework()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! MapCR()
  "nnoremap <cr> :call RunTestFile()<cr>
"endfunction
"call MapCR()
"nnoremap <leader>U :call RunTestFile()<cr>
nnoremap <leader>u :call RunNearestTest()<cr>
"nnoremap <leader>a :call RunTests('')<cr>
"nnoremap <leader>m :call TestModified()<cr>
"nnoremap <leader>c :w\|:!script/features<cr>
"nnoremap <leader>w :w\|:!script/features --profile wip<cr>
let g:jstest = 'jasmine'

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

function! RunTestFile(...)
    if a:0 && match(expand("%"), '\.coffee$') == -1 && match(expand("%"), '_test\.rb') == -1
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.coffee\|.feature\|_test.rb\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    :echo 'RunTests'
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    :silent !clear
    if match(a:filename, '\.coffee') != -1
        exec ":silent !echo 'time " . g:spring . g:jstest . " '" . a:filename
        exec ":!time " . g:spring . g:jstest . a:filename
    elseif match(a:filename, '\.feature') != -1
        exec ":silent !echo 'time " . g:spring . " cucumber '" .  a:filename
        exec ":!time " . g:spring . " cucumber " . a:filename
    elseif match(a:filename, '_test\.rb') != -1
        exec ":silent !echo 'time TESTOPTS=-p time " . g:spring . " rake test '" .  a:filename
        exec ":!time TESTOPTS=-p " . g:spring . " rake test " . a:filename
    else
        exec ":silent !echo 'time " . g:spring . g:test_gem . "'" .  a:filename
        exec ":!COV=no " . g:spring . g:test_gem . a:filename
    end
endfunction

" run tests on modified
function! TestModified()
  let args = system('git status -s spec | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let args_ary = split(args, '\n')
  let s = ''
  for arg in args_ary
    if arg =~ "spec_helper.rb" || arg =~ "support"
      echo arg . ' modified, run all tests'
      return
    endif
    if arg !~ "spec_helper.rb" && arg !~ "fabricators" && arg !~ "support"
      let s = s . ' ' . arg
    endif
  endfor
  call RunTests(s)
endfunction

if g:framework == 'hanami'
  let g:test_gem = ' m '
  let g:spring = ''
else
  let g:test_gem = ' rspec '
  let g:spring = ' spring '
end
" let g:spring = 'zeus'
command! Spring :let g:spring = 'spring'
command! UnSpring :let g:spring = ''
command! Tea :let g:jstest = ' teaspoon '
command! Notea :let g:jstest = ' jasmine '
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" selecta https://github.com/garybernhardt/selecta
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! SelectaFile(path, search, ...)
  if (a:0 && a:1 == 'find') || !filereadable(".git/HEAD")
    call SelectaCommand("find " . a:path . " -type f -not -path '*/\.*\.sw.'", a:search, ":e")
  else
    call SelectaCommand("git ls-files -c -o --exclude-standard " . a:path, a:search, ":e")
  endif
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
function! MapSelecta()
  nnoremap <leader>tt :call SelectaFile(".", "", 'find')<cr>
  if g:framework == 'hanami'
    nnoremap <leader>tv :call SelectaFile("apps/*/templates", "-s //")<cr>
    nnoremap <leader>tw :call SelectaFile("apps/*/views", "-s //")<cr>
    nnoremap <leader>tc :call SelectaFile("apps/*/controllers", "-s //")<cr>
    nnoremap <leader>tm :call SelectaFile("lib/*/models", "-s //")<cr>
    " nnoremap <leader>tp :call SelectaFile("apps/*/policies", "-s //")<cr>
    nnoremap <leader>ta :call SelectaFile("apps/*/assets", "-s //")<cr>
    " nnoremap <leader>td :call SelectaFile("apps/*/decorators", "-s //")<cr>
    " nnoremap <leader>tr :call SelectaFile("apps/*/services", "-s //")<cr>
    " nnoremap <leader>tj :call SelectaFile("apps/*/jobs", "-s //")<cr>
    nnoremap <leader>to :call SelectaFile("**/config", "-s /")<cr>
  else
    nnoremap <leader>tv :call SelectaFile("app/views", "-s //")<cr>
    nnoremap <leader>tc :call SelectaFile("app/controllers", "-s //")<cr>
    nnoremap <leader>tm :call SelectaFile("app/models", "-s //")<cr>
    nnoremap <leader>th :call SelectaFile("app/helpers", "-s //")<cr>
    nnoremap <leader>tp :call SelectaFile("app/policies", "-s //")<cr>
    nnoremap <leader>ta :call SelectaFile("app/assets", "-s //")<cr>
    nnoremap <leader>td :call SelectaFile("app/decorators", "-s //")<cr>
    nnoremap <leader>tr :call SelectaFile("app/services", "-s //")<cr>
    nnoremap <leader>tj :call SelectaFile("app/jobs", "-s //")<cr>
    nnoremap <leader>ti :call SelectaFile("app/interactions", "-s //")<cr>
    nnoremap <leader>to :call SelectaFile("config", "-s /")<cr>
  endif
  nnoremap <leader>tl :call SelectaFile("lib", "-s /")<cr>
  nnoremap <leader>ts :call SelectaFile("spec", "-s /")<cr>
  nnoremap <leader>tf :call SelectaFile("features", "-s /")<cr>
endfunction

call MapSelecta()

"When you put your cursor anywhere in the word "User" and press <leader>g, This
"mapping will open Selecta with the search box pre-populated with "User". It's
"a quick and dirty way to find files related to an identifier.

function! SelectaIdentifier(vim_command)
  " Yank the word under the cursor into the z register
  normal "zyiw
  " Fuzzy match files in the current directory, starting with the word under
  " the cursor
  call SelectaCommand("find * -type f", "-s " . @z, a:vim_command)
endfunction
nnoremap <leader>ge :call SelectaIdentifier(":e")<cr>
nnoremap <leader>gt :call SelectaIdentifier(":tabnew")<cr>
nnoremap <leader>gv :call SelectaIdentifier(":vs")<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open file from Gsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FileInTab()
  " Yank the word under the cursor into the z register
  normal "zyy
  " take file name and open in tab.
  let parts = split(@z, ':')
  " exec "tabedit " . parts[0]
  exec "vs " . parts[0]
  exec ":" .parts[1]
endfunction
command! FileInTab :call FileInTab()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff tab management: open the current git diff in a tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! GdiffInTab tabedit %|Gdiff HEAD
nnoremap <leader>d :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\|??\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "tabnew " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" comands wrap unwrap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Wrap()
  set wrap
  set nonumber
  " wrapped lines fixes
  noremap $ g$
  noremap ^ g^
  nnoremap j gj
  nnoremap k gk
endfunction
command! Wrap :call Wrap()

function! Nowrap()
  set nowrap
  set number
  " return to nowrapped lines fixes
  noremap $ $
  noremap ^ ^
  nnoremap j j
  nnoremap k k
endfunction
command! Nowrap :call Nowrap()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use :AG .css example
command! -nargs=* GS :Gsearch -G <args>
command! -nargs=* AG :Ag -G <args>
