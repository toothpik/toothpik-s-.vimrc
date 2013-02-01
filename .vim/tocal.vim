"  setup for tocal edit - called by tocal & tocalv
let mapleader = ','
nnoremap <silent> <Leader>c :call Fcd() \| set hlsearch<CR>
nnoremap <Leader>ev :e ~/.vim/tocal.vim<CR>
nnoremap <Leader>s :s ~/.vim/tocal.vim<CR>

set nowrap
set hlsearch
set nonumber

source ~/.vim/fcd.vim
source ~/.vim/wpp.vim
