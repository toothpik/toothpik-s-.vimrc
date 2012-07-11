#  increasing-end.awk is designed for use with 'cct'
#  it makes sure the last field is increasing (or equal)
BEGIN { savelf = -100 }
/^        / { print; next }
{
    lf = $NF
    sub(/,/, "", lf)
    if (lf >= savelf) {
        print
    } else {
        printf "%s  <--- out of order\n", $0
    }
    savelf = lf
}
