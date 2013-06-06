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
        self.ts = False
        self.tmp = False
        self.hum = False
        self.wnd = False
        self.grab = False
        self.fcst = []

    def handle_starttag(self, tag, attrs):
        for a in attrs:
            if a[0] == "class" and a[1] == "current-conditions-timestamp":
                self.ts = True
            if a[0] == "class" and a[1] == "myforecast-current-lrg":
                self.tmp = True
            if a[0] == "class" and a[1] == "current-conditions-detail":
                self.hum = True
            if a[0] == "class" and a[1] == "point-forecast-7-day":
                self.grab = True

    def handle_endtag(self, tag):
        if tag == "ul":
            self.grab = False

    def handle_data(self, data):
        if self.ts:
            self.timestamp = data
            self.ts = False
        if self.tmp:
            self.temp = data
            self.tmp = False
        if self.hum:
            self.humid = data
            self.hum = False
        if data == "Humidity":
            self.hum = True
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
print "Temperature:%4s°F" % parser.temp
print "Humidity:%9s" % parser.humid
print "Wind:%13s" % parser.wind

for i in parser.fcst:
    print i
