"  setup for tocal edit - called by tocal & tocalv & bothcals
let mapleader = ','
nnoremap <silent> <Leader>c :call Fcd() \| set hlsearch<CR>
nnoremap <Leader>ev :e ~/.vim/tocal.vim<CR>
nnoremap <Leader>sss :source ~/.vim/tocal.vim<CR>

set nowrap
set hlsearch

source ~/.vim/fcd.vim
