
set nocursorline

let mapleader = ','
map <silent> <Leader>c :call Makemeweather()<CR>
map <Leader>ec :e ~/bin/cw<CR>
map <Leader>ev :e ~/.vim/weather.vim<CR>
map <Leader>eg :e ~/bin/wiv<CR>
map <Leader>et :e ~/tcl/cw<CR>
map <silent> <Leader>h :let @/ = '\(high\_snear\_s\)\@<=\d\+\<bar>\(low\_saround\_s\)\@<=\d\+\<bar>snow\<bar>rain\>\<bar>drizzle\<bar>freezing\_s\<bar>sleet\<bar>flurries\<bar>showers\<bar>thunderstorm[s]*\<bar>sunny'<CR>
map <silent> <Leader>s :source ~/.vim/weather.vim<CR>
map <silent> <Leader>pp :let @/ = '\(high\_snear\_s\)\@<=\d\+'<CR>
map <silent> <Leader>pl :let @/ = '\(low\_saround\_s\)\@<=\d\+'<CR>

function! Makemeweather()
    call Hideme()
    setlocal ignorecase
    silent %d
"    call append(0, strftime("%Y-%b-%d %H:%M"))
    silent 0read !~/tcl/cw
    g/Current Local Weather/d
    1
endfunction
