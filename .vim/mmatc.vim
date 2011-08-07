" make me a three calendar
" currently called by sacalh
"
let mapleader = ','
nnoremap <Leader>c :source ~/.vim/mmatc.vim<CR>
normal gg
silent %d
silent r!cm1p1 | sed -f ~/mofix.sed
let l = line("$") + 1
execute "winsize 76 " . l
winpos 212 0
call Hideme()
setlocal guioptions-=r
setlocal nocursorline
set nonumber
setlocal noruler
set title
let ls = repeat(" ", 13)
let &titlestring = ls . strftime("%Y")
let dom = strftime("%d")
let dom1 = strpart(dom, 0 , 1)
if dom1 == "0"
    let @/ = "(" . strpart(dom, 1, 1) . ")"
else
    let @/ = "(" . dom . ")"
endif
setlocal hlsearch
normal gg
silent file sacalh_unique_name
