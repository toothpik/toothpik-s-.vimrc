#  current fiscal month
#  for use by lfy
#   1) date                         thru 6
#   2) type                             10
#   3) desc                             41
#   4) requested clear date             44
#   5) clear date                       47
#   6) trans amount                     58
#   7) x - past; blank - future         61
#   8) balance                          71
#   9) reconciliation amount            82
#  10) reconciliation date              88
#                      1 2  3 4 5  6 7  8  9 10 
BEGIN { FIELDWIDTHS = "6 4 31 3 3 11 3 10 11 6" }
$3 ~ /^\_/ { if ($7 ~ / x /) { sd = $1 } }
END { print sd }
