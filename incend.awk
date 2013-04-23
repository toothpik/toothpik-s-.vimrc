#  increasing-end.awk is designed for use with 'cct'
#  it makes sure the last field is increasing (or equal)
#  2012-Jul-24 14:44
#  this script broke when I upgraded from suse 11.4 to 12.1
#  it continues to show 1186 as out of order even though it is
#  not
#          countdown list as of      2012-Jul-24
#
#      1)  fsck                      2012-Sep-9         47
#      2)  raney oil change          2012-Oct-4         72
#      3)  furnace filter            2012-Oct-17        85
#      4)  dentist                   2012-Oct-18        86
#      5)  presidential election     2012-Nov-6        105
#      6)  turn mattress             2012-Dec-28       157
#      7)  stubbie: fec fv rab l     2013-Jan-17       177
#      8)  dyson filter clean        2013-Jan-21       181
#      9)  road star register        2013-Apr-15       265
#     10)  raney wiper blades        2013-May-7        287
#     11)  last mm payment           2013-Jul-5        346
#     12)  ups store expires         2013-Aug-27       399
#     13)  driver's license          2014-Mar-15       599
#     14)  raney register            2014-May-15       660
#     15)  washer hoses              2014-Nov-6        835
#     16)  water heater warranty     2016-Aug-30     1,498  <--- out of order
#     17)  passport expires          2019-Mar-31     2,441
#
#  never mind -- strtonum fixed it

BEGIN { savelf = -100 }
/^        / { print; next }
{
    lf1 = $NF
    sub(/,/, "", lf1)
    lf = strtonum(lf1)
    if (lf >= savelf) {
        print
    } else {
        printf "%s  <─── out of order\n", $0
    }
    savelf = lf
}
