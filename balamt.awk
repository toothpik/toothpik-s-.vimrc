#  balance amount from plan line
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
#                      1 2  3 4 5  6 7  8  910 
BEGIN { FIELDWIDTHS = "5 4 31 3 3 11 3 10 10 6" }
{
    bal = $8
    sub(/^ */, "", bal)
    print bal
}
