" ------------------- MAPPING ------------------------
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>b :buffers<cr>
nmap <leader>d :display<cr>
nmap <leader>ev :vsplit $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>
nmap <leader>r :call Sw_bg()<CR>
"map <leader>1 :previous<CR>
"map <leader>2 :bnext<CR>
imap jk <esc>
" ------------------- MAPPING ------------------------

" ------------------- Run script inside vim ----------
au BufEnter *
      \ if match(getline(1) , '^\#!') == 0 |
      \     execute("let b:interpreter = getline(1)[2:]") |
      \ endif

function! CallInterpreter()
  if exists("b:interpreter")
     exec("!".b:interpreter." %")
   else
     echo "No interpreter defined."
   endif
endfunction
map <leader>t :call CallInterpreter()<CR>

" ------------------- Settings -----------------------
set bg=light
set nu
set ruler
set ai
syntax on
set incsearch
set hls
set guioptions=gaem
set nocompatible
set clipboard=unnamed
set laststatus=2
set wildmode=list:longest
set showmatch
set textwidth=80
set autoread
set bs=2
" ------------------- Settings -----------------------

filetype plugin on
filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab

iab <expr> __dts strftime("%D")
iab <expr> @@ 'yeqiming@gmail.com'

" ------------------- Settings -----------------------

" ------------------- Functions -----------------------

" Set customized file type commands.
function! Custom_ft()

  let file_type = &ft

  let ft_table = {
    " File type,  ts, sw, compiler.
    'bash'     : [4, 4, 'bash']
    'sh'       : [4, 4, 'bash'],
    'ruby'     : [2, 2, 'ruby'],
    'python'   : [4, 4, 'python'],
    'tcl'      : [4, 4, 'tclsh'],
    'expect'   : [4, 4, 'expect'],
    'c'        : [4, 4, 'gcc']
    }

endfunction

function! Sw_bg()
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

"if (&term == "linux")
"  set t_ve+=[?81;0;112c
"  " Make a blinking cursor.
"  set t_ve+=[?6c
"elseif (&term == "screen" || &term == "xterm")
"  "set bg=dark
"endif
