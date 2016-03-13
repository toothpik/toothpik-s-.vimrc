"  find current date [in tocal]
"
function! Fcd() 
    1
    call search("^ " . strftime("%Y"))
    call search("^   " . strftime("%b %_d"))
    mark h
    let ccr = system("cm1p1v | nl -ba | fgrep '(' | awk '{print $1}'")
    let dl = line(".")
    let gh = dl - ccr - 2
    exe gh
"    normal zt
    'h
    normal 0
    let @/ = strftime("%b %_d  %a")
endfunction
