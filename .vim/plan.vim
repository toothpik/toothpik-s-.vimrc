if has('gui_running')
    winsize 92 29
    winpos 119 185
endif
let mapleader = ','
nmap <buffer> <Leader>b :call BalCol()<CR>
nmap <buffer> <Leader>c :call GoLastClear()<CR>
nmap <buffer> <Leader>cc :call ToggleColorColumn()<CR>
nmap <buffer> <Leader>d :call EditTry("~/txt/plan_core")<CR>
nmap <buffer> <Leader>dd :call EditTry("~/txt/plan_core_other")<CR>
nmap <buffer> <Leader>eb :e ~/tcl/planbal<CR>
nmap <buffer> <Leader>ef :e ~/tcl/planfood<CR>
nmap <buffer> <Leader>er :e ~/tcl/planrecon<CR>
nmap <buffer> <Leader>ev :e ~/.vim/plan.vim<CR>
nmap <buffer> <Leader>f :call AdjustFoodBudget()<CR>
nmap <buffer> <Leader>l :source ~/.vim/plan.vim<CR>
nmap <buffer> <Leader>lu :call system("lubk")<CR>
nmap <buffer> <Leader>n :e ~/txt/plan_notes\|normal G<CR>
nmap <buffer> <Leader>nn :split ~/txt/plan_2010\|source ~/.vim/plan.vim\|call search('_December 2010')<CR>
"nmap <buffer> <Leader>o :e ~/txt/plan_over_under<CR>
nmap <buffer> <Leader>p :call SyncWNextYear()<CR>
nmap <buffer> <Leader>pp :call EditTry("~/txt/plan_2010")<CR>
nmap <buffer> <Leader>r :call Reconcile()<CR>
nmap <buffer> <Leader>s :call SyncWLastYear()<CR>
nmap <buffer> <Leader>ss :call SyncJanuarys()<CR>
nmap <buffer> <Leader>uu :call GoFirstUnclear()<CR>
nmap <buffer> <Leader>u :e ~/txt/usbank<CR>
nmap <buffer> <Leader>x :call GoLastX()<CR>
" ------------------------------------------------------------
iabbr <buffer> dd <c-r>=Fivedate()<CR><c-r>=Eatchar('\s')<CR>
" ------------------------------------------------------------
let @a = "atm - gladstone"
let @s = "Sunfresh #107"
" ------------------------------------------------------------
set cursorline
" ------------------------------------------------------------
function! AdjustFoodBudget()
    let sv = winsaveview()
    call GoLastX()
    call search('\%>10c\%<12c_', 'b')
    let startmonth = line(".")
    call search('\%>10c\%<41cfood & atm')
    let endmonth = line('.')
    execute 'silent ' . startmonth . "," . endmonth . "!~/tcl/planfood"
    call BalCol()
    call winrestview(sv)
endfunction

function! BalCol()
    let sv = winsaveview()
    silent %!~/tcl/planbal
    call winrestview(sv)
endfunction

function! Fivedate()
    let md = strftime("%m/%d")
    let mds = substitute(md, "\\<0", "", "g")
    return mds
endfunction

function! GoFirstUnclear()
    normal gg
    call search("\\%>44c\\%<47c\ \ ")
    normal zz
endfunction

function! GoLastClear()
    normal G
    call search("\\%>45c\\%<47c[0-9]", 'b')
    normal zz
    normal 0
endfunction

function! GoLastX()
    normal G
    call search("\\%>59c\\%<61cx", 'b')
    normal zz
    normal 0
endfunction

function! Reconcile()
    let sv = winsaveview()
    call GoFirstUnclear()
    let starthere = line(".")
    call GoLastClear()
    let dohere = line(".")
    if (starthere < dohere)
        execute starthere . "," . dohere . "!~/tcl/planrecon"
    else
        let starthere = dohere
        execute starthere . "," . dohere . "!~/tcl/planrecon"
    endif
    call winrestview(sv)
endfunction

function! SyncJanuarys()
    if filereadable(".t1")
        call system("rm .t1")
    endif
    if filereadable(".t2")
        call system("rm .t2")
    endif
    edit plan_2010
    normal gg
    call search("_January 2011")
    let starthere = line(".")
    call search("food & atm")
    let endhere = line(".")
    execute starthere","endhere"w .t1"
    edit plan_2011
    normal gg
    call search("_January 2011")
    let starthere = line(".")
    call search("food & atm")
    let endhere = line(".")
    execute starthere","endhere"w .t2"
    new
    call Hideme()
    r!diff .t1 .t2
endfunction

function! SyncWLastYear()
    let ty = expand("%")[5:8]     "  this year
    let py = ty - 1               "  previous year
    let pyn = "plan_" . py        "  previous year's name
    let cmd = "tail -2 " . pyn . " | head -1 | awk '{ print $NF }'"
    let lyeb = system(cmd)[:-2]        "  last year's ending balance
    let lolyeb = strlen(lyeb)     "  length of lyeb
                                  "  new first line
    let nfl = "          bbf                                _"
    let nsn = 24 - lolyeb         "  number spaces needed
    let tms = repeat(" ", nsn)    "  that many spaces
    let twnfl = nfl . tms . lyeb  "  the whole new first line
    call setline(1, twnfl)
    call BalCol()
endfunction

"  propagate forward
function! SyncWNextYear()
    let ty = expand("%")[5:8]     "  this year
    let ny = ty + 1               "  next year
    let nyn = "plan_" . ny        "  next year's name
    let ltg = line("$") - 1       "  line to get
    let ll = getline(ltg)         "  last line
    let lb = ll[60:70]            "  last balance
    let lbws = substitute(lb, " ", "", "ge")        "  lb wihtout spaces
    let lolbws = strlen(lbws)     "  length of lbws
    let nfl = "          bbf                                _"
    let nsn = 24 - lolbws         "  number of spaces needed
    let tms = repeat(" ", nsn)    "  that many spaces
    let twnfl = nfl . tms . lbws  "  the whole new first line
    execute "edit " . nyn
    call setline(1, twnfl)
    call BalCol()
endfunction

function! ToggleColorColumn()
    if ( &cc )
        setl cc=
    else
        setl cc=6,10,41,44,47,59,61,71,81,87
    endif
endfunction
