#!/usr/bin/python

##  version 07 Nov 2007 
##
##  input a date in YYYY-MM-DD format -- this script will
##  output a countdown from current date to that date -- if the
##  provided date is in the past, ctdn will count down from it
##  to today
##
##  can supply an optional $2 for a custom output format (see mcdl)

from datetime import date, timedelta
from time import strptime
from sys import argv, exit

def one_date(arglist):

    day = timedelta(days=1)
    try:
        td_ts = strptime(arglist[1], "%Y-%m-%d")  #  to-date time struct
    except ValueError:
        try:
            td_ts = strptime(arglist[1], "%Y-%b-%d")
        except ValueError:
            usage()
            exit(2)
    #  the following date is "naive" in that it knows nothing of timezones or DST
    std = date(td_ts.tm_year, td_ts.tm_mon, td_ts.tm_mday)  #  simple to-date
    sd = date.today()                                       #  simple start-date
    ctd = std - sd                                          #  counter time delta
    c = ctd.days                                            #  the count

    #  allow this to work for dates prior to today
    if c < 0:
        c *= -1
        sd = std

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
    print " ctdn requires a date in YYYY-M-D or YYYY-mmm-d format"
    print " in order to count down to it on sysout"
    print " (will work with dates in the past, counting down to today)"

if __name__ == "__main__":

    if len(argv) < 2:
        usage()
        exit(1)
    else:
        one_date(argv)
