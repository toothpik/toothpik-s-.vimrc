"  find current date [in tocal]
"
function! Fcd() 
    1
    call search("^ " . strftime("%Y"))
    call search("^   " . strftime("%b %_d"))
    let @/ = strftime("%b %_d  %a")
    normal zz
    normal 0
    let s:line_count = &lines
    if s:line_count >= 35
        let s:sa = 13
    elseif s:line_count >= 20
        let s:sa = 7
    elseif 17 <= s:line_count && s:line_count <= 19
        let s:sa = 5
    elseif 14 <= s:line_count && s:line_count <= 16
        let s:sa = 4
    elseif 10 <= s:line_count && s:line_count <= 13
        let s:sa = 2
    else
        let s:sa = 1
    endif
    exe "normal" s:sa . "\<C-E>"
    mark h
endfunction
