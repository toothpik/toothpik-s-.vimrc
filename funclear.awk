#  first unclear [in plan_{year}]
#  in the continuing quest to determine if the first unclear
#  occurs in the same fiscal month as the last x, awk to the 
#  rescue
#  BUG:  if current fiscal month goes all the way to the next
#  dash line separator (with 'x' in cc60), funclear reports
#  diffmo even when the first unclear is in current month --
#  this bug never shows because 'm' tests funclear only when
#  day of month is less than 10
#                      1 2  3 4 5  6 7  8  910 
BEGIN { FIELDWIDTHS = "5 4 31 3 3 11 3 10 10 6" 
        funclear = 0 
        stillx = 1 }
{
    desc = $3
    sub(/^ */, "", desc)
    if (desc ~ /_[ADFJMNOS]/) { mo = desc }
    clear = $5
    sub(/^ */, "", clear)
    loc = length(clear)
    if (loc == 0 && funclear == 0) {
        clearmo = mo
        funclear = 1
    }
    if ($7 == "   " && stillx == 1) {
        if (clearmo == mo) {
            print "samemo"
        } else {
            print "diffmo"
        }
        stillx = 0
    }
}
