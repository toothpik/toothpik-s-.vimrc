"  show new laundry schedule
"  called by bin/snls
winsize 22 4
winpos 832 17
set cursorline
set guioptions-=r
set nonumber
set noruler
set nocursorline
set noshowmode
set nowrap
call Hideme()
silent file laundry
function! NewDay()
    silent %d
    silent r!sll2
    normal gg
    normal dd
    normal 0
endfunction
call NewDay()
nmap <silent> <Leader>c :call NewDay()<CR>
nmap <silent> <Leader>ev :e ~/.vim/snls.vim<CR>
nmap <silent> <Leader>l :source ~/.vim/snls.vim<CR>

