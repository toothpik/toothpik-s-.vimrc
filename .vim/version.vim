"  setup for edit of ~/.vim/version.log - used by ~/bin/gvl and vvl
"
let localleader = ','
nmap <silent> <Leader>c :call StampWithVer()<CR>
nmap <silent> <Leader>d :call CheckCompile()<CR>
nmap <silent> <Leader>ev :call EditTry("~/.vim/version.vim")<CR>
nmap <silent> <Leader>l :source ~/.vim/version.vim<CR>

function! StampWithVer() 
    let save_v = @v
    redir @v
    silent! version
    redir END
    let va = split(@v, '\n')
    let @v = save_v
    let p1 = stridx(va[0], 'Vi IMproved')
    "  major version
    let v1 = va[0][p1 + 12 : p1 + 15]
    let v2 = substitute(v1, "\ $", "", "")
    "   v2  gets a '7.4a'
    "  compile date
    let p2 = stridx(va[0], 'compiled')
    let m1 = va[0][p2 + 9 : p2 + 11]
    "   m1  gets a 'Mar'
    let d1 = va[0][p2 + 13 : p2 + 14]
    "   d1  gets a '16'
    if d1[0] == ' '
        let d1 = '0' . d1[1]
    endif
    let y1 = va[0][p2 + 16 : p2 + 19]
    "   y1  gets a '2012'
    let t1 = va[0][p2 + 21 : p2 + 25]
    "   t1  gets a '20:28'
    "  minor version
    let v3 = split(va[1], '-')[1]
    let lv3 = len(v3)
    if lv3 == 1
        let v4 = '00' . v3
    elseif lv3 == 2
        let v4 = '0' . v3
    else
        let v4 = v3
    endif
    let fs = y1 . '-' . m1 . '-' . d1 . ' ' . t1 . '  ' . v2 . '.' . v4
    let ta = append(line('$'), fs)
    normal G
endfunction

function! CheckCompile()
"  this function fails when there is no patch level line, ie for the day or so
"  7.4 is current before 7.4.0001 comes out
    let save_v = @v
    redir @v
    silent! version
    redir END
    let va = split(@v, '\n')
    let @v = save_v
    if va[2] == 'Compiled by toothpik@home'
        echo 'obtained correct compiledby            CHECK'
    else
        echo 'third line of version is ' . va[2]
        echo 'should be "Compiled by toothpik@home"'
    endif
    if va[3] =~ '^Normal version with GTK2 GUI'
        echo 'obtained proper build (Normal w GTK2)  CHECK'
    else
        echo 'build line reads ' . va[3]
        echo 'should be "Normal version with GTK2 GUI'
    endif
    "  lord have mercy
    "  the linebreaks in the [+/-]feature section will be in different places
    "  depending on the size of the window when 'version' is performed
    let got_arabic = 1
    let got_emacs_tags = 1
    let got_farsi = 1
    let got_rightleft = 1
"    let got_python = 0
    let hmr = len(va)
    let rp = 4
    while rp < hmr
        if va[rp] =~ '-arabic'
            echo 'arabic not compiled in                 CHECK'
            let got_arabic = 0
        endif
        if va[rp] =~ '-emacs_tags'
            echo 'emacs_tags not compiled in             CHECK'
            let got_emacs_tags = 0
        endif
        if va[rp] =~ '-farsi'
            echo 'farsi not compiled in                  CHECK'
            let got_farsi = 0
        endif
        if va[rp] =~ '-rightleft'
            echo 'rightleft not compiled in              CHECK'
            let got_rightleft = 0
        endif
"        if va[rp] =~ '+python'
"            echo 'python compiled in                     CHECK'
"            let got_python = 1
"        endif
        let rp = rp + 1
    endwhile
    if got_arabic
        echo 'arabic was included, not good'
    endif
    if got_emacs_tags
        echo 'emacs_tags was included, not good'
    endif
    if got_farsi
        echo 'farsi was included, not good'
    endif
    if got_rightleft
        echo 'rightleft was included, not good'
    endif
"    if ! got_python
"        echo 'python was not included, not good'
"    endif
endfunction
