"  laundry window -- used by ~/bin/lw
let mapleader = ','
nmap <silent> <Leader>c :call LWme()<bar>:set hlsearch<CR>
nmap <silent> <Leader>ev :edit ~/.vim/lw.vim<CR>

set nocursorline
set guioptions-=r
if &number
    setlocal nonumber
endif
if &relativenumber
    setlocal norelativenumber
endif
set noruler
set nowrap
call Hideme()
silent file LaunWin

function! LWme()
"   let lo = system("sll | gll.awk")
"   let lo2 = lo + 3
"   execute 'set columns=' . lo2
    set columns=35
    let ll = system('sll | wc -l')
    let ll2 = ll + 2
    execute 'set lines=' . ll2
    winpos 1562 214
    silent %d
    silent r!sll
    normal gg
    normal 0
    let @/ = ''
endfunction
