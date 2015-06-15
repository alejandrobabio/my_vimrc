set nocompatible

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
Plug 'junegunn/vim-easy-align'
" Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" autocomplete and ide
"Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'tpope/vim-commentary'
" Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'

" syntax
Plug 'scrooloose/syntastic'

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
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

" text objects
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'

" linters
"Plug 'dbakker/vim-lint'

" colors
Plug 'flazz/vim-colorschemes'


call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" options. run  `:options` for help
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 important
set nocompatible
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
function! SetGemsTags()
  if filereadable('./Gemfile')
    let tag_paths=system("bundle show --paths")
    let tag_paths=substitute(tag_paths, "\\n", "/tags,", "g")
    return tag_paths
  end
  return ''
endfunction
let &tags=SetGemsTags()

" generate local tags on write buffer
let b:git_dir = expand('%:p:h') . '/.git'
autocmd BufWritePost *
  \ if isdirectory(b:git_dir) && executable(b:git_dir.'/hooks/ctags') |
  \   call system('"'.b:git_dir.'/hooks/ctags" &') |
  \ endif
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 6 multiple windows
set hidden
"" vim-powerline https://github.com/Lokaltog/vim-powerline
set laststatus=2 " Always display the statusline in all windows
set splitright                 " Split vertical windows right to the current windows
set splitbelow                 " Split horizontal windows below to the current windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 7 multiple tab pages
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 8 terminal
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" else
"colorscheme darkZ
"colorscheme wombat256
colorscheme molokai
filetype plugin indent on
syntax on
let mapleader = ","


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" utilisnips & YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taken from: http://stackoverflow.com/a/22253548/4151953
" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:ycm_filetype_specific_completion_to_disable = {
"             \ 'ruby': 1
"             \}

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-s>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-e>"
"let g:SuperTabCrMapping = 0
"let g:UltiSnipsUsePythonVersion=2

" ycm
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" vmap <Leader>blame :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd Filetype ruby,eruby let g:rubycomplete_use_bundler = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autopairs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:AutoPairs =  {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|':'|'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-ruby
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ruby_indent_access_modifier_style = 'outdent'


" map <leader>dir :e<c-r>=expand('%:p:h') . '/'<cr>
" map <leader>s :split<c-r>=expand('%:p:h') . '/'<cr>
" map <leader>v :vsplit<c-r>=expand('%:p:h') . '/'<cr>

" basics
" runtime macros/matchit.vim	   " jump between keywords with %



"set viminfo+=n~/.vim/.viminfo

"set modelines=3                " number of lines checked for modelines

"set wrap linebreak nolist      " wrap on word boundaries

"if has('breakindent')
"  set breakindent              " indent wrapped lines to the same level as the first line
"endif

"set wildmenu                   " visual autocomplete for command menu



" set foldenable                 " enable folding
" set foldlevelstart=2           " 0 = all closed, 99 = all open
" set foldnestmax=10             " 10 nested fold max
" set foldmethod=indent          " fold based on indent level

" gitgutter
"let g:gitgutter_enabled = 1

" hidden fold markers -- BETA
" autocmd FileType erlang :set foldmarker=\ %▶▶,\ %◀◀ foldmethod=marker commentstring= conceallevel=2
" autocmd FileType erlang :syntax match Comment /%▶▶\|%◀◀/ conceal

" " autocmd FileType vim :set foldmarker=\ \"▶▶,\ \ foldmethod=marker commentstring= conceallevel=3
" " autocmd FileType vim :syntax match Comment /"▶▶\|/ conceal

" greplace
let g:grep_cmd_opts = '--line-numbers --noheading'


" alignment
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <plug>(EasyAlign)


" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <plug>(EasyAlign)


" space open/closes folds
nnoremap <space> za


" highlight last inserted text
nnoremap gV `[v`]

" I have a ,v mapping to reselect the text that was just pasted so I can
" perform commands (like indentation) on it:
nnoremap <leader>v V`]

" break line on comma
" nmap <leader>, 0f,li

" This last mapping lets me quickly open up my ~/.vimrc file in a new tab
nnoremap <leader>ev :tabnew $MYVIMRC<cr>

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

" toggle gundo
" nnoremap <leader>u :GundoToggle<cr>


" paste multiple times from the same yank
" i.e., don't re-yank the replaced line after a paste
xnoremap p pgvy:


" indent entire file with <leader>i
map <leader>i mmgg=G`m<cr>


" NERDTree setting
nnoremap <leader>n :NERDTreeToggle<cr>
let g:NERDTreeShowHidden=1


" jump to css class or id (usually) with <leader>]
nnoremap <leader>] :tag /<c-r>=expand('<cword>')<cr><cr>


" wrapped lines fixes
noremap $ g$
noremap ^ g^
nnoremap j gj
nnoremap k gk


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

" camel case motiona
" map w <Plug>CamelCaseMotion_w
" map b <Plug>CamelCaseMotion_b
" map e <Plug>CamelCaseMotion_e
" sunmap w
" sunmap b

" source current file
nmap ss :so %<cr>

" source ~/.vimrc
map :src<cr> :so ~/.vimrc<cr>
nmap sss :src

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

" easier split resizing
" use with relative [width +3] or absolute [width 30]
"ca width vertical resize
"ca height resize

" relpalce last find with confirmation
nnoremap <leader>s :%s///cg<left><left><left>

let g:browser = 'google-chrome -new-tab '

" replace ':bar =>' with 'bar:'
nnoremap <leader>rh :%s/:\([^=,'"]*\) =>/\1:/gc
" replace 'bar:' with ':bar =>'
nnoremap <leader>hr :%s/\(\w*\): \([':]\)/:\1 => \2/gc

" readjust split sizes based on current active split
" rct does not understand this
" see https://upcase.com/videos/splits-with-patrick-brisbin
"set winwidth=84
"set winheight=5
"set winminheight=5
"set winheight=9999

" switch tabs
noremap <PageUp> :tabprev<cr>
noremap <PageDown> :tabnext<cr>

" switch to previous/next buffer
nnoremap <leader><PageUp> :BufSurfBack<CR>
nnoremap <leader><PageDown> :BufSurfForward<CR>

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
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" save on focus lost
autocmd FocusLost * :wa

augroup MyAutoCmd
    autocmd!
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

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
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump to last cursor position unless it's invalid or in an event handler
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
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
  exec ':vs'
  if match(expand("%"), '^spec/') != -1
    exec "normal \<C-w>l"
  endif
  exec ':e ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<services\>') != -1 || match(current_file, '\<jobs\>') != -1
  let in_app_assets = match(current_file, '\<javascripts\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    if in_app_assets
      let new_file = substitute(new_file, '^app/assets/', '', '')
      let new_file = substitute(new_file, '\.e\?coffee$', '_spec.coffee', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app_assets
      let new_file = 'app/assets/' . new_file
      let new_file = substitute(new_file, '_spec\.coffee$', '.coffee', '')
    end
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction

nnoremap <leader>. :call OpenTestAlternate()<cr>
nnoremap <leader>. :call OpenInTabTestAlternate()<cr>

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
    " Write the file and run tests for the given filename
    if expand("%") != ""
      :w
    end
    :silent !clear
    if match(a:filename, '\.coffee') != -1
        exec ":silent !echo 'time spring teaspoon '" . a:filename
        exec ":!time spring teaspoon " . a:filename
    elseif match(a:filename, '\.feature') != -1
        exec ":silent !echo 'time spring cucumber '" .  a:filename
        exec ":!time spring cucumber " . a:filename
    elseif match(a:filename, '_test\.rb') != -1
        exec ":silent !echo 'time TESTOPTS=-p time spring rake test '" .  a:filename
        exec ":!time TESTOPTS=-p spring rake test " . a:filename
    else
        exec ":silent !echo 'time spring rspec --color '" .  a:filename
        exec ":!time spring rspec --color " . a:filename
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" selecta https://github.com/garybernhardt/selecta
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

function! SelectaFile(path, search)
  call SelectaCommand("find " . a:path . " -type f", a:search, ":e")
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>tt :call SelectaFile(".", "")<cr>
nnoremap <leader>tv :call SelectaFile("app/views", "-s //")<cr>
nnoremap <leader>tc :call SelectaFile("app/controllers", "-s //")<cr>
nnoremap <leader>tm :call SelectaFile("app/models", "-s //")<cr>
nnoremap <leader>th :call SelectaFile("app/helpers", "-s //")<cr>
nnoremap <leader>tl :call SelectaFile("lib", "-s /")<cr>
nnoremap <leader>to :call SelectaFile("config", "-s /")<cr>
nnoremap <leader>tp :call SelectaFile("public", "-s /")<cr>
nnoremap <leader>ts :call SelectaFile("spec", "-s /")<cr>
nnoremap <leader>tf :call SelectaFile("features", "-s //")<cr>
nnoremap <leader>ta :call SelectaFile("app/assets", "-s //")<cr>
nnoremap <leader>td :call SelectaFile("app/decorators", "-s //")<cr>
nnoremap <leader>tr :call SelectaFile("app/services", "-s //")<cr>
nnoremap <leader>tj :call SelectaFile("app/jobs", "-s //")<cr>

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
" Diff tab management: open the current git diff in a tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! GdiffInTab tabedit %|Gdiff
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
