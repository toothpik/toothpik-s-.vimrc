"  used by glaun for editing ~/txt/laundry.log

nmap <buffer> <Leader>ev :e ~/.vim/laundry.vim<CR>
nmap <buffer> <Leader>l :source ~/.vim/laundry.vim<CR>

let mapleader = ','
nnoremap <silent> <Leader>c :call AddNewLaundryEntry("colored")<CR>
nnoremap <silent> <Leader>s :call AddNewLaundryEntry("sheets")<CR>
nnoremap <silent> <Leader>t :call AddNewLaundryEntry("towels")<CR>
nnoremap <silent> <Leader>w :call AddNewLaundryEntry("white")<CR>

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
