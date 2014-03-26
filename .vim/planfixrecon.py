#  adjust errant reconciliation with previous year's uncleared transactions 
#  assigned to ,rr in ~/.vim/plan.vim
#  requires a python enabled vim
import locale
from os import environ  
from sys import exit
import vim

locale.setlocale(locale.LC_ALL, "en_US.UTF-8")

#  year to check
ytc = vim.eval("prvyr")
prplan = environ["HOME"] + "/txt/plan_" + ytc

try:
    F = open(prplan, 'r')
    L = F.readlines()
    F.close()
except IOError:
    print "cannot open %s for reading" % prplan
    exit(1)

#  amount to add
ata = 0.0

for l in L:
    cd = l[45]
    if cd == " ":
        ta = l[47:57].lstrip().replace(",", "")
        taf = float(ta)
        ata += taf

b = vim.current.buffer
r = vim.current.range
s = r.start

ltf = b[s]                  #  line to fix
atf = ltf[71:81]            #  amount to fix
atf2 = atf.lstrip().replace(",", "")
atff = float(atf2)
na = atff + ata             #  new amount
nl = ltf[:70] + "%11s" % locale.format("%.2f", na, grouping=True) + ltf[81:]
b[s] = nl
