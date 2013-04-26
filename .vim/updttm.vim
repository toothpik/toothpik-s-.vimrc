"  update dttm [of .vimrc] in index.html
call search("^Here's my <a href")
let l = getline(".")
"echo "line is " . l
let dttm = strftime("%Y-%b-%d %H:%M")
"echo "dttm is " . dttm
let loe = match(l, "existed")
"echo "existed starts on " . loe
let ep = loe + 7
let newline = strpart(l, 0, ep) . "  " . dttm . "<br>"
"echo "newline will be " . newline
call setline(".", newline)
write
quit
