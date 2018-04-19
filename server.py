#!/usr/local/bin/python

import string,cgi,time
from os import curdir, sep
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer

port_number = 8008

class MyHandler(BaseHTTPRequestHandler):
    outputname = "exceptions.xml"

    def do_GET(self):
        try:
            if self.path.endswith(self.outputname):
                f = open(curdir + sep + self.outputname)

                self.send_response(200)
                self.send_header('Content-type',    'text/xml')
                self.end_headers()
                self.wfile.write(f.read())
                f.close()
                return

        except IOError:
            self.send_error(404,'File Not Found: %s' % self.path)


def main():
    try:
        server = HTTPServer(('', port_number), MyHandler)
        print 'started httpserver...'
        server.serve_forever()
    except KeyboardInterrupt, SystemExit:
        print '^C received, shutting down server'
    finally:
        try:
            server.socket.close()
        except:
            print "Server never started"

if __name__ == '__main__':
    main()
