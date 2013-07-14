au!
au BufNewFile,BufRead *.rb call Ft_ruby()
au BufNewFile,BufRead *.tcl call Ft_tcl()
au BufNewFile,BufRead *.py call Ft_python()
au BufNewFile,BufRead *.c call Ft_c()
au FileType rb,tcl set expandtab
au FileType rb call Ft_ruby()
au FileType c call Ft_c()
au FileType tcl call Ft_tcl()
au FileType sh call Ft_sh()
au FileType python call Ft_python()
au FileType tex call Ft_tex()
au! FileType *

" ------------------- MAPPING ------------------------
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
nmap <leader>b :buffers<cr>
nmap <leader>d :display<cr>
nmap <leader>ev :vsplit $MYVIMRC<cr>
nmap <leader>sv :source $MYVIMRC<cr>
imap jk <esc>
" ------------------- MAPPING ------------------------

" FT for sh/bash.
function! Ft_sh()
    map <F12> :!bash "%"<CR>
    map <F11> :!bash -n "%"<CR>
    setlocal ts=4
    setlocal shiftwidth=4
endfunction

" FT for Ruby.
function! Ft_ruby()
    map <F12> :!ruby "%"<CR>
    "map <F6> :!ruby -w -c "%"<CR>
    setlocal ts=2
    setlocal shiftwidth=2
endfunction
" FT for C.
function! Ft_c()
    setlocal ts=4
    setlocal sw=4
    "set makeprg=cc \/usr\/lib\/libunp.a

    "map <F11> :update<CR>:call Make()<CR>
    "map <F11> :!cc "%" /usr/lib/libunp.a<CR>
    map <F11> :!cc "%"<CR>
    map <F12> :!./a.out<CR>
endfunction

function! Make()
    let curr_dir = expand('%:h')
    if curr_dir == ''
      let curr_dir = '.'
    endif
    echo curr_dir
    execute 'lcd ' . curr_dir
    execute 'make %:r.o'
    execute 'lcd -'
endfunction

" FT for Tcl.
function! Ft_tcl()
    map <F12> :!tclsh "%"<CR>
    setlocal ts=4
    setlocal shiftwidth=4
endfunction
" For Python.
function! Ft_python()
    map <F12> :!python "%"<CR>
    setlocal ts=4
    setlocal shiftwidth=4
endfunction
" For LaTex.
function! Ft_tex()
    map <F11> :!pdflatex "%"<CR>
    map <F12> :exe '!xpdf -fullscreen ' . substitute(expand("%:p"), "tex$", "pdf", "")<CR>
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

function! Set_dark_bg()
    if (&term == "linux" || &term == "screen" || &term == "xterm")
        set bg=dark
        syntax on
        hi Normal guibg='black' guifg='white'
        hi Comment cterm=None
        hi Statement cterm=None
        hi Constant cterm=None
        hi Special cterm=None
        hi Identifier cterm=None
    endif
endfunction

set nu
set ruler
set ai
syntax on
set incsearch
set hls
set nocompatible
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set clipboard=unnamed
set laststatus=2
set wildmode=list:longest
set showmatch
set textwidth=80
set autoread

"map <F12> :call Sw_bg()<CR>
"map <F10> :bprevious<CR>
"map <F11> :bnext<CR>
filetype plugin on
filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab

iab <expr> __dts strftime("%D")
iab <expr> @@ 'tim.ye.ext@nsn.com'

"if (&term == "linux" || &term == "screen")
if (&term == "linux")
  "set t_ve+=[?81;0;112c
  " Make a blinking cursor.
  set t_ve+=[?6c
  call Set_dark_bg()
elseif (&term == "screen" || &term == "xterm")
  set bg=dark
endif
