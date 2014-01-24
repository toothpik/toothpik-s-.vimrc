"  weekly reminder formatter
"  called by ~/bin/weekly
"
let mapleader = ','
nmap <silent> <Leader>c :call WeekMe()<CR>
nmap <silent> <Leader>ev :edit ~/.vim/weekly.vim<CR>
nmap <silent> <Leader>s :source ~/.vim/weekly.vim<CR>

set cursorline
set guioptions-=r
if &number
    setlocal nonumber
endif
if &relativenumber
    setlocal norelativenumber
endif
set noruler
set noshowmode
set nowrap
call Hideme()
silent file week

function! WeekMe()
    set columns=35
    set lines=9
    winpos 1562 0
    let @/ = strftime("%a")
    silent %d
    silent r!cat ~/txt/weekly | wkly2
    normal gg
    silent normal n
    normal 0
endfunction
