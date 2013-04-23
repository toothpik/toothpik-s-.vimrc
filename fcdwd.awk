#  flag current date with dash
BEGIN { IGNORECASE = 1
        sa = strftime("%b-%d") }
$0 ~ sa  { print $0, " <───" }
$0 !~ sa  { print }
