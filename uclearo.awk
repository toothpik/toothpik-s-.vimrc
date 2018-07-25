#  unclear only
#   1) date                        1-6
#   2) type                        7-10
#   3) desc                        11-41
#   4) requested clear date        42-44
#   5) clear date                  45-47
#   6) trans amount                48-58
#   7) x - past; blank - future    59-61
#   8) balance                     62-71
#   9) reconciliation amount       72-81
#  10) reconciliation date         82-87
#                      1 2  3 4 5  6 7  8  9 10 
#
#  NB:  if the first line of plan_20?? has a blank in cc60
#       (the 'x' column) m18 | awk -f ~/uclearo.awk will extract
#       nothing -- a blank there tells this script to stop
# ↓     ↓   ↓                              ↓  ↓  ↓          ↓  ↓         ↓         ↓ 
# ....+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....8....+....9
# 12/23 dc  Sunfresh 4357                     26      16.98  x  1,414.48   2,087.91 12/23
#
BEGIN { FIELDWIDTHS = "6 4 31 3 3 11 3 10 10 6" 
        stillx = 1 }
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
