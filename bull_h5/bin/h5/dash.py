#!/usr/bin/env python
#
# Copyright 2009 Facebook
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
"""Simplified chat demo for websockets.

Authentication, error handling, etc are left as an exercise for the reader :)
"""
import tornado.escape
import tornado.ioloop
import tornado.options
import tornado.websocket
import os.path
from tornado.options import define, options
from tornado import web
import subprocess
import json

static_root = os.path.join(os.path.dirname(__file__),'static/')
template_root = os.path.join(os.path.dirname(__file__),'templates/')

define("port", default=8888, help="run on the given port", type=int)

class Application(tornado.web.Application):

    def __init__(self):
        handlers = [
	    (r"/", MainHandler),
#            (r"/(.)+", wshandler),
#	    (r"/(.*)", web.StaticFileHandler,{'path':'static/assets/'}),
	    (r"/(.*)", web.StaticFileHandler,{'path':static_root}),
#	    (r"/templates/(.*)", web.StaticFileHandler,{'path':template_root}),
            #(r"/websocket", webMainHandler),
        ]
        settings = dict(
            cookie_secret="__TODO:_GENERATE_YOUR_OWN_RANDOM_VALUE_HERE__",
            template_path=os.path.join(os.path.dirname(__file__), "templates"),
          #  static_path=os.path.join(os.path.dirname(__file__), "static/"),
            static_url_prefix=os.path.join(os.path.dirname(__file__), "/static/"),
            xsrf_cookies=True,
        )
        tornado.web.Application.__init__(self, handlers, **settings)

class MainHandler(tornado.web.RequestHandler):
   
    def check_origin(self, origin):
        return True 

    def get(self):
        print "web handler"
        self.render("index.html")
#        self.render("mycave.html")

    def check_origin(self,origin):
        print "origin = %s " % origin
        return True

def main():
    tornado.options.parse_command_line()
    app = Application()
    app.listen(options.port)

    print tornado.ioloop.IOLoop.instance()
    tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
    main()
