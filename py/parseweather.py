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

#  whole kaboodle
wk = F.read()
F.close()

class MyParser(HTMLParser):
    def __init__(self):
        HTMLParser.__init__(self)
        self.savets = False
        self.savetmp = False
        self.savehum = False
        self.td = 0
        self.wnd = False
        self.td2 = 0
        self.grab = False
        self.fcst = []

    def handle_starttag(self, tag, attrs):
        for a in attrs:
            if a[0] == "class" and a[1] == "current-conditions-timestamp":
                self.savets = True
            if a[0] == "class" and a[1] == "myforecast-current-lrg":
                self.savetmp = True
            if a[0] == "class" and a[1] == "current-conditions-detail":
                self.savehum = True
            if a[0] == "class" and a[1] == "point-forecast-7-day":
                self.grab = True

    def handle_endtag(self, tag):
        if tag == "ul":
            self.grab = False

    def handle_data(self, data):
        if self.savets:
            self.timestamp = data
            self.savets = False
        if self.savetmp:
            self.temp = data
            self.savetmp = False
        if self.savehum:
            self.td += 1
            if self.td > 1:
                self.hum = data
                self.savehum = False
        if self.wnd:
            self.wind = data
            self.wnd = False
        if data == "Wind Speed":
            self.wnd = True
        if self.grab:
            self.fcst.append(data.lstrip())

parser = MyParser()
parser.feed(wk)

print parser.timestamp
print
print "Temperature:  %s°F" % parser.temp
print "Humidity:      %s" % parser.hum
print "Wind:     %-10s" % parser.wind
print

for i in parser.fcst:
    print i
