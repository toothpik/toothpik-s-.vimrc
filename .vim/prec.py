#  python reconcile - for use by plan modules
#  requires a python enabled vim
from datetime import date
import locale
import vim
locale.setlocale(locale.LC_ALL, "en_US.UTF-8")
tm = date.today().strftime("%m")        #  today's month
td = date.today().strftime("%d")        #  today's day
if tm[0:1] == "0":
    tm = tm[1:]
if td[0:1] == 0:
    td = td[1:]
td = tm + "/" + td
b = vim.current.buffer
r = vim.current.range
s = r.start
e = r.end
ra = 0.0                                #  reconciliation adjustment
for l in b[s:e + 1]:
    cd = l[45]
    if cd == " ":
        ata = l[47:57]                  #  amount to add
        ata2 = ata.lstrip()
        ata3 = ata2.replace(",", "")
        ataf = float(ata3)
        ra += ataf
sa = b[e][61:70]                        #  starting amount
sa2 = sa.lstrip()
sa3 = sa2.replace(",", "")
saf = float(sa3)
ba = saf + ra                           #  balance amount
bawc = locale.format("%.2f", ba, grouping=True)
#  new last line [of range]
nll = b[e][:70] + "%11s" % bawc + "%6s" % td
b[e] = nll
