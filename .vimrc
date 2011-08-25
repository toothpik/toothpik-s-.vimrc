" --- options 
set noautochdir
set   autoindent
set   autoread
set   backspace=indent,eol,start
set nobackup
set nocindent
set   clipboard=autoselect,exclude:cons
set   cmdheight=1
set   comments-=fb:-
set   confirm
set   cryptmethod=blowfish
set nocursorcolumn
set   cursorline
set nodigraph
set   directory=~/.vim-tmp//,~/tmp//,/var/tmp//,/tmp//
set   display=lastline
set noerrorbells
set   expandtab
set   formatoptions=tcq
set   guioptions-=L
set   guioptions-=m
set   guioptions-=r
set   guioptions-=T
set   history=500
set   hlsearch
set nojoinspaces
set   keymodel=startsel,stopsel
set   keywordprg=:help
set   laststatus=0
set nolazyredraw
set   linebreak
set   listchars=eol:$,extends:»,precedes:«
set   mouse=ar
set   mousemodel=popup_setpos
set nonumber
set   nrformats-=octal
set   numberwidth=1
set   printoptions=header:0,number:n,syntax:n
set norelativenumber
set   ruler
set   scrollopt=ver,hor,jump
set   selection=exclusive
set   selectmode+=key
set   shiftwidth=4
set   shortmess=aoOtT
let   &showbreak = "» " 
set   showcmd
set   showmode
set noshowmatch
set   sidescroll=1
set nosmartindent
set   softtabstop=4
set   spellcapcheck=
set   spelllang=en_us
set nostartofline
set   swapfile
set   swapsync=
set   t_vb=
set   tabstop=8
set   textwidth=0
if has("gui_running")
    set title
else
    set notitle
endif
set   timeoutlen=1500
set   ttimeoutlen=100
set   viminfo=!,'20,<50,s10,h
set   virtualedit=block
set   visualbell
set   whichwrap=bhl<>~[]
set   wildcharm=<C-T>
set   wildmenu
set   wildmode=longest:full,full
set   winaltkeys=no
set   winminheight=0
set   wrap
set nowrapscan
"  ~~~~~~~~~~~~~~~~~~~~
filetype on
filetype indent on
filetype plugin on
syntax enable
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
" --- autocommands & plugin mappings
augroup vimrcgrp
    au!
    au BufWrite * if &ft == '' | filetype detect | endif
augroup END
"
"  some scripts i don't need:
let g:loaded_netrw = 1
let g:html_use_css = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_matchparen = 1
let g:loaded_rrhelper = 1
let g:loaded_tarPlugin = 1
let g:loaded_zipPlugin = 1

let g:no_mail_maps = 1
let g:no_plugin_maps = 1
let g:is_bash = 1
"
" --- special mappings and commands
" ------------------------------------------------------------
if !has("gui_running")
    colo biogoot2
endif
" ------------------------------------------------------------
imap <C-^> <ESC>:sp #<CR>
nmap <S-Insert> "+gP
vmap <S-Insert> "-d"+P
imap <S-Insert> <C-R>+
cmap <S-Insert> <C-R>+
imap <C-Insert> <C-O>"+y
vmap <C-Insert> "+y
vmap <S-Del> "+d
imap <C-Del> <C-O>daw
nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<cr>
"  scroll left and right when 'nowrap':
map <C-L> zl
map <C-H> zh
"  move text and rehighlight
vnoremap > ><CR>gv
vnoremap < <<CR>gv
nnoremap ; :
nmap . .`[
" ------------------------------------------------------------
command! BD b # | bd #
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! -nargs=+ Myhelp execute 'silent lhelpgrep <args>' | lopen 12
command! Xbit call SetExecutableBit()
"
" --- F-key mappings
nmap <silent> <F1> :call F1_formatter("70")<CR>
imap <silent> <F1> <C-O>:call F1_formatter("70")<CR>
nmap <S-F1> :call F1_toggle_width("70")<CR>
imap <S-F1> <C-O>:call F1_toggle_width("70")<CR>
" ------------------------------------------------------------
nmap <F2> o
imap <F2> <C-O>o
nmap <S-F2> g`"
imap <S-F2> <C-O>`"
" ------------------------------------------------------------
nmap <silent> <F3> :bdelete<CR>
imap <F3> <C-O>:set textwidth=70<CR>
nmap <S-F3> :qall<CR>
imap <S-F3> <ESC>:qall<CR>
imap <M-F3> <ESC><M-F3>
" ------------------------------------------------------------
map <F4> :call OpenWhat()<CR>
imap <F4> <C-O>J
nmap <S-F4> :call TestFO()<CR>
imap <S-F4> <C-O>:verbose set fo?<CR>
" ------------------------------------------------------------
map <silent> <F5> :nohlsearch<CR>
imap <silent> <F5> <C-R>=InsertEmDash()<CR>
cmap <F5> <c-r>=strftime("%Y%m%d")<CR>
nmap <S-F5> :call CountBlankLinesAtEnd()<CR>
imap <S-F5> <ESC>:call CountBlankLinesAtEnd()<CR>
nmap <silent> <M-F5> :call FirstBlankAtEnd()<CR>
imap <silent> <M-F5> <C-O>:call FirstBlankAtEnd()<CR>
" ------------------------------------------------------------
nmap <silent> <F6> :bnext<CR>
imap <silent> <F6> <ESC>:bnext<CR>
nmap <silent> <S-F6> :bprevious<CR>
imap <silent> <S-F6> <ESC>:bprevious<CR>
nmap <M-F6> :ls<CR>:b
" ------------------------------------------------------------
nmap <silent> <F7> :set spell!<CR>
imap <silent> <F7> <ESC>:set spell!<CR>
nmap <silent> <S-F7> :call Acdmo()<CR>
imap <silent> <S-F7> <ESC>:call Acdmo()<CR>
" ------------------------------------------------------------
nmap <silent> <F8> :m+<CR>
imap <silent> <F8> <ESC>:m+<CR>a
nmap <silent> <S-F8> :m-2<CR>
imap <silent> <S-F8> <ESC>:m-2<CR>a
nmap <silent> <M-F8> yyp
imap <silent> <M-F8> <ESC>yyp$a
" ------------------------------------------------------------
nmap <silent> <F9> :call NumberToggle()<CR>
imap <silent> <F9> <C-O>:call NumberToggle()<CR>
nmap <silent> <S-F9> :set wrap!<CR>
imap <silent> <S-F9> <C-O>:set wrap!<CR>
nmap <silent> <M-F9> :set list!<CR>
imap <silent> <M-F9> <C-O>:set list!<CR>
" ------------------------------------------------------------
nmap <C-J> <C-W>wj<C-W>w
nmap <C-K> <C-W>wk<C-W>w
nmap <F10> <C-E>
imap <F10> <C-O><C-E>
nmap <silent> <S-F10> :set cursorline!<CR>
imap <silent> <S-F10> <C-O>:set cursorline!<CR>
nmap <silent> <M-F10> :set cursorcolumn!<CR>
imap <silent> <M-F10> <C-O>:set cursorcolumn!<CR>
nmap <silent> <C-F10> <C-W>w<C-E><C-W>w
imap <silent> <C-F10> <ESC><C-W>w<C-E><C-W>wa
" ------------------------------------------------------------
nmap <F11> <C-Y>
imap <F11> <C-O><C-Y>
nmap <silent> <S-F11> :call MyExplore('')<CR>
imap <silent> <S-F11> <ESC>:call MyExplore('')<CR>
nmap <silent> <M-F11> :call MyExplore('t')<CR>
imap <silent> <M-F11> <ESC>:call MyExplore('t')<CR>
nmap <silent> <C-F11> <C-W>w<C-Y><C-W>w
" ------------------------------------------------------------
nmap <silent> <F12> :update<CR>
imap <silent> <F12> <ESC>:update<CR>
vmap <silent> <F12> <C-C>:update<CR>
"  do not try to map S-F12 -- vim never sees it
nmap <C-F12> :echo 'yes im mappable'<CR>
"
" --- insert mode abbreviations
iabbrev <silent> dd1 <c-r>=repeat('-', 10)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd2 <c-r>=repeat('-', 20)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd3 <c-r>=repeat('-', 30)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd4 <c-r>=repeat('-', 40)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd5 <c-r>=repeat('-', 50)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd6 <c-r>=repeat('-', 60)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd7 <c-r>=repeat('-', 70)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd8 <c-r>=repeat('-', 80)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd9 <c-r>=repeat('-', 90)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd10 <c-r>=repeat('-', 100)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd11 <c-r>=repeat('-', 110)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~1 <c-r>=repeat('~', 10)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~2 <c-r>=repeat('~', 20)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~3 <c-r>=repeat('~', 30)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~4 <c-r>=repeat('~', 40)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~5 <c-r>=repeat('~', 50)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~6 <c-r>=repeat('~', 60)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~7 <c-r>=repeat('~', 70)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~8 <c-r>=repeat('~', 80)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~9 <c-r>=repeat('~', 90)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee1 <c-r>=repeat('=', 10)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee2 <c-r>=repeat('=', 20)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee3 <c-r>=repeat('=', 30)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee4 <c-r>=repeat('=', 40)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee5 <c-r>=repeat('=', 50)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee6 <c-r>=repeat('=', 60)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee7 <c-r>=repeat('=', 70)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee8 <c-r>=repeat('=', 80)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee9 <c-r>=repeat('=', 90)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> lll <c-r>=repeat('_', 60)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul1 <c-r>=Scaleme(10)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul2 <c-r>=Scaleme(20)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul3 <c-r>=Scaleme(30)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul4 <c-r>=Scaleme(40)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul5 <c-r>=Scaleme(50)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul6 <c-r>=Scaleme(60)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul7 <c-r>=Scaleme(70)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul8 <c-r>=Scaleme(80)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul9 <c-r>=Scaleme(90)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul10 <c-r>=Scaleme(100)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul11 <c-r>=Scaleme(110)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul12 <c-r>=Scaleme(120)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul13 <c-r>=Scaleme(130)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul14 <c-r>=Scaleme(140)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul15 <c-r>=Scaleme(150)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> bsk <c-r>=strftime("%Y-%b-%2d  %H:%M  %a")<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> bskk <c-r>=LongBlogDate()<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dda <c-r>=strftime("%a")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ddd <c-r>=strftime("%d %b %Y  %H:%M  %a")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dddd <c-r>=strftime("%Y-%m-%d  %H:%M")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dddf <c-r>=strftime("%Y-%b-%d")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dddl <c-r>=Longdate()<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dddn <c-r>=strftime("%Y-%b-%d %H:%M %a")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dddof <c-r>=strftime("%B %d, %Y  %A")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dddt  <c-r>=strftime("%m/%d/%Y")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dded <c-r>=Mydatestamp()<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ddsd <c-r>=strftime("%b %_d")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ddsdd <c-r>=strftime("%b %_d  %a")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dds <c-r>=strftime("%Y-%b-%d %H:%M")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dds2 <c-r>=strftime("%Y-%b-%d  %H:%M")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ddss <c-r>=strftime("%Y-%b-%d  %H:%M  %a")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> lddds <c-r>=strftime("%Y-%b-%2d  %H:%M")<CR><C-R>=Eatchar('\s')<CR>
iabbrev <silent> tt <c-r>=strftime("%H:%M")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ttt <c-r>=strftime("%H:%M:%S")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibs #!/bin/bash<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibp #!/usr/bin/python<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibpp #!/usr/bin/perl<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibt #!/usr/bin/tclsh<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibe #!/usr/bin/expect<c-r>=Eatchar('\s')<cr>
cabbrev asdf s/[0-2][0-9]:[0-5][0-9]/__:__/
"
" --- leader commands
let mapleader = ','
nnoremap <Leader>a :%s/\s\+$//e<CR>
"nnoremap <silent><Leader>b
"nnoremap <silent><Leader>c
nnoremap <Leader>cd :call CdCurBuf()<CR>
"nnoremap <silent><Leader>d
nnoremap <Leader>dd :call ClearBuffers()<CR>
nnoremap <Leader>e :e ~/.vimrc<CR>
nnoremap <silent> <Learder>f :call FindSunDate()<CR>
nnoremap <silent> <Leader>ff :call FirstBlankAtEnd()<CR>
nnoremap <Leader>g :e ~/.gvimrc<CR>
nnoremap <Leader>gg :source ~/.gvimrc<CR>
nnoremap <Leader>h :source ~/.vim/reading_help.vim<CR>
nnoremap <Leader>hh :call HelpgrepScrollers()<CR>
nnoremap <Leader>hhh :call Hideme()<CR>
nnoremap <Leader>i :call Maikallfiles()<CR>
nnoremap <Leader>it :call MaikallfilesT()<CR>
nnoremap <Leader>j :call FindPointer()<CR>
nnoremap <silent> <Leader>jj :call MovePointerDown()<CR>
nnoremap <Leader>k :s/$/  <---/<CR>
nnoremap <silent> <Leader>kk :call MovePointerUp()<CR>
nnoremap <Leader>l :source ~/.vimrc<CR>
nnoremap <Leader>m :source ~/.vim/mail.vim<CR>
nnoremap <Leader>n :source ~/.vim/colorstepper.vim<CR>
nnoremap <Leader>ns :call Step_color()<CR>
nnoremap <silent> <Leader>o :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>
nnoremap <silent> <Leader>oo :call UnsetFolds()<CR>
nnoremap <Leader>p :call Step_color_back()<CR>
nnoremap <Leader>q :call EditTry("~/.vim/leaders")<CR>
nnoremap <silent> <Leader>r :silent set ruler!<CR>
nnoremap <silent> <Leader>rr :silent call ToggleScrollbar()<CR>
nnoremap <silent> <Leader>s :windo set scrollbind!<CR>
nnoremap <silent> <Leader>t :call ToggleExpandtab()<CR>
nnoremap <Leader>u :call FileTime()<CR>
nnoremap <Leader>uh :call Unhideme()<CR>
nnoremap <silent> <Leader>v :set cursorcolumn!<CR>
nnoremap <silent> <Leader>vv :source ~/.vim/plan.vim<CR>
"nnoremap <Leader>w
"nnoremap <Leader>x
nnoremap <Leader>y :source ~/.vim/i_ctr.vim<CR>
nnoremap <Leader>yy :e ~/.vim/i_ctr.vim<CR>
nnoremap <Leader>z :source ~/.vim/html_lets<CR>
nnoremap <Leader>zz :edit ~/.vim/html_lets<CR>
"
" --- functions 
function! Acdmo()
    read! ~/py/currmo 38
    let im = strftime("%H:%M")
    let ta = append(line("."), "")
    let ta = append(line("."), im)
    let ta = append(line("."), "")
    normal 3j
    startinsert
endfunction
" ------------------------------------------------------------
"  interesting B command
"-tim chase
function! Bufferadd(really, ...)
    if len(a:000)
        for globspec in a:000
            let l:files = split(glob(globspec), "\n")
            for fname in l:files
                exec 'badd'.(a:really).' '.(fname)
            endfor
        endfor
    else
        exec 'badd'.(a:really)
    endif
endfunction
"
command! -nargs=* -complete=file -bang B call Bufferadd("<bang>", <f-args>)
" ------------------------------------------------------------
function! CdCurBuf()
    let cwd = getcwd()
    let cth = expand("%:p:h")
    if cwd ==# cth
        echo 'cwd already ' cth
    else
        execute 'cd ' . cth
        echo 'cwd changed to ' cth
    endif
endfunction
" ------------------------------------------------------------
function! CdMaik(dir)
    execute 'cd ' . a:dir
    call Maikallfiles()
endfunction
" ------------------------------------------------------------
function! ClearBuffers()
    let i = 1
    let dc = 0
    while i <= bufnr("$")
        if buflisted(i) && i != bufnr("")
            exe "bdelete" i
            let dc += 1
        endif
        let i += 1
    endwhile
    echo 'buffers deleted:' dc
endfunction
" ------------------------------------------------------------
function! CountBlankLinesAtEnd()
    let s:bc = NumberBlankLinesAtEnd()
    let s:tn = expand("%")
    if s:tn == ""
        let s:tn = "[No Name]"
    endif
    if s:bc == 1
        let s:ps = ''
    else
        let s:ps = 's'
    endif
    echo printf("%s  has  %d  blank line%s at the end", s:tn, s:bc, s:ps)
endfunction
" ------------------------------------------------------------
"  from :h iabbreviation
function! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction
" ------------------------------------------------------------
function! EditTry(what)
    if &modified
        execute "split " a:what
    else
        execute "edit " a:what
    endif
endfunction
" ------------------------------------------------------------
function! F1_formatter(cp)
    let s:save_tw = &textwidth
    let &textwidth = a:cp
    silent normal gq}
    let &textwidth = s:save_tw
endfunction
" ------------------------------------------------------------
function! F1_toggle_width(w)
    if &textwidth == 0
        let &textwidth = a:w
    else
        let &textwidth = 0
    endif
    set textwidth?
endfunction
" ------------------------------------------------------------
function! FileTime()
    let s:fn = expand("%")
    let s:islink = getftype(s:fn)
    let s:isexe = getfperm(s:fn)
    if s:islink == 'link'
        let s:fno = s:fn
        let s:fnl = resolve(s:fn)
        let s:fnf = s:fno . ' links to ' . s:fnl
    else
        let s:fnf = s:fn
    endif
    let s:ft = getftime(s:fn)
    echo s:isexe s:fnf strftime("%Y-%b-%d %H:%M:%S", s:ft)
endfunction
" ------------------------------------------------------------
function! FindPointer()
    let save_l = @/
    0
    normal gg
    let @/ = '  <---$'
    try
        normal n
    catch
        echo 'no pointer found'
        normal 
    endtry
    let @/ = save_l
endfunction
" ------------------------------------------------------------
function! FindSunDate()
    normal gg
    let fd = strftime("%Y-%b-%d")
    setlocal ignorecase
    let @/ = fd
    try
        silent normal n
        normal zz
        normal 0
    catch
    endtry
endfunction
" ------------------------------------------------------------
function! FirstBlankAtEnd()
    let go = NumberBlankLinesAtEnd() - 1
    normal G
    if (go > 0)
        execute 'normal ' go . 'k'
    endif
endfunction
" ------------------------------------------------------------
function! HelpgrepScrollers()
    silent! nmap <F6> :silent cnext<CR>
    silent! nmap <S-F6> :silent cprev<CR>
    echo 'helpgrep scrollers :cn and :cp added to F6 and S-F6'
endfunction
" ------------------------------------------------------------
function! Hideme()
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide
endfunction
" ------------------------------------------------------------
function! InsertEmDash()
    return ' ― '
endfunction
" ------------------------------------------------------------
function! LastNonBlank()
    normal G
    let ll = len(getline("."))
    while ll == 0
        normal k
        let ll = len(getline("."))
    endwhile
endfunction
" ------------------------------------------------------------
function! LongBlogDate()
"iabbrev <silent> bskk <c-r>=strftime("%Y %B %_d  %A  %l:%M%P %Z")<CR><c-r>=Eatchar('\s')<cr>
    let d1 = strftime("%Y %B %_d")
    let d1s = substitute(d1, "  ", " ", "")
    let d2 = strftime("%A")
    let d3 = strftime("%l:%M%P %Z")
    let d3s = substitute(d3, " ", "", "^")
    return d1s . "  " . d2 . "  " . d3s
endfunction
" ------------------------------------------------------------
function! Longdate()
    let d1 = strftime("%A, %e %B %Y, %l:%M%P")
    let d2 = substitute(d1, "  ", " ", 'g')
    return d2
endfunction
" ------------------------------------------------------------
"  make allfiles
function! Maikallfiles()
    let l:tst_name = expand("%")
    if l:tst_name != ".allfiles"
        call EditTry(".allfiles")
    endif
    call Hideme()
    silent %d
    0r!pwd
    normal o
    silent r!ls -algG --group-directories-first
    silent g/^total/d
    normal gg
endfunction

"  make allfiles, sorted on time
function! MaikallfilesT()
    let l:tst_name = expand("%")
    if l:tst_name != ".allfiles"
        if &modified
            split .allfiles
        else
            edit .allfiles
        endif
    endif
    call Hideme()
    silent %d
    0r!pwd
    normal o
    silent execute 'r!ls -algGt'
    silent g/^total/d
    normal gg
endfunction
" ------------------------------------------------------------
function! MovePointerDown()
    let s:save_l = @/
    let @/ = "  <---$"
    normal 0
    let s:did_new = 0
    try
        silent normal n
        s/  <---$//
    catch
        try
            silent normal N
            s/  <---$//
        catch
            let s:did_new = 1
        endtry
    endtry
    normal j
    if len(getline('.')) > 0
        s/$/  <---/
    endif
    let @/ = s:save_l
endfunction
" ------------------------------------------------------------
function! MovePointerUp()
    let s:save_l = @/
    let @/ = "  <---$"
    normal 0
    let s:did_new = 0
    try
        silent normal n
        s/  <---$//
    catch
        try
            silent normal N
            s/  <---$//
        catch
            let s:did_new = 1
        endtry
    endtry
    normal k
    if len(getline('.')) > 0
        s/$/  <---/
    endif
    let @/ = s:save_l
endfunction
" ------------------------------------------------------------
function! Mydatestamp()
    let td = strftime("%d")
    if td < 10
        let ym = strftime("%Y-%b")
        let td = td + 0
        let hm = strftime("%H:%M")
        return ym . "-" . td . "  " . hm
    else
        return strftime("%Y-%b-%d %H:%M")
    endif
endfunction
" ------------------------------------------------------------
function! MyExplore(s)
    if a:s == "t"
        call MyExploreT()
        return
    endif
    call CdCurBuf()
    let wh = ' ' . escape(expand("%:t"), '.\') . '$'
    call Maikallfiles()
    call search(wh)
    normal zz
endfunction
" ------------------------------------------------------------
function! MyExploreT()
    call MaikallfilesT()
endfunction
" ------------------------------------------------------------
function! NumberBlankLinesAtEnd()
    let s:bc = 0
    let s:lp = line("$")
    while s:lp > 0
        let s:tl = strlen(getline(s:lp))
        if (s:tl > 0)
            let s:lp = 0
        else
            let s:bc = s:bc + 1
            let s:lp = s:lp - 1
        endif
    endwhile
    return s:bc
endfunction
" ------------------------------------------------------------
function! NumberToggle()
    if exists("&rnu")
        if &number
            setlocal relativenumber
        else
            if &relativenumber
                setlocal norelativenumber
            else
                setlocal number
            endif
        endif
    else
        if &number
            setlocal nonumber
        else
            setlocal number
        endif
    endif
endfunction
" ------------------------------------------------------------
function! OpenWhat()
    let testme = expand("<cfile>")
    if testme =~ '^\~'
        let testme = $HOME . substitute(testme, '^\~', "", "")
    endif
    if isdirectory(testme)
        call CdMaik(testme)
    else
        execute 'e ' . testme
    endif
endfunction
" ------------------------------------------------------------
function! Scaleme(w)
    let c = 0
    let str = ""
    while c < a:w
        let c += 1
        if c % 5 == 0
            if c % 10 == 0
                let a = (c / 10)[-1:]
            else
                let a = "+"
            endif
        else
            let a = "."
        endif
        let str = str . a
    endwhile
    return str
endfunction
" ------------------------------------------------------------
function! SetExecutableBit()
    if &modified
        write
    endif
    call system("chmod 754 " . expand('%'))
endfunction
" ------------------------------------------------------------
function! TestFO()
    if &fo == "tcq"
        echo '&fo == tcq'
    else
        echo 'fo not tcq'
        verbose set fo?
    endif
endfunction
" ------------------------------------------------------------
function! ToggleExpandtab()
    if &expandtab
        echo "noexpandtab"
        setlocal noexpandtab
        setlocal softtabstop=8
    else
        echo "expandtab"
        setlocal expandtab
        setlocal softtabstop=4
    endif
endfunction
" ------------------------------------------------------------
function! ToggleScrollbar()
    if &guioptions =~ 'r'
        set guioptions-=r
    else
        set guioptions+=r
    endif
endfunction
" ------------------------------------------------------------
function! Unhideme()
    setlocal swapfile
    setlocal buftype=""
    setlocal bufhidden=""
endfunction
" ------------------------------------------------------------
function! UnsetFolds()
    setlocal foldexpr=0
    setlocal foldcolumn=0
endfunction
" ------------------------------------------------------------
"
