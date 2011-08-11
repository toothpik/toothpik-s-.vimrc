#  unclear only
#   1) date
#   2) type
#   3) desc
#   4) requested clear date
#   5) clear date
#   6) trans amount
#   7) x - past; blank - future
#   8) balance
#   9) reconciliation amount
#  10) reconciliation date
#                      1 2  3 4 5  6 7  8  9 10 
BEGIN { FIELDWIDTHS = "6 4 31 3 3 11 3 10 10 6" 
        stillx = 1 }
function commas(x, num) {
   if (x < 0)
      return "-" commas(-x)
   num = x
   while (num ~ /[0-9][0-9][0-9][0-9]/)
      sub(/[0-9][0-9][0-9]($|[,.])/, ",&", num)
   return num
}
{
    type = $2
    clear = $5
    sub(/^ */, "", clear)
    loc = length(clear)
    if ($7 == "   " && stillx == 1) {
        stillx = 0
    }
    if (loc == 0 && stillx && type != "a   ") {
        print substr($0,0,57)
    }
}
