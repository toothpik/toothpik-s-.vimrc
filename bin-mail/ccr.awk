
function commas(x, num) {
   if (x < 0)
      return "-" commas(-x)
   num = x
   while (num ~ /[0-9][0-9][0-9][0-9]/)
      sub(/[0-9][0-9][0-9]($|[,.])/, ",&", num)
   return num
}
{ printf "%15s %s %2d %s %s\n", commas($5), $6, $7, $8, $9}
