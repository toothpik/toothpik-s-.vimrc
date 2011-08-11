#  ciaa.awk
#
#  commas in all arguments
#
function commas(x, num) {
   if (x < 0)
      return "-" commas(-x)
   num = x
   while (num ~ /[0-9][0-9][0-9][0-9]/)
      sub(/[0-9][0-9][0-9]($|[,.])/, ",&", num)
   return num
}

{  for (i = 1; i < NF+1; i = i + 1)
      printf "%s", commas($i)
   printf "\n"
}
