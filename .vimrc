" .vimrc
" hardlinked as ~/.vimrc, ~/.vim/.vimrc

set nocompatible
filetype off
syntax on
filetype plugin indent on

" install plugins
call plug#begin('~/.vim/plugged')
let g:plug_timeout=500

" gui elements
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTree', 'NERDTreeToggle'] }
Plug 'majutsushi/tagbar'
"Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-powerline'

" formatting and navigation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" git
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

" undo
Plug 'sjl/gundo.vim', { 'on': 'Gundo' }

" alignment
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
" Plug 'godlygeek/tabular', { 'on': 'Tabularize' }

" autocomplete and ide
"Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
"Plug 'tpope/vim-commentary'
" Plug 'tomtom/tcomment_vim'

" syntax
Plug 'scrooloose/syntastic'

" search
"Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPTag'] }
Plug 'rking/ag.vim'
Plug 'skwp/greplace.vim', { 'on': ['Gsearch', 'Greplace'] }

" supertab
Plug 'ervandew/supertab'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ruby / rails
" Plug 'tpope/vim-rails'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby', 'on': ['RunCurrentSpecFile', 'RunNearestSpec', 'RunLastSpec'] }
" Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
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

" colorscheme
colorscheme molokai


" utilisnips
" taken from: http://stackoverflow.com/a/22253548/4151953
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" vmap <Leader>blame :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

let mapleader = ','            " leader

map <leader>dir :e<c-r>=expand('%:p:h') . '/'<cr>
" map <leader>s :split<c-r>=expand('%:p:h') . '/'<cr>
" map <leader>v :vsplit<c-r>=expand('%:p:h') . '/'<cr>

" basics
runtime macros/matchit.vim	   " jump between keywords with %

set visualbell                 " no beeps
set number                     " Show line numbers
set backspace=indent,eol,start " Makes backspace key more powerful.
set showcmd                    " Show me what I'm typing
set noshowmode                 " No Show current mode.

set noswapfile                 " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set splitright                 " Split vertical windows right to the current windows
set splitbelow                 " Split horizontal windows below to the current windows
set encoding=utf-8             " Set default encoding to UTF-8
set autowrite                  " Automatically save before :next, :make etc.
set autoread                   " Automatically reread changed files without asking me anything
set fileformats=unix,dos,mac   " Prefer Unix over Windows over OS 9 formats

set showmatch                  " Do not show matching brackets by flickering
set incsearch                  " Shows the match while typing
set hlsearch                   " Highlight found searches
set ignorecase                 " Search case insensitive...
set smartcase                  " ... but not when search pattern contains upper case characters

set viminfo+=n~/.vim/.viminfo

set modelines=3                " number of lines checked for modelines

set expandtab                  " expand tabs to spaces
set shiftwidth=2               " Use indents of 4 spaces
set tabstop=2                  " An indentation every four columns
set softtabstop=2              " Let backspace delete indent
set wrap linebreak nolist      " wrap on word boundaries

if has('breakindent')
  set breakindent              " indent wrapped lines to the same level as the first line
endif

set showcmd                    " show command in bottom bar
set cursorline                 " highlight current line
"set wildmenu                   " visual autocomplete for command menu
set wildmode=list:longest,full
set lazyredraw                 " redraw only when we need to.
set laststatus=2               " always show status bar (required in `mvim -v`)

set incsearch                  " search as characters are entered
set hlsearch                   " highlight matches

set tags=.git/tags    			   " redundant with fugitive

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
set grepprg=ag
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


" break line on comma
nmap <leader>, 0f,li


" toggle gundo
nnoremap <leader>u :GundoToggle<cr>


" paste multiple times from the same yank
" i.e., don't re-yank the replaced line after a paste
xnoremap p pgvy:


" insert blank lines with <enter>
"map <Enter> o<esc>
" map <S-Enter> O<esc>

" comment lines with <cmd+/> (vis Sublime)
" map <D-/> :TComment<cr>
" vmap <D-/> :TComment<cr>gv
map <D-/> gcc
vmap <D-/> gcc


" indent lines with <cmd+[> and <cmd+]> (vis Sublime)
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv


" indent entire file with <leader>i
map <leader>i mmgg=G`m<cr>


" paste from clipboard
map <leader>p :set paste<cr>o<esc>"*]p:set nopaste<cr>
map <D-v> :set paste<cr>o<esc>"*]p:set nopaste<cr>


" NERDTree setting
nnoremap <leader>n :NERDTreeToggle<cr>

let g:NERDTreeWinSize = 50


" jump to tag with <option-cmd-down>
nmap <M-D-Down> ^]


" jump to css class or id (usually) with <leader>]
nnoremap <leader>] :tag /<c-r>=expand('<cword>')<cr><cr>


" select all in gui with cmd+a
nnoremap <D-a> ggVG


" macvim-specific settings
if has('gui_macvim') && has('gui_running')
  echom "vimrc: loading gui settings"

  " set powerline/airline patched font
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h13
  else
      echom "no darwin!"
  endif

  " Disable print shortcut for 'goto anything...'
  macmenu File.Print key=<nop>

  " Disable new tab shortcut for 'goto file...'
  macmenu File.New\ Tab key=<nop>

  " Move  with cmd+alt
  " macm Window.Select\ Previous\ Tab  key=<D-M-LEFT>
  " macm Window.Select\ Next\ Tab	   key=<D-M-RIGHT>

  " Open new window via cmd+shift+n
  macmenu File.New\ Window key=<D-N>

  " create a new menu item with title "New File" and bind it to cmd+n
  " new files will be created on a new tab
  an 10.190 File.New\ File <nop>
  macmenu File.New\ File action=addNewTab: key=<D-n>

  " No toolbars, menu or scrollbars in the GUI
  " set clipboard+=unnamed
  set vb t_vb=
  set guioptions-=m  "no menu
  set guioptions-=T  "no toolbar
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r  "no scrollbar
  set guioptions-=R

  " switch tabs with <opt-cmd-h>, <opt-cmd-l>
  " noremap <C-D-l> :tabnext<cr>
  " noremap <C-D-h> :tabprev<cr>
endif

" Relative line numbers
if exists('&relativenumber')
	autocmd InsertEnter * :set number
	autocmd InsertLeave * :set relativenumber
endif

" wrapped lines fixes
noremap $ g$
noremap ^ g
nnoremap j gj
nnoremap k gk


" keep current visual block selection active after changing indent
"
vnoremap < <gv
vnoremap > >gv

" horizontal scrolling
" map zl zL
" map zh zH

" yank from cursor to end of line with Y, to be consistent with C and D
nnoremap Y y$
" ◀◀


" rspec
if has('gui_macvim') && has('gui_running')
  let g:rspec_command = 'time bundle exec rspec {spec}'
else
  let g:rspec_command = '!time bundle exec rspec {spec}'
endif
noremap <leader>t :call RunCurrentSpecFile()<cr>
noremap <leader>s :call RunNearestSpec()<cr>
noremap <leader>l :call RunLastSpec()<cr>

" save with <cmd-s>
map <D-s> <esc>:w


" remove search highlighting with <,/>
nmap <silent> <leader>/ :nohlsearch<cr>
nmap <silent> <leader>h :nohlsearch<cr>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Efficient save commands
nnoremap ; :

" map jj to esc
inoremap jj <esc>

" run makefile
noremap <silent> mm :!make<cr>

" tab shortcut
cabbrev tn tabnew


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

" splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" easier split resizing
" use with relative [width +3] or absolute [width 30]
ca width vertical resize
ca height resize

" readjust split sizes based on current active split
" rct does not understand this
" see https://upcase.com/videos/splits-with-patrick-brisbin
set winwidth=84
set winheight=5
set winminheight=5
set winheight=9999

" switch tabs with <ctrl-h>, <ctrl-l>
"noremap <c-h> :tabprev<cr>
"noremap <c-l> :tabnext<cr>

" delimitMate
" Stop completion with enter, in addition to default ctrl+y
"imap <expr> <cr> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" create line break when pressing enter
"let g:delimitMate_expand_cr = 1
"let g:delimitMate_expand_space = 1

" ctrlp
" let g:ctrlp_map = '<c-p>'
"map <c-p> :CtrlP<cr>
"map <c-t> :CtrlPTag<cr>
"let g:ctrlp_dotfiles            = 1
"let g:ctrlp_show_hidden         = 1
"let g:ctrlp_cmd                 = 'CtrlPMixed'       " search anything (in "files, buffers and MRU files at the same time.)
"let g:ctrlp_cmd                 = 'CtrlP'
"let g:ctrlp_working_path_mode   = 'ra'               " search for nearest "ancestor like .git, .hg, and the directory of the current file
"let g:ctrlp_match_window        = 'top,order:ttb'
"let g:ctrlp_max_height          = 12                 " maxiumum height of match "window
"let g:ctrlp_switch_buffer       = 'et'               " jump to a file if it's "open already
"let g:ctrlp_use_caching         = 1                  " enable caching
"let g:ctrlp_clear_cache_on_exit = 0                  " speed up by not removing "clearing cache evertime
"let g:ctrlp_mruf_max            = 250                " number of recently opened "files
"
"if exists('g:ctrlp_user_command')
"	unlet g:ctrlp_user_command
"end

"if exists('g:ctrlp_custom_ignore')
"	unlet g:ctrlp_custom_ignore
"end

"if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:ctrlp_user_command =
"    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
"  let g:ctrlp_use_caching = 0

"else
  " Fall back to using git ls-files if Ag is not available
"  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
"  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --"exclude-standard --others']

"endif

"let g:ctrlp_prompt_mappings = {
"	\ 'AcceptSelection("e")': ['<c-t>'],
"	\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"  \ 'ToggleType(1)':        ['<c-u>', '<c-up>'],
"  \ 'ToggleType(-1)':       ['<c-y>', '<c-down>'],
"  \ 'PrtExit()':            ['<c-l>', '<esc>', '<c-c>', '<c-g>'],
"  \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
"  \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
"  \ 'PrtHistory(-1)':       ['<c-j>'],
"  \ 'PrtHistory(1)':        ['<c-k>'],
"  \ }

" func! MyPrtMappings()
"     let g:ctrlp_prompt_mappings = {
"         \ 'AcceptSelection("e")': ['<c-t>'],
"         \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"         \ }
" endfunc

" func! MyCtrlPTag()
"     let g:ctrlp_prompt_mappings = {
"         \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
"         \ 'AcceptSelection("t")': ['<c-t>'],
"         \ }
"     CtrlPBufTag
" endfunc

" let g:ctrlp_buffer_func = { 'exit': 'MyPrtMappings' }
" com! MyCtrlPTag call MyCtrlPTag()

" coffee: https://gist.github.com/michaelglass/5210282
"let g:ctrlp_buftag_types = {
"	\ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf'
"\ }

" Open goto symbol on current buffer
"nmap <D-r> :MyCtrlPTag<cr>
"imap <D-r> <esc>:MyCtrlPTag<cr>

" Open goto symbol on all buffers
"nmap <D-R> :CtrlPBufTagAll<cr>
"imap <D-R> <esc>:CtrlPBufTagAll<cr>

" Open goto file
"nmap <D-t> :CtrlP<cr>
"imap <D-t> <esc>:CtrlP<cr>


" ycm
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" session and autosave
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1


" let g:multi_cursor_use_default_mapping = 0
" let g:multi_cursor_next_key = '<D-d>'
" let g:multi_cursor_prev_key = '<D-u>'
" let g:multi_cursor_skip_key = '<D-k>' " until we get multiple keys support
" let g:multi_cursor_quit_key = '<Esc>'

" airline
"let g:airline_powerline_fonts = 1
" let g:airline_theme="molokai"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'

" automatically remove trailing whitespaces
" see http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim#356130
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" fill rest of line with characters
function! FillLine( str )
	" clear existing 'str's at end of line, if any
	".s/=execute(echo a:str)$/$/g
	".s/^\(\s*\)\(\A*\)\([^\A]*\)\2*$/\1\2/g
	.s/\A*$//g " OK, can't figure out how to do that. Just clear all non-alphanumeric stuff

	let tw = &textwidth
	if tw==0 | let tw = 80 | endif            " set tw to the desired total length
		.s/[[:space:]]*$//                      " strip trailing spaces first
		let reps = (tw - col("$")) / len(a:str) " calculate total number of 'str's to insert
		if reps > 0                             " insert them, if there's room,
			.s/$/\=(' '.repeat(a:str, reps))/     " removing trailing spaces (though forcing there to be one)
	endif
endfunction
command! -nargs=1 FF call FillLine('<args>')

" change punctuation at end of line
function! ToggleEOLPunctuation()
	s/[;,.]\s*$//ge                       " remove selected punctuation or whitespace from EOL
	let l:c = getchar()                   " get replacement char, or ' ' to delete
	if l:c =~ "\<esc>" || l:c =~ "\<c-c>" " bail out if escaped
		return
	endif
	.s/$/\=nr2char(l:c)/ge                " insert at EOL
	.s/\s\+$//ge                          " kludge to delete ' ' (TBD: move to if clause)
endfunction
nmap <silent> t :call ToggleEOLPunctuation()<cr>

" see https://github.com/r00k/vimscript_talk/blob/master/examples.vim
function! ShortCwd()
  " Last arg is empty, but you must pass all args to funcs.
  return substitute(getcwd(), '/Users/rct/', "~/", '')
endfunction
nmap :pwd :echo ShortCwd()

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


