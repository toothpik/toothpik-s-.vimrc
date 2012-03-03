"  called by ~/bin/weekly
call Hideme()
winpos 0 17
set columns=25
set lines=8
set cursorline
set guioptions-=r
set nonumber
set noruler
set noshowmode
set nowrap
let @/ = strftime("%a")
silent normal n
normal 0
function! NewDay()
    let @/ = strftime("%a")
    silent %d
    silent 0r!cat ~/txt/weekly | wkly2
    1
    silent normal n
    normal 0
    normal zz
endfunction
set hlsearch
silent file week
nmap <silent> <Leader>c :call NewDay()<CR>
nmap <silent> <Leader>ev :edit ~/.vim/weekly.vim<CR>
