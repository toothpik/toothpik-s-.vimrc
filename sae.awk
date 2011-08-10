#  stop at equal
$0 ~ /^=======/ { stop = 1 }
{ if (!stop) { print } }
