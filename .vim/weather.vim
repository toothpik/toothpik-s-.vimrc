"  setup for ~/bin/wiv (and wig)
set nocursorline

if has('gui_running')
    set lines=44
    set columns=85
endif

let mapleader = ','
map <silent> <Leader>c :call Makemeweather()<CR>
map <Leader>ec :e ~/bin/cw<CR>
map <Leader>ev :e ~/.vim/weather.vim<CR>
map <Leader>eg :e ~/bin/wiv<CR>
map <silent> <Leader>h :let @/ = '\(high\_snear\_s\)\@<=\d\+\<bar>\(low\_saround\_s\)\@<=\d\+\<bar>snow\<bar>rain\>\<bar>drizzle\<bar>freezing\_s\<bar>sleet\<bar>flurries\<bar>showers\<bar>thunderstorm[s]*\<bar>sunny'<CR>
map <silent> <Leader>s :source ~/.vim/weather.vim<CR>
map <silent> <Leader>pp :let @/ = '\(high\_snear\_s\)\@<=\d\+'<CR>
map <silent> <Leader>pl :let @/ = '\(low\_saround\_s\)\@<=\d\+'<CR>

function! Makemeweather()
    call Hideme()
    setlocal ignorecase
    !php ~/php/cw.php > ~/.rawweather
    silent %d
    silent 0read !python ~/py/parseweather.py | head -5
    silent read !python  ~/py/parseweather.py | tail -n +6 | fixtoday | fvd | fmt
    1
endfunction
