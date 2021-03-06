#!/usr/bin/python
#  version 2007-10-15 

#  input a counter and a from date -- this script will count down
#  from the from date for counter days

from datetime import date, timedelta
from time import strptime
from sys import argv, exit

def ctr_n_from_date(arglist):
    day = timedelta(days=1)
    c = int(arglist[1])
    try:
        ts = strptime(arglist[2], "%Y-%m-%d")    #  time struct from input date
    except ValueError:
        try:
            ts = strptime(arglist[2], "%Y-%b-%d") 
        except ValueError:
            usage()
            exit(2)
    sd = date(ts.tm_year, ts.tm_mon, ts.tm_mday)
    
    if len(arglist) < 4:
        outf = "%b %_d  %a"
    else:
        outf = arglist[3]
    
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
    print " ctdn4 requires a count and a from-date on the commandline"
    print " in order to count down [count] days from the from-date"
    print " on sysout"
    print " the date must be in YYYY-M-D or YYYY-mmm-d format"

if __name__ == "__main__":

    if len(argv) < 3:
        if len(argv) > 1:
            print "received %s" % argv[1]
        usage()
        exit(1)
    else:
        ctr_n_from_date(argv)
