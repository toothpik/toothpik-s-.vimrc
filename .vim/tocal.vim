"  setup for tocal edit - called by tocal & tocalv & bothcals
let mapleader = ','
nnoremap <silent> <Leader>c :call Fcd() \| set hlsearch<CR>
nnoremap <Leader>ev :e ~/.vim/tocal.vim<CR>
nnoremap <Leader>j :e ~/bin/jtr<CR>
nnoremap <Leader>sss :source ~/.vim/tocal.vim<CR>
nnoremap <Leader>t :e ~/bin/ts<CR>

set nowrap
set hlsearch
set nonumber

source ~/.vim/fcd.vim
source ~/.vim/wpp.vim
