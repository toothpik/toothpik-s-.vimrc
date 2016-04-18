"  --- filetype & syntax   {{{1
"  filetype must always preceed syntax statements:
filetype plugin indent on
syntax on
let g:readline_has_bash = 1
let g:is_bash = 1
"  the following prevents sh.vim from treating '.' as a keyword character
let g:sh_noisk = 1
" ----------------------------------------
" --- options    {{{1
set noautochdir
set   autoindent
set   autoread
set   backspace=indent,eol,start
set nobackup
set   backupdir=~/.vim-tmp
set   browsedir=buffer
set nocindent
set   clipboard=autoselect,exclude:cons,unnamedplus
set   cmdheight=1
set   comments-=fb:-
set   confirm
set   cryptmethod=blowfish2
set nocursorcolumn
set   cursorline
set nodigraph
set   directory=~/.vim-tmp//,~/tmp//,/var/tmp//,/tmp//
set   display=lastline
set noerrorbells
set   expandtab
set   formatoptions+=j
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
set noloadplugins
set nomore
set   mouse=ar
set   mousemodel=popup_setpos
set   number
set   nrformats-=octal
set   numberwidth=3
set   printoptions=header:0,number:n,syntax:n
set norelativenumber
set   ruler
set   scrollopt=ver,hor,jump
set   selection=exclusive
set   selectmode+=key
set noshiftround
set   shiftwidth=4
set   shortmess=aIoOtTcF
let   &showbreak = "» "
set   showcmd
set   showmode
set noshowmatch
set   showtabline=0
set   sidescroll=1
set nosmartindent
set   softtabstop=4
set   spellcapcheck=
set   spelllang=en_us
set nosplitbelow
set nostartofline
set   swapfile
set   swapsync=
set   t_vb=
set   tabstop=4
set   textwidth=0
if has('gui_running')
    set title
else
    set notitle
endif
set   timeoutlen=1500
set   ttimeoutlen=100
set noundofile
set   viminfo=!,'20,<50,s10,h
set   virtualedit=block
set   visualbell
set   whichwrap=bhl<>~[]
set   wildmenu
set   wildmode=longest:full,full
set   winaltkeys=no
set   winminheight=0
set   wrap
set nowrapscan
set   writebackup
" ----------------------------------------
" --- autocommands & plugin mappings     {{{1
augroup vimrcgrp
    au!
    au BufWrite * if &ft == '' | filetype detect | endif
augroup END
"
"  some scripts i don't need:
"  none of which get loaded with 'noloadplugins'
"let g:CSApprox_loaded = 1
"let g:html_use_css = 1
"let g:loaded_2html_plugin = 1
"let g:loaded_getscriptPlugin = 1
"let g:loaded_gzip = 1
"let g:loaded_matchparen = 1
"let g:loaded_netrw = 1
"let g:loaded_netrwPlugin = 1
"let g:netrw_banner = 0
"let g:netrw_liststyle = 1
"let g:loaded_vimballPlugin = 1
"let g:loaded_rrhelper = 1
"let g:loaded_tarPlugin = 1
"let g:loaded_zipPlugin = 1
"let g:no_plugin_maps = 1
"let g:no_mail_maps = 1
" ----------------------------------------
" --- special mappings     {{{1
if !has('gui_running')
    "colo biogoot
    colo default
endif
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprev<CR>
nnoremap - dd
imap <C-Del> <C-O>daw
nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzxzt' : 'zc')<cr>
"  scroll left and right when 'nowrap':
map <C-L> zl
map <C-H> zh
"  move text and rehighlight
vmap > >gv
vmap < <gv
nnoremap ; :
nmap . .`[
nmap g/ /\%#=P
" ----------------------------------------
" --- ex commands     {{{1
command! BD b # | bd #
command! -range D <line1>,<line2>d | norm <C-o>
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! -nargs=+ H execute "silent help <args>" | only
command! -nargs=+ Myhelp execute 'silent lhelpgrep <args>' | lopen 12
command! Xbit call SetExecutableBit()
" ----------------------------------------
" --- F-key mappings     {{{1
" ----------------------------------------
nnoremap <F1> :call F1_formatter("78")<CR>
inoremap <F1> <C-O>:call F1_formatter("78")<CR>
nnoremap <S-F1> :call F1_toggle_width("78")<CR>
inoremap <S-F1> <C-O>:call F1_toggle_width("78")<CR>
" ----------------------------------------
nnoremap <F2> o
inoremap <F2> <C-O>o
nnoremap <S-F2> O
inoremap <S-F2> <ESC>O
" ----------------------------------------
nnoremap <silent> <F3> :bdelete<CR>
inoremap <F3> <ESC>:bdelete<CR>
nnoremap <S-F3> :qall<CR>
inoremap <S-F3> <ESC>:qall<CR>
inoremap <M-F3> <ESC><M-F3>
" ----------------------------------------
nnoremap <F4> :call OpenWhat()<CR>
inoremap <F4> <C-O>J
nnoremap <S-F4> :call OpenEndWhat()<CR>
"nnoremap <S-F4> :call FixBlankLinesAtEnd('7')<CR>
inoremap <S-F4> <ESC>:call FixBlankLinesAtEnd('7')<CR>
" ----------------------------------------
nnoremap <silent> <F5> :call Fmt('78')<CR>
inoremap <silent> <F5> <C-O>:call Fmt('78')<CR>
cmap <F5> <c-r>=strftime("%Y%m%d")<CR>
nnoremap <S-F5> :call ZeroBlankLinesAtEnd()<CR>
inoremap <S-F5> <ESC>:call ZeroBlankLinesAtEnd()<CR>
nnoremap <M-F5> :set paste<CR>
inoremap <M-F5> <C-O>:set paste<CR>
" ----------------------------------------
nnoremap <silent> <F6> :call MyExplore('')<CR>
inoremap <silent> <F6> <ESC>:call MyExplore('')<CR>
nnoremap <S-F6> :ls<CR>:b
inoremap <S-F6> <ESC>:ls<CR>:b
nnoremap <M-F6> :set nopaste<CR>
inoremap <M-F6> <nop>
set pastetoggle=<M-F6>
" ----------------------------------------
nnoremap <silent> <F7> :set spell!<CR>
inoremap <silent> <F7> <ESC>:set spell!<CR>
nnoremap <silent> <S-F7> :call Acdmo()<CR>
inoremap <silent> <S-F7> <C-O>:call Acdmo()<CR>
" ----------------------------------------
nnoremap <silent> <F8> :m+<CR>
inoremap <silent> <F8> <ESC>:m+<CR>gi
vnoremap <silent> <F8> :m'>+<CR>
nnoremap <silent> <S-F8> :m-2<CR>
inoremap <silent> <S-F8> <ESC>:m-2<CR>gi
vnoremap <silent> <S-F8> :m-2<CR>
nnoremap <silent> <M-F8> yyp
inoremap <silent> <M-F8> <ESC>yyp$gi
" ----------------------------------------
nnoremap <silent> <F9> :call NumberToggle()<CR>
inoremap <silent> <F9> <C-O>:call NumberToggle()<CR>
nnoremap <silent> <S-F9> :set wrap!<CR>
inoremap <silent> <S-F9> <C-O>:set wrap!<CR>
nnoremap <silent> <M-F9> :set list!<CR>
inoremap <silent> <M-F9> <C-O>:set list!<CR>
" ----------------------------------------
nnoremap <C-J> <C-W>wj<C-W>w
nnoremap <C-K> <C-W>wk<C-W>w
nnoremap <F10> <C-E>
vnoremap <F10> <C-E>
inoremap <F10> <C-O><C-E>
nnoremap <silent> <S-F10> :set cursorline!<CR>
inoremap <silent> <S-F10> <C-O>:set cursorline!<CR>
nnoremap <silent> <M-F10> :set cursorcolumn!<CR>
inoremap <silent> <M-F10> <C-O>:set cursorcolumn!<CR>
nnoremap <silent> <C-F10> <C-W>w<C-E><C-W>w
inoremap <silent> <C-F10> <ESC><C-W>w<C-E><C-W>wa
" ----------------------------------------
nnoremap <F11> <C-Y>
inoremap <F11> <C-O><C-Y>
nnoremap <silent> <S-F11> :call MyExplore('')<CR>
inoremap <silent> <S-F11> <ESC>:call MyExplore('')<CR>
nnoremap <silent> <M-F11> :call MyExplore('t')<CR>
inoremap <silent> <M-F11> <ESC>:call MyExplore('t')<CR>
nnoremap <silent> <C-F11> <C-W>w<C-Y><C-W>w
" ----------------------------------------
nnoremap <silent> <F12> :update<CR>
inoremap <silent> <F12> <ESC>:update<CR>
vnoremap <silent> <F12> <C-C>:update<CR>
"  do not try to map S-F12 -- vim never sees it
" ----------------------------------------
" --- insert mode abbreviations     {{{1
iabbrev <silent> ~~4 <c-r>=repeat('~', 40)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~5 <c-r>=repeat('~', 50)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~6 <c-r>=repeat('~', 60)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ~~7 <c-r>=repeat('~', 72)<CR><c-r>=Eatchar('\s')<cr>
"                blog starved kiddies
iabbrev <silent> bsk <c-r>=LongBlogDate()<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> d1 <c-r>=strftime("%b %e")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd <c-r>=strftime("%Y-%b-%d")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd1 <c-r>=repeat('-', 10)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd2 <c-r>=repeat('-', 20)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd3 <c-r>=repeat('-', 30)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd4 <c-r>=repeat('-', 40)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd5 <c-r>=repeat('-', 50)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd6 <c-r>=repeat('-', 60)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd7 <c-r>=repeat('-', 70)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd72 <c-r>=repeat('-', 72)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd8 <c-r>=repeat('-', 80)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd9 <c-r>=repeat('-', 90)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd10 <c-r>=repeat('-', 100)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dd11 <c-r>=repeat('-', 110)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ddd <c-r>=strftime("%d %b %Y  %H:%M  %a")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dddl <c-r>=Longdate()<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dddn <c-r>=strftime("%Y-%b-%d %H:%M %a")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dddof <c-r>=strftime("%B %d, %Y  %A")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dddt <c-r>=strftime("%m/%d/%Y")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dds <c-r>=strftime("%Y-%b-%d %H:%M")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> dds4 <c-r>=strftime("%Y-%B-%d  %A")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ddss <c-r>=strftime("%Y-%b-%d  %H:%M  %a")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ddt  <c-r>=strftime("%Y %b %d  %a  %H:%M")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ddtt <c-r>=strftime("%Y %b %d  %a  %l:%M %p")<cr><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee1 <c-r>=repeat('=', 10)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee2 <c-r>=repeat('=', 20)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee3 <c-r>=repeat('=', 30)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee4 <c-r>=repeat('=', 40)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee5 <c-r>=repeat('=', 50)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee6 <c-r>=repeat('=', 60)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee7 <c-r>=repeat('=', 70)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee8 <c-r>=repeat('=', 80)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ee9 <c-r>=repeat('=', 90)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> iba #!/bin/awk -f<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibe #!/usr/bin/expect<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibl #!/usr/local/bin/lua<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibp #!/usr/bin/python3<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibpp #!/usr/bin/perl<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibs #!/bin/bash<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ibt #!/usr/bin/tclsh<c-r>=Eatchar('\s')<cr>
iabbrev <silent> ll1 <c-r>=repeat('_', 10)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ll2 <c-r>=repeat('_', 20)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ll3 <c-r>=repeat('_', 30)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ll4 <c-r>=repeat('_', 40)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ll5 <c-r>=repeat('_', 50)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ll6 <c-r>=repeat('_', 60)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ll7 <c-r>=repeat('_', 70)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ll8 <c-r>=repeat('_', 80)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ll9 <c-r>=repeat('_', 90)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ll10 <c-r>=repeat('_', 100)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul1 <c-r>=Scaleme(10)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul10 <c-r>=Scaleme(100)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul11 <c-r>=Scaleme(110)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul12 <c-r>=Scaleme(120)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul13 <c-r>=Scaleme(130)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul14 <c-r>=Scaleme(140)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul15 <c-r>=Scaleme(150)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul2 <c-r>=Scaleme(20)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul3 <c-r>=Scaleme(30)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul4 <c-r>=Scaleme(40)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul5 <c-r>=Scaleme(50)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul6 <c-r>=Scaleme(60)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul7 <c-r>=Scaleme(70)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul8 <c-r>=Scaleme(80)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> rul9 <c-r>=Scaleme(90)<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> tt <c-r>=strftime("%H:%M")<CR><c-r>=Eatchar('\s')<cr>
iabbrev <silent> ttt <c-r>=strftime("%H:%M:%S")<CR><c-r>=Eatchar('\s')<cr>
" ----------------------------------------
"  --- fun with UTF-8     {{{1
"  (these work in gvim, terminal vim not so much)
"  alt-, double left chevron
"  alt-. double right chevron
"  alt-a arrow
"  alt-b bullet
"  alt-c check mark
"  alt-x fat raised x
iabbrev ¬ «
iabbrev ® »
iabbrev á →
iabbrev â •
iabbrev ã ✔
iabbrev ø ✖
iabbrev %% ⌘
" ----------------------------------------
" --- <Leader> commands     {{{1
let mapleader = ','
nnoremap <Leader>a :call StripTrailingWhitespace()<CR>
nnoremap <Leader>b :cd %:h<CR>
nnoremap <silent><Leader>c :normal a✔<ESC>
"nnoremap <Leader>d 
nnoremap <Leader>dd :call ClearBuffers()<CR>
nnoremap <Leader>dq :call EditTry('~/txt/alldateabbr')<CR>
nnoremap <Leader>e :e ~/.vimrc<CR>
nnoremap <Leader>ee :source ~/.vimrc<CR>
nnoremap <Leader>f :call F1_toggle_width("78")<CR>
nnoremap <Leader>ff :call Findme()<CR>
nnoremap <Leader>fff :call FixBlankLinesAtEnd('7')<CR>
nnoremap <Leader>g :e ~/.gvimrc<CR>
nnoremap <Leader>gg :source ~/.gvimrc<CR>
nnoremap <Leader>h :source ~/.vim/reading_help.vim<CR>
nnoremap <Leader>hh :call Hideme()<CR>
nnoremap <Leader>hhh :call HelpgrepScrollers()<CR>
nnoremap <Leader>hl :call ListwindowScrollers()<CR>
nnoremap <Leader>i :call Maikallfiles()<CR>
nnoremap <Leader>it :call MaikallfilesT()<CR>
nnoremap <Leader>j :call FindPointer()<CR>
nnoremap <silent> <Leader>jj :call MovePointerDown()<CR>
nnoremap <Leader>k :s/$/  <---/<CR>
nnoremap <silent> <Leader>kk :call MovePointerUp()<CR>
nnoremap <Leader>l :source ~/.vim/i_ctr.vim<CR>
nnoremap <silent> <Leader>m :call MakeMeBig()<CR>
nnoremap <silent> <Leader>n :call FirstBlankAtEnd()<CR>
nnoremap <silent> <Leader>nj :source ~/.vim/nj.vim<CR>
nnoremap <silent> <Leader>o :setl fdm=expr<bar>setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldlevel=0 foldcolumn=2<CR>
nnoremap <silent> <Leader>oo :setlocal foldexpr=0 foldcolumn=0<CR>
nnoremap <Leader>p :call Paste(0)<CR>
nnoremap <Leader>P :call Paste(1)<CR>
nnoremap <Leader>q :call EditTry("~/.vim/leaders")<CR>
nnoremap <silent> <Leader>r :silent call ToggleRuler()<CR>
nnoremap <silent> <Leader>s :windo set scrollbind!<CR>
nnoremap <silent> <Leader>sm :source ~/.vim/smr.vim<CR>
nnoremap <silent> <Leader>ss :silent call ToggleScrollbar()<CR>
nnoremap <silent> <Leader>t :call ToggleExpandtab()<CR>
nnoremap <silent> <Leader>u :call FileTime()<CR>
nnoremap <Leader>v :source ~/.vim/plan.vim<CR>
nnoremap <Leader>w :call F1_toggle_width("78")<CR>
"nnoremap <Leader>x
"nnoremap <Leader>y
nnoremap <Leader>z :source ~/.vim/html_lets<CR>
nnoremap <Leader>zz :edit ~/.vim/html_lets<CR>
" ----------------------------------------
" --- functions     {{{1
function! Acdmo()
    read! ~/py/currmo 48
    let im = strftime("%H:%M")
    call append(line("."), "")
    call append(line("."), im)
    call append(line("."), "")
    normal 3j
    normal o
    startinsert
"    py acdmo()
"    normal o
endfunction
"  the following will work only if you're building vim with python
"pyfile ~/.vim/acdmo.py
" ----------------------------------------
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
" ----------------------------------------
function! CdMaik(dir)
    execute 'cd ' . a:dir
    call Maikallfiles()
endfunction
" ----------------------------------------
function! ClearBuffers()
"  bdelete all but the current buffer
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
" ----------------------------------------
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
" ----------------------------------------
"  DelFromAllfiles should be called to delete the file on current
"  line in an .allfiles module
function! DelFromAllfiles()
    let words = split(getline('.'))
    let lw = words[len(words)-1]
    if lw =~ '^\~'
        let lw = $HOME . substitute(lw, '^\~', "", "")
    endif
    if isdirectory(lw)
        echomsg 'you dont want to be deleting directories w DelFromAllfiles ' . lw
    else
        execute 'silent !rm ' . lw
        silent d
    endif
endfunction
" ----------------------------------------
"  from :help iabbreviation
function! Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction
" ----------------------------------------
function! EditTry(what)
    if &modified
        execute "split " a:what
    else
        execute "edit " a:what
    endif
endfunction
" ----------------------------------------
function! F1_formatter(cp)
    let s:save_tw = &textwidth
    let &textwidth = a:cp
    silent normal gq}
    let &textwidth = s:save_tw
endfunction
" ----------------------------------------
function! F1_toggle_width(w)
    if &textwidth == 0
        let &textwidth = a:w
    else
        let &textwidth = 0
    endif
    set textwidth?
endfunction
" ----------------------------------------
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
    echo s:isexe s:fnf strftime("%Y-%b-%d %H:%M", s:ft)
endfunction
" ----------------------------------------
"  to reverse the effects of calling Hideme()
function! Findme()
    setlocal swapfile
    setlocal buftype=
    setlocal bufhidden=
endfunction
" ----------------------------------------
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
" ----------------------------------------
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
" ----------------------------------------
function! FirstBlankAtEnd()
    let go = NumberBlankLinesAtEnd() - 1
    normal G
    if (go > 0)
        execute 'normal ' go . 'k'
    endif
endfunction
" ----------------------------------------
function! FixBlankLinesAtEnd(num)
    let s:bc = NumberBlankLinesAtEnd()
    if s:bc == a:num
        echom expand('%') . ' already has ' . a:num . ' blank lines at the end'
        return
    endif
    let s:d7 = a:num - s:bc
    if s:d7 > 0
        echo 'adding' s:d7
        while s:d7 > 0
            call append(line('$'), "")
            let s:d7 -= 1
        endwhile
    else
        let s:d7 = s:d7 * -1
        let view = winsaveview()
        call FirstBlankAtEnd()
        execute 'normal ' . s:d7 . 'dd'
        call winrestview(view)
    endif
endfunction
" ----------------------------------------
function! Fmt(w)
    let start = line('.')
    let ll = strlen(getline(start))
    while ll > 0
        let start -= 1
        let ll = strlen(getline(start))
    endwhile
    let start += 1
    let end = search("^$")
    if end == 0
        let end = line('$')
    endif
    execute start . ',' . end . '!fmt -w ' . a:w
    normal }
    normal j
endfunction
" ----------------------------------------
function! HelpgrepScrollers()
    silent! nmap <F6> :cnext<CR>
    silent! nmap <S-F6> :cprev<CR>
    echo 'helpgrep scrollers :cn and :cp mapped to F6 and S-F6'
endfunction
" ----------------------------------------
function! Hideme()
    setlocal noswapfile
    setlocal buftype=nofile
    setlocal bufhidden=hide
endfunction
" ----------------------------------------
"  wish I remembered where I got this:
function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! ' .c.'|'.a."\<C-a>"
    endif
    normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>
" ----------------------------------------
function! InsertEmDash()
    return ' ― '
endfunction
" ----------------------------------------
function! LastNonBlank()
    normal G
    let s:lp = line("$")
    while s:lp > 0
        if len(getline(".")) == 0 && s:lp > 1
            normal k
            let s:lp = s:lp - 1
        else
            let s:lp = 0
        endif
    endwhile
endfunction
" ----------------------------------------
function! ListwindowScrollers()
    silent! nmap <F6> :lnext<CR>
    silent! nmap <S-F6> :lprev<CR>
    echo 'list window scrollers :ln and :lp added to F6 and S-F6'
endfunction
" ----------------------------------------
function! LongBlogDate()
    let d1 = strftime("%Y %B %_d")
    let d1s = substitute(d1, "  ", " ", "")
    let d2 = strftime("%A")
    let d3 = strftime("%l:%M%P %Z")
"    let d3s = substitute(d3, " ", "", "^")
    return d1s . "  " . d2 . "  " . d3
endfunction
" ----------------------------------------
function! Longdate()
    let d1 = strftime("%Y %B %e  %l:%M%P  %A")
    return d1
endfunction
" ----------------------------------------
"  make allfiles
function! Maikallfiles()
    let l:tst_name = expand("%")
    if l:tst_name != ".allfiles"
        call EditTry(".allfiles")
    endif
"  the reason I stopped with this is I don't like the idea that if I use
"  vf to find, then edit a file, F8 will be defined as DelFromAllfiles in
"  that edit session
"  I wanted it on F8 because that's what mc uses
"    nnoremap <silent> <F8> :call DelFromAllfiles()<CR>
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
"    nnoremap <silent> <F8> :call DelFromAllfiles()<CR>
    call Hideme()
    silent %d
    0r!pwd
    normal o
    silent execute 'r!ls -algGt'
    silent g/^total/d
    normal gg
endfunction
" ----------------------------------------
function! MakeMeBig()
    set lines=58
    set columns=119
endfunction
" ----------------------------------------
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
"
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
" ----------------------------------------
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
" ----------------------------------------
function! MyExploreT()
    call MaikallfilesT()
endfunction
" ----------------------------------------
function! NumberBlankLinesAtEnd()
    let s:bc = 0                              "  blank count
    let s:lp = line("$")                      "  line pointer
    while s:lp > 0
        let s:tl = strlen(getline(s:lp))      "  test length
        if (s:tl > 0)
            let s:lp = 0
        else
            let s:bc = s:bc + 1
            let s:lp = s:lp - 1
        endif
    endwhile
    return s:bc
endfunction
" ----------------------------------------
function! NumberToggle()
    if &number
        setlocal nonumber
        setlocal relativenumber
    else
        if &relativenumber
            setlocal nonumber
            setlocal norelativenumber
        else
            setlocal number
            setlocal norelativenumber
        endif
    endif
endfunction
" ----------------------------------------
function! OpenEndWhat()
    let words = split(getline('.'))
    let lw = words[len(words)-1]
    if lw =~ '^\~'
        let lw = $HOME . substitute(lw, '^\~', "", "")
    endif
    if isdirectory(lw)
        call CdMaik(lw)
    else
        execute 'e ' . lw
    endif
endfunction
" ----------------------------------------
"
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
" ----------------------------------------
function! Paste(paste_before)
    let save_q = @q
    let @q = system("xclip -o")
    if a:paste_before
        normal! "qP
    else
        normal! "qp
    endif
    let @q = save_q
endfunction
" ----------------------------------------
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
" ----------------------------------------
function! SetExecutableBit()
    if &modified
        write
    endif
"    call system("chmod 754 " . expand('%'))
    execute "cd " . expand('%:h')
    execute "let s:t = setfperm('" . expand('%') . "', 'rwxr-xr-x')"
    if s:t 
        echo "execute bit set [to 755] for " . expand('%')
    else
        echo "execute bit setting failed for " . expand('%')
    endif
endfunction
" ----------------------------------------
function! StripTrailingWhitespace()
    let l:svd_sch=@/
    let l:oldpos = getpos(".")
    %s/\s\+$//e
    call setpos(".", l:oldpos)
    let @/ = l:svd_sch
endfunction
" ----------------------------------------
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
" ----------------------------------------
function! ToggleRuler()
    if &ruler
        set noruler
        redraw!
    else
        set ruler
        redraw!
    endif
endfunction
" ----------------------------------------
function! ToggleScrollbar()
    if &guioptions =~ 'r'
        set guioptions-=r
    else
        set guioptions+=r
    endif
endfunction
" ----------------------------------------
function! ZeroBlankLinesAtEnd()
    let s:bc = NumberBlankLinesAtEnd()
    if s:bc == 0
        echo expand('%') . ' already has 0 blank lines at the end'
        return
    endif
    let view = winsaveview()
    call FirstBlankAtEnd()
    execute 'normal ' . s:bc . 'dd'
    call winrestview(view)
endfunction
" ----------------------------------------
"  vim:foldmethod=marker
