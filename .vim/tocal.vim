
let mapleader = ','
nnoremap <silent> <Leader>d :call Fcd() \| set hlsearch<CR>
nmap <Leader>ev :e ~/.vim/tocal.vim<CR>

if has("gui_running")
    set columns=83
    set lines=34
endif

set cursorline
set nowrap
set hlsearch

source ~/.vim/fcd.vim
source ~/.vim/wpp.vim
