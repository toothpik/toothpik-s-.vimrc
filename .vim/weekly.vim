"  weekly reminder formatter
"  called by ~/bin/weekly
"
let mapleader = ','
nmap <silent> <Leader>c :source ~/.vim/weekly.vim<CR>
nmap <silent> <Leader>ev :edit ~/.vim/weekly.vim<CR>
let @/ = strftime("%a")
silent %d
silent 0r!cat ~/txt/weekly | wkly2
call Hideme()
winpos 0 0
set columns=35
set lines=8
set cursorline
set guioptions-=r
set nonumber
set noruler
set noshowmode
set nowrap
normal gg
silent normal n
normal 0
normal zz
set hlsearch
silent file week
