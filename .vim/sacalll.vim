"  stand alone vertical calendar minus 1 plus 1
"  triggered by ~/bin/sv
"  a way to have a (longer still) current calendar on any desktop 
"  without worrying about different sessions editing the same file
"
let mapleader = ','
nnoremap <silent><Leader>c :call MakeMeVertical()<CR>
nnoremap <silent><Leader>ev :e ~/.vim/sacalll.vim<CR>
nnoremap <silent><Leader>s :source ~/.vim/sacalll.vim<CR>

function! MakeMeVertical()

    call Hideme()
    silent %d
    silent r!~/bin/cm1p1v
    set guioptions-=r
    set nocursorline
    if &number
        setlocal nonumber
    endif
    if &relativenumber
        setlocal norelativenumber
    endif
    set noruler
    let dt = strftime("%d")
    if dt < '10'
        let dt2 = "(" . strpart(dt, 1) . ")"
    else
        let dt2 = "(" . dt . ")"
    endif
    let @/ = dt2
    let bl = line('$') + 1
    execute "set lines=" . bl
    set columns=22
    normal gg
    silent file cal

endfunction
