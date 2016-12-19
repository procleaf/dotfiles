" ------------------- MAPPING ------------------------
let mapleader = ","
let g:mapleader = ","
nnoremap <leader>w :w!<cr>
nnoremap <leader>b :buffers<cr>
nnoremap <leader>g :registers<cr>
nnoremap <leader>e :e $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>c :call Sw_bg()<CR>
nnoremap <leader>t :Tlist<CR>
nnoremap <leader>x :call CallInterpreter()<CR>
nnoremap <leader>1 :bprevious<CR>
nnoremap <leader>2 :bnext<CR>
nnoremap <space> za
nnoremap <leader><leader> <c-^>
inoremap jk <esc>

" ------------------- MAPPING ------------------------

" ------------------- Settings -----------------------
" Not sure what this does.
execute pathogen#infect()

" Doc says this works in urxvt transparent mode.  Doesn't work for me.
let g:solarized_termtrans = 1

if has("gui_running")
    colorscheme solarized
    set background=dark
    "call togglebg#map("<F5>")
    "set guifont=Consolas:h9:cANSI:qDRAFT
    set guifont=Inconsolata\ Medium\ 11
endif

set nu
" Not sure what this does.
set ttyfast
" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
set ruler
set ai
syntax on
set incsearch
set hls
set guioptions=gae
set nocompatible
set clipboard=unnamed
set laststatus=2
set wildmode=list:longest
set showmatch
set textwidth=80
set autoread
set bs=2
set nohlsearch
set keywordprg=:help
" Autocomplete with dictionary words when spell check is on
"set complete+=kspell


" This will look in the current directory for 'tags',
" and work up the tree towards root until one is found.
" NOTE: not sure if it works, token from somebody else.
set tags=./tags;/


set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Persistent undo
if has("win32")
    set undodir=$HOME/vimfiles/undo
elseif has("unix")
    set undodir=$HOME/.vim/undo
endif
set undofile
set undolevels=1000
set undoreload=10000

"set mouse=a
"set ttymouse=xterm2
" ------------------- Settings -----------------------

filetype plugin indent on

set foldmethod=indent
set foldlevel=999

" --------------------- Plug-ins -----------------------
let g:pydiction_location = "$HOME/.vim/bundle/pydiction/complete-dict"
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>f  :YcmCompleter GoToDefinitionElseDeclaration<CR>

if has('python')
  let g:jedi#completions_command = "<C-N>"

  "let python_highlight_all = 1
  "set ofu=syntaxcomplete#Complete
  "autocmd FileType python set omnifunc=pythoncomplete#Complete
  "autocmd FileType python runtime! autoload/pythoncomplete.vim
endif

iab <expr> __dts strftime("%D")
iab <expr> @@ 'yqm_leaf@163.com'

" ------------------- Settings -----------------------

" ------------------- Functions -----------------------
" ------------------- Run script inside vim ----------
" TODO: may need to re-write this.  Using 'filetype' seems to be more natual.
au BufEnter *
      \ if match(getline(1) , '^\#!') == 0 |
      \     execute("let b:interpreter = getline(1)[2:]") |
      \ endif

function! CallInterpreter()
    if exists("b:interpreter")
        exec("!".b:interpreter." %")
    else
        echom "No interpreter defined."
    endif
endfunction

" Set customized file type commands.
" Not finished.
function! Custom_ft()

  let file_type = &ft

  let ft_table = {
    " File type,  ts, sw, compiler.
    'bash'     : [4, 4, 'bash'],
    'sh'       : [4, 4, 'sh'],
    'ruby'     : [2, 2, 'ruby'],
    'python'   : [4, 4, 'python'],
    'tcl'      : [4, 4, 'tclsh'],
    'expect'   : [4, 4, 'expect'],
    'vim'      : [2, 2, 'source'],
    'c'        : [4, 4, 'gcc']
    }

  if has_key(ft_table, &file_type)
    setlocal ts=ft_table.key[1]
    setlocal sw=ft_table.key[2]
    setlocal compiler=ft_table.key[3]
  endif

endfunction

function! Sw_bg()

    " Should probably use this:
    "let &background = ( &background == "dark"? "light" : "dark" )

    if (&bg == "dark")
        highlight Normal guibg='white' guifg='black'
        set bg=light
        syntax on
    elseif(&bg == "light")
        highlight Normal guibg='black' guifg='white'
        set bg=dark
        syntax on
    endif
endfunction

if (&term == "linux")
  "set t_ve+=[?81;0;112c
"  " Make a blinking cursor under console.
  set t_ve+=[?6c
"elseif (&term == "screen" || &term == "xterm")
"  "set bg=dark
endif
