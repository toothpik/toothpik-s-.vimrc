#  recalculate lawn budget remaining for current month in plan modules
#  
#  requires a python(2) enabled vim
#  also requires a call to BalCol after
#  
#  assumes range it filters is from current line (a new Halligan
#  entry) to the lawn mowing budget line
#
import locale
import re
import vim

#  search target
st = re.compile("Halligan Lawn Services")

#  so we can insert commas in numbers:
locale.setlocale(locale.LC_ALL, "en_US.UTF-8")

#  loop through range looking for food
b = vim.current.buffer
r = vim.current.range
s = r.start
e = r.end

#  get the current lawn budget from the end of range
bl = b[e]                         #  budget line
cba = bl[47:57].lstrip()          #  current budget amount
cbaf = float(cba)                 #  cba as float

for l in b[s:e + 1]:
    if st.search(l):
        #  lawn amount
        la1 = l[47:57].lstrip()
        la2 = la1.replace(",", "")
        la3 = float(la2)
        cbaf -= la3
        
if cbaf > 0.0:
    #  we will hopefully never have a lawn budget over $999, but in case:
    cbafwc = locale.format("%.2f", cbaf, grouping=True)
    #  make a new lawn budget line
    nlal = b[e][:48] + "%9s" % cbafwc
    b[e] = nlal
else:
    print "lawn budget line should be deleted"
