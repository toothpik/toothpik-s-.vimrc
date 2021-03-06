#!/usr/bin/python

##  version 2007 Oct 16 

##  input two dates in YYYY-MM-DD format -- this script will
##  output a countdown from the first to the second

from datetime import date, timedelta
from time import strptime
from sys import argv, exit

def two_dates(arglist):

    day = timedelta(days=1)                     #  create the date incrementer
    try:
        st1 = strptime(arglist[1], "%Y-%m-%d")  #  create a time struct with first arg
        st2 = strptime(arglist[2], "%Y-%m-%d")  #  create a time struct with second arg
    except ValueError:
        try:
            st1 = strptime(arglist[1], "%Y-%b-%d")
            st2 = strptime(arglist[2], "%Y-%b-%d")
        except ValueError:
            usage()
            exit(2)

    sd = date(st1.tm_year, st1.tm_mon, st1.tm_mday)    #  simple start-date
    std = date(st2.tm_year, st2.tm_mon, st2.tm_mday)   #  simple to-date
    c = (std - sd).days                                #  create the count

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
    print " ctdn2 requires two dates on the command line"
    print " in YYYY-M-D or YYYY-mmm-d format"
    print " in order to count down from the first to the second"
    print " on sysout"

if __name__ == "__main__":
   
    if len(argv) < 3:
        usage()
        exit(1)
    else:
        two_dates(argv)
