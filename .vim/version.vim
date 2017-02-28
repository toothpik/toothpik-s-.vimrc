"  setup for edit of ~/.vim/version.log - used by ~/bin/gvl and vvl
"
let localleader = ','
nmap <silent> <Leader>c :call StampWithVer()<CR>
nmap <silent> <Leader>d :call CheckCompile()<CR>
nmap <silent> <Leader>ev :call EditTry("~/.vim/version.vim")<CR>
nmap <silent> <Leader>l :source ~/.vim/version.vim<CR>

"  note to the wary:
"
"  if finding/fixing bugs here, they probably also need to be fixed in
"  ~/.vimrc, in the InsertCurrentVersionString() function -- I know,
"  code duplication, so sue me

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
        let v4 = '000' . v3
    elseif lv3 == 2
        let v4 = '00' . v3
    elseif lv3 == 3
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
    let va = split(execute("silent! version"), "\n")

    if va[2] == 'Compiled by toothpik@home'
        echo 'obtained correct compiledby            CHECK'
    else
        echo 'third line of version is ' . va[2]
        echo 'should be "Compiled by toothpik@home"'
    endif
    if va[3] =~ '^Big version with GTK2 GUI'
        echo 'obtained proper build (Big w GTK2)     CHECK'
    else
        echo 'build line reads ' . va[3]
        echo 'should be "Big version with GTK2 GUI'
    endif

    "  the linebreaks in the [+/-]feature section will be in different places
    "  depending on the size of the window when 'version' is performed
    let got_perl = 0
    let got_python = 0
    let got_python3 = 0
    let got_tcl = 0
    let got_arabic = 1
    let got_emacs_tags = 1
    let got_farsi = 1
    let got_rightleft = 1
    let hmr = len(va)
    let rp = 4
    while rp < hmr
        if va[rp] =~ '+perl'
            let got_perl = 1
        endif
        if va[rp] =~ '+python3'
            let got_python3 = 1
        endif
        if va[rp] =~ '+python\>'
            let got_python = 1
        endif
        if va[rp] =~ '+tcl'
            let got_tcl = 1
        endif
        if va[rp] =~ '-arabic'
            let got_arabic = 0
        endif
        if va[rp] =~ '-emacs_tags'
            let got_emacs_tags = 0
        endif
        if va[rp] =~ '-farsi'
            let got_farsi = 0
        endif
        if va[rp] =~ '-rightleft'
            let got_rightleft = 0
        endif
        let rp = rp + 1
    endwhile

    if got_perl
        echo 'perl compiled in, not good  <---<<'
    else
        echo 'perl not included                      CHECK'
    endif

    if got_python
        echo 'python compiled in, not good  <---<<'
    else
        echo 'python not included                    CHECK'
    endif

    if got_python3
        echo 'python3 compiled in, not good  <---<<'
    else
        echo 'python3 not included                   CHECK'
    endif

    if got_tcl
        echo 'tcl compiled in, not good  <---<<'
    else
        echo 'tcl not included                       CHECK'
    endif

    if got_arabic
        echo 'arabic included, not good'
    else
        echo 'arabic not included                    CHECK'
    endif

    if got_emacs_tags
        echo 'emacs_tags included, not good'
    else
        echo 'emacs_tags not included                CHECK'
    endif

    if got_farsi
        echo 'farsi included, not good'
    else
        echo 'farsi not included                     CHECK'
    endif

    if got_rightleft
        echo 'rightleft included, not good'
    else
        echo 'rightleft not included                 CHECK'
    endif

endfunction
