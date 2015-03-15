#!/usr/bin/python
# -*- coding: utf-8
#  parse weather module created by ccw
#  this module uses encoding:  utf-8
from HTMLParser import HTMLParser
from os import environ
from sys import exit

Fn = environ['HOME'] + '/.rawweather'

try:
    F = open(Fn, 'r')
except IOError:
    print "could not open %s for reading" % Fn
    exit(1)

wk = F.read()
F.close()

class MyParser(HTMLParser):

    def __init__(self):
        HTMLParser.__init__(self)
        self.ts = False
        self.gettime = True
        self.tmp = False
        self.gethum = False
        self.wnd = False
        self.grab = False
        self.fcst = []

    def handle_starttag(self, tag, attrs):
        for a in attrs:
            if a[0] == "id" and a[1] == "current_conditions_detail":
                self.ts = True
            if a[0] == "class" and a[1] == "myforecast-current-lrg":
                self.tmp = True
            if a[0] == "id" and a[1] == "detailed-forecast-body":
                self.grab = True

    def handle_data(self, data):
        dat = data.strip()

        if self.gettime and dat != "":
            self.timestamp = dat
            self.gettime = False
        if self.ts and dat == "Last update on":
            self.gettime = True

        if self.tmp:
            self.temp = dat
            self.tmp = False

        if self.gethum and dat != "":
            self.humid = dat
            self.gethum = False
        if dat == "Humidity":
            self.gethum = True

        if self.wnd and dat != "":
            self.wind = dat
            self.wnd = False
        if dat == "Wind Speed":
            self.wnd = True

        if self.grab and dat != "":
            if dat == "Toggle menu":
                self.grab = False
            else:
                self.fcst.append(dat)
        if dat == "Detailed Forecast":
            self.grab = True

parser = MyParser()
parser.feed(wk)

try:
    print "Last update:  %s" % parser.timestamp
except AttributeError:
    print "no timestamp available"
print

try:
    print "Temperature:%6s°F" % parser.temp
except AttributeError:
    print "no temperature available"

try:
    print "Humidity:%11s" % parser.humid
except AttributeError:
    print "no humidity available"

try:
    print "Wind:%15s" % parser.wind
except AttributeError:
    print "no wind available"
print

p = 0
while p < len(parser.fcst):
    print "%s:  %s" % (parser.fcst[p], parser.fcst[p+1])
    p += 2
    print

parser.close()
