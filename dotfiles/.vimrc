" ------------------- MAPPING ------------------------
let mapleader = ","
let g:mapleader = ","
" maybe should map <leader>w to :update<cr>.
nnoremap <leader>w :w!<cr>
nnoremap <leader>b :buffers<cr>
nnoremap <leader>r :!clear && gcc % -o %< && ./%<<CR>
nnoremap <leader>g :registers<cr>
nnoremap <leader>e :e $MYVIMRC<cr>
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>c :call Sw_bg()<CR>
nnoremap <leader>t :Tlist<CR>
nnoremap <leader>x :call CallInterpreter()<CR>
nnoremap <leader>1 :bprevious<CR>
nnoremap <leader>2 :bnext<CR>
nnoremap <leader><leader> <c-^>
nnoremap cm :exe 'normal! '.(virtcol('$')/2).'\|'<cr>

nnoremap <space> za
inoremap jk <esc>
" Force saving files that require root permission 
" sometimes it doesn't work.
cnoremap w!! w !sudo tee > /dev/null %

" ------------------- MAPPING ------------------------

" ------------------- Settings -----------------------
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 softtabstop=2

if has("win32")
    let vim_home = $HOME . '/vimfiles'
else
    let vim_home = $HOME . '/.vim'
endif

" Not sure what this does.
if filereadable(vim_home . "/autoload/pathogen.vim")
    execute pathogen#infect()
endif

" Doc says this works in urxvt transparent mode.  Doesn't work for me.
let g:solarized_termtrans = 1

if has("gui_running")
    if isdirectory(vim_home . "/bundle/vim-colors-solarized")
        colorscheme solarized
        set background=dark
    endif
    "call togglebg#map("<F5>")
    "
    if has("mac")
        set guifont=Inconsolata\ for\ Powerline\:h15
    elseif has("win32")
        set guifont=Inconsolata:h12:cANSI
    elseif has("unix")
        set guifont=Inconsolata\ for\ Powerline\ Medium\ 13
    end
endif

set number
" gets slow on ruby files.
"set relativenumber

" Not sure what this does.
set ttyfast
" Show “invisible” characters
"set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set list
"set t_Co=256
set ruler
set ai
syntax on
set incsearch
set hls
set guioptions=gae
set nocompatible
if $TMUX == ''
    set clipboard+=unnamed
endif
set laststatus=2
set wildmode=longest,list:longest
set showmatch
set textwidth=80
" set wrapmargin=0
" Disable auto linebreaks.
set formatoptions-=t
set formatoptions+=l
set autoread
set bs=2
set nohlsearch
set keywordprg=:help
" Autocomplete with dictionary words when spell check is on
set dictionary+=/usr/share/dict/words
set complete=.,b,u,]
set complete+=kspell

set path+=**

set fo+=qaw

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
else
    echom ('---->Warning: undo directory does not exist')
endif
if !isdirectory(&undodir)
    " TODO: what if &undodir a file?  how to catch an error in vim scripts.
    call mkdir(&undodir, "p")
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
"let g:pydiction_location = "$HOME/.vim/bundle/pydiction/complete-dict"
let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>f  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let NERDSpaceDelims = 1

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
      \     let b:interpreter = getline(1)[2:] |
      \ endif

function! CallInterpreter()
    " update will write changes (only if there's any) to disk.
    update
    if exists("b:interpreter")
        exec("!" . b:interpreter . " %")
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
