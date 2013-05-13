#  recalculate food budget remaining for current month in plan modules
#  requires a python enabled vim
#  also requires a call to BalCol after
#  presumes the range is beginning of month to end
import locale
import re
from subprocess import Popen, PIPE
import vim

#  search target [food & atm]
st = re.compile("Sunfresh|festival|atm -")

#  so we can insert commas in numbers:
locale.setlocale(locale.LC_ALL, "en_US.UTF-8")

#  get the current food budget from ~/txt/plan_core:
fb = Popen(["foodbud"], stdout=PIPE).communicate()[0].rstrip()
fbaf = float(fb)

#  loop through range looking for food
b = vim.current.buffer
r = vim.current.range
s = r.start
e = r.end
for l in b[s:e + 1]:
    if st.search(l):
        #  food amount
        fa1 = l[47:57].lstrip()
        fa2 = fa1.replace(",", "")
        fa3 = float(fa2)
        fbaf -= fa3
        
if fbaf > 0.0:
    #  we may never have a food budget over $999, but in case:
    fbafwc = locale.format("%.2f", fbaf, grouping=True)
    #  make a new food & atm line
    nfal = b[e][:48] + "%9s" % fbafwc
    b[e] = nfal
else:
    print "food & atm line should be deleted"
