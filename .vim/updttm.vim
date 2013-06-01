"  update date [of .vimrc] in index.html
call search("^Here's my <a href")
let l = getline(".")
let dt = strftime("%Y-%b-%d")
let loe = match(l, "existed")
let ep = loe + 7
let newline = strpart(l, 0, ep) . "  " . dt . "<br>"
call setline(".", newline)
write
quit
