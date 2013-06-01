#  plan balance - mapped to ,b in ~/.vim/plan.vim
#  requires a python enabled vim
import locale
import vim

locale.setlocale(locale.LC_ALL, "en_US.UTF-8")

b = vim.current.buffer
r = vim.current.range
s = r.start
e = r.end

#  first get starting balance amount from first line
ba1 = b[s][60:70].lstrip().replace(",", "")
baf = float(ba1)

def rebuild_line(line, ba):
    le = len(line)
    nbs = locale.format("%.2f", ba, grouping=True)
    if le == 70:
        nl = line[:60] + "%10s" % nbs
    elif le < 70:
        #  spaces to add
        sta = " " * (60 - le)
        nl = line + sta + "%10s" % nbs
    else:
        nl = line[:60] + "%10s" % nbs + line[70:]
    return nl

i = s
for l in b[s + 1:e + 1]:
    i += 1
    #  transaction amount
    ta = l[47:57].lstrip().replace(",", "")
    if ta == "----------":
        continue
    elif ta == "":
        nl = rebuild_line(l, baf)
        b[i] = nl
    else:
        baf -= float(ta)
        nl = rebuild_line(l, baf)
        b[i] = nl
