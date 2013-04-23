"  weekly reminder formatter
"  called by ~/bin/weekly
"
let mapleader = ','
nmap <silent> <Leader>c :source ~/.vim/weekly.vim<CR>
nmap <silent> <Leader>ev :edit ~/.vim/weekly.vim<CR>
let @/ = strftime("%a")
silent %d
silent r!cat ~/txt/weekly | wkly2
call Hideme()
winpos 0 0
set columns=35
set lines=9
set cursorline
set guioptions-=r
if &number
    setlocal nonumber
elseif &relativenumber
    setlocal norelativenumber
endif
set noruler
set noshowmode
set nowrap
normal gg
call search(@/)
normal 0
normal zz
normal 
set hlsearch
silent file week
