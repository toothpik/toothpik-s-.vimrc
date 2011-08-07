
"set lines=8
"set columns=25
winsize 25 8
winpos 0 17
set cursorline
set guioptions-=r
set nonumber
set noruler
set noshowmode
set nowrap
call Hideme()
silent file week
function! NewDay()
    let @/ = strftime("%a")
    normal 4G
    silent normal n
    normal 0
    normal zz
endfunction
call NewDay()
set hlsearch
nmap <silent> <Leader>c :call NewDay()<CR>
