"  setup for edit of plans - used by gp and vp to name a few
"  ~/txt/plan_readme and ~/bin/minst describe creation of new plans

setl varsofttabstop=10,31,10

let mapleader = ','
"  WHEN ADDING MAPS, ADD THEM TO DisplayLeaders() TOO
"  the following remap of Tab is not yet ready for prime time
imap <silent> <buffer> <Tab> <C-O>:call Mytab()<CR>
nmap <silent> <buffer> <Leader>a :call OpenLastYear()\|source ~/.vim/plan.vim<CR>
nmap <silent> <buffer> <Leader>b :call BalCol()<CR>
nmap <silent> <buffer> <Leader>c :call GoLastClear()<CR>
nmap <silent> <buffer> <Leader>d :call EditTry("~/txt/plan_core")\|set noexpandtab<CR>
nmap <silent> <buffer> <Leader>dd :call EditTry("~/txt/plan_core_other")<CR>
nmap <silent> <buffer> <Leader>ec :e ~/bin/plannew<CR>
nmap <silent> <buffer> <Leader>es :source ~/.vim/plan.vim<CR>
nmap <silent> <buffer> <Leader>ev :e ~/.vim/plan.vim<CR>
silent! unmap ,ff
silent! unmap ,fff
nmap <silent> <buffer> <Leader>f :call AdjustFoodBudget()<CR>
silent! unmap ,gg
nmap <silent> <buffer> <Leader>g :call OpenNextYear()\|source ~/.vim/plan.vim<CR>
nmap <silent> <buffer> <Leader>h :call AdjustHalliganBudget()<CR>
nmap <silent> <buffer> <Leader>l :call EditTry("~/txt/plan_log")<CR>
nmap <silent> <buffer> <Leader>lu :call system("lubk")<CR>
nmap <silent> <buffer> <Leader>n :e ~/txt/plan_notes\|normal G<CR>
nmap <silent> <buffer> <Leader>p :call SyncNextYear()<CR>
nmap <silent> <buffer> <Leader>q :call DisplayLeaders()<CR>
nmap <silent> <buffer> <Leader>r :silent call Reconcile()<CR>
nmap <silent> <buffer> <Leader>rr :call FixReconcileWLastYear()<CR>
silent! unmap ,ss
nmap <silent> <buffer> <Leader>s :call SyncWLastYear()<CR>
silent! unmap <Leader>tt
nmap <silent> <buffer> <Leader>t :call ToggleColorColumn()<CR>
nmap <silent> <buffer> <Leader>u :e ~/txt/usbank<CR>
nmap <silent> <buffer> <Leader>uu :call FixUsbankLog()<CR>
nmap <silent> <buffer> <Leader>uuu :call GoFirstUnclear()<CR>
nmap <silent> <buffer> <Leader>x :call GoLastX()<CR>
" ------------------------------------------------------------
iabbr <buffer> dd <c-r>=Fivedate()<CR><c-r>=Eatchar('\s')<CR>
" ------------------------------------------------------------
"  anything added here needs to be supported in ~/bin/mft also
let @a = "atm - gladstone"
let @c = "atm - clay county"
let @f = "festival foods"
let @h = "Halligan Lawn Services"
let @p = "Price Chopper #11"
let @s = "Sunfresh 4357"
let @v = "HyVee"
let @w = "Walmart Neighborhood Market"
" ------------------------------------------------------------
function! AdjustFoodBudget()
    let sv = winsaveview()
    let curline = line(".")
    call search('\%>10c\%<41cfood & atm')
    let endmonth = line('.')
"    execute 'silent ' . startmonth . "," . endmonth . "!~/tcl/planfood"
"    execute startmonth . "," . endmonth . "pyf ~/.vim/planfood.py"
    execute 'silent ' . curline . "," . endmonth . "!~/py/planfood"
    silent call BalCol()
    call winrestview(sv)
endfunction

function! AdjustHalliganBudget()
    let sv = winsaveview()
    let start = line('.')
    call search('\%>10c\%<41clawn mowing')
    let end = line('.')
    execute start . "," . end . "!~/py/halligan"
    silent call BalCol()
    call winrestview(sv)
endfunction

function! BalCol()
    let sv = winsaveview()
    %!~/py/planbal
    call winrestview(sv)
endfunction

function! DisplayLeaders()
echom 'a :call OpenLastYear()\|source ~/.vim/plan.vim'
echom 'b :call BalCol()'
echom 'c :call GoLastClear()'
echom 'd :call EditTry("~/txt/plan_core")'
echom 'dd :call EditTry("~/txt/plan_core_other")'
echom 'ec :e ~/bin/plannew'
echom 'es :source ~/.vim/plan.vim'
echom 'ev :e ~/.vim/plan.vim'
echom 'f :call AdjustFoodBudget()'
echom 'g :call OpenNextYear()\|source ~/.vim/plan.vim'
echom 'h :call AdjustHalliganBudget()'
echom 'l :call EditTry("~/txt/plan_log")'
echom 'lu :call system("lubk")'
echom 'n :e ~/txt/plan_notes\|normal G'
echom 'p :call SyncNextYear()'
echom 'q :call DisplayLeaders()'
echom 'r :call Reconcile()'
echom 'rr :call FixReconcileWLastYear()'
echom 's :call SyncWLastYear()'
echom 't :call ToggleColorColumn()'
echom 'u :e ~/txt/usbank'
echom 'uu :call FixUsbankLog()'
echom 'uuu :call GoFirstUnclear()'
echom 'x :call GoLastX()'
endfunction

function! Fivedate()
    let md = strftime("%m/%d")
    let mds = substitute(md, "\\<0", "", "g")
    return mds
endfunction

function! FixReconcileWLastYear()
    let ty = expand("%")[-4:]
    let prvyr = ty - 1
    call GoLastClear()
    execute ".!~/py/planfixrecon " . prvyr
endfunction

function! FixUsbankLog()
    normal mt
    call search('^---')
    normal mb
    't,'b!~/.vim/usbankadj
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
    $
    let botl = line('.')
    call search("\\%>59c\\%<61cx", 'b')
    let newl = line('.')
    if newl != botl
        normal zz
    else
        1
    endif
    normal 0
endfunction

function! Mytab()
    let poslist = getpos('.')
    let cc = poslist[2]                    "  current column
    let el = getline('.')                  "  existing line
    if cc < 11
        let aa = 11 - cc                   "  add amount
    elseif cc < 42
        let aa = 42 - cc
    elseif cc < 45
        let aa = 45 - cc
    elseif cc < 53
        let aa = 53 - cc
    elseif cc < 60
        let aa = 60 - cc
    else
        let aa = 4
    endif
    let strtoadd = repeat(' ', aa)
    call setline('.', el . strtoadd)
    call cursor(poslist[1], cc + aa)
endfunction

function! OpenLastYear()
    let ty = expand("%")[-4:]     "  this year
    let py = ty - 1               "  previous year
    let pyn = "plan_" . py        "  previous year's name
    call EditTry(pyn)
endfunction

function! OpenNextYear()
    let ty = expand("%")[-4:]     "  this year
    let ny = ty + 1               "  next year
    let nyn = "plan_" . ny        "  next year's name
    call EditTry(nyn)
endfunction

function! Reconcile()
    let sv = winsaveview()
    silent call BalCol()
    call GoFirstUnclear()
    let starthere = line(".")
    call GoLastClear()
    let dohere = line(".")
    if (starthere > dohere)
        let starthere = dohere
    endif
    "execute starthere . "," . dohere . "!~/tcl/planrecon"
    "execute starthere . "," . dohere . "pyf ~/.vim/prec.py"
    silent execute starthere . "," . dohere . "!~/py/planrecon"
    call winrestview(sv)
endfunction

function! SyncWLastYear()
    let ty = expand("%")[5:8]     "  this year
    let py = ty - 1               "  previous year
    let pyn = "plan_" . py        "  previous year's name
"  FIXME:  the following $NF returns the date on a reconciliation
"          entry if that line has a reconciliation -- need to use
"          cut or something similar to get the last balance
    let cmd = "tail -2 " . pyn . " | head -1 | awk '{ print $NF }'"
    let lyeb = system(cmd)[:-2]   "  last year's ending balance
    let lolyeb = strlen(lyeb)     "  length of lyeb
                                  "  new first line
    let nfl = "          bbf                                _"
    let nsn = 24 - lolyeb         "  number spaces needed
    let tms = repeat(" ", nsn)    "  that many spaces
    let twnfl = nfl . tms . lyeb  "  the whole new first line
    call setline(1, twnfl)
    call BalCol()
endfunction

"  propagate forward -- mapped to <Leader>p last time i looked
function! SyncNextYear()
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
    source ~/.vim/plan.vim
    call BalCol()
endfunction

function! ToggleColorColumn()
    if ( &cc )
        setl cc=
    else
        setl cc=6,10,41,44,47,58,61,71,82,88
    endif
endfunction
