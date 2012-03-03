
let mapleader = ','
nnoremap <silent> <Leader>c :call Fcd() \| set hlsearch<CR>
nnoremap <Leader>ev :e ~/.vim/tocal.vim<CR>
nnoremap <Leader>s :s ~/.vim/tocal.vim<CR>

if has("gui_running")
    set columns=83
    set lines=34
endif

set cursorline
set nowrap
set hlsearch
set nonumber

source ~/.vim/fcd.vim
source ~/.vim/wpp.vim
