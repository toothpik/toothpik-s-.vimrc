"  used by glaun for editing ~/txt/laundry.log

nmap <buffer> <Leader>ev :e ~/.vim/laundry.vim<CR>

let mapleader = ','
nnoremap <Leader>c :call AddNewLaundryEntry("colored")<CR>
nnoremap <Leader>s :call AddNewLaundryEntry("sheets")<CR>
nnoremap <Leader>w :call AddNewLaundryEntry("white")<CR>

function! AddNewLaundryEntry(strtadd)
    let ds = strftime("    %b %e  %a  ")
    let ll = getline('$')
    let llt = strpart(ll, 0, 17)
    if ds == llt
        "  we need a combo entry
        let nl = ll . ', ' . a:strtadd
        call setline('$', nl)
    else
        "  we need a new entry
        let newentry = ds . a:strtadd
        call append(line('$'), newentry)
        normal G
    endif
endfunction
