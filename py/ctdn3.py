#!/usr/bin/python
#
#  version 2007-Nov-08 
#
#  input a counter -- this script will output a countdown from current 
#  date [counter] days to zero
#  if [counter] is negative, start the count [counter] days ago

from datetime import date, timedelta
from sys import argv, exit

def counter_only(arglist):
    day = timedelta(days=1)
    sd = date.today()
    c = int(arglist[1])                       #  create the count

    if c < 0:
        c *= -1
        for i in range(c):
            sd -= day

    if len(arglist) < 3:
        outf = "%b %_d  %a"
    else:
        outf = arglist[2]

    if c > 365:
        outf = "%Y " + outf

    if c > 999:
        fivedig = True
    elif c > 99:
        fourdig = True
        fivedig = False
    else:
        fourdig = False
        fivedig = False

    while c > -1:
        if fivedig:
            print "%5d)  %s" % (c, sd.strftime(outf))
        elif fourdig:
            print "%4d)  %s" % (c, sd.strftime(outf))
        else:
            print "%3d)  %s" % (c, sd.strftime(outf))
        c -= 1
        sd += day

def usage():
    print " ctdn3 requires a count on the commandline"
    print " in order to count down [count] days from today"
    print " on sysout"

if __name__ == "__main__":

    if len(argv) < 2:
        usage()
        exit(1)
    else:
        counter_only(argv)
