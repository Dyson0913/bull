import tornado.escape
import tornado.ioloop
import tornado.options
import tornado.websocket
import os.path
from tornado.options import define, options
from tornado import web
import subprocess
import json

import msg_cs_pb2
import conf_game_pb2

static_root = os.path.join(os.path.dirname(__file__),'static/')
template_root = os.path.join(os.path.dirname(__file__),'templates/')

define("port", default=58211, help="run on the given port", type=int)

def login(pack):
    ret = msg_cs_pb2.LoginRsp()
    ret.result = 0
    ret.source = 1
    ret.currency = "G"
   
    cs = msg_cs_pb2.CS()
    cs.msg_type = 9
    cs.login_rsp.CopyFrom(ret)
    return cs

def enter_room_req(pack):
    ret = msg_cs_pb2.SEnterTableRsp()
    ret.error_code = 0
    ret.serverinfo = "Dyson Server"
    ret.room_id = 1
    ret.table_id = 2
    ret.room_type = 1
   
    cs = msg_cs_pb2.CS()
    cs.msg_type = 22
    cs.enter_table_rsp.CopyFrom(ret)
    return cs

def start_pack(state,time):
   
    ret = msg_cs_pb2.STimerNotify()
    ret.timeStamp = 1482974596
    ret.timeLeft = time
    ret.status = state
    ret.order_id = "5864656010113"
   
    cs = msg_cs_pb2.CS()
    cs.msg_type = 32
    cs.timer_notify.CopyFrom(ret)
    return cs

def Customer(pack):
    
#    print pack.try_enter_table_req.room_id
    act =  pack.try_enter_table_req.room_id
    if act == 0:
       return start_pack(1,2)
    if act == 1:
       return start_pack(2,4)
    if act == 2:
       return start_pack(3,12)
    if act == 3:
       return start_pack(4,3)
    if act == 4:
       return start_pack(5,13)
    if act == 5:
       return start_pack(6,8)


def pack_handle(pack):
    switcher = {
        8:login,
       21:enter_room_req,
        13:Customer
    }

    func = switcher.get(pack.msg_type,lambda:"nothing")
    return func(pack)

class Application(tornado.web.Application):

    def __init__(self):
        handlers = [
            (r"/", wshandler)
        ]
        settings = dict(
            cookie_secret="__TODO:_GENERATE_YOUR_OWN_RANDOM_VALUE_HERE__",
            template_path=os.path.join(os.path.dirname(__file__), "templates"),
            static_url_prefix=os.path.join(os.path.dirname(__file__), "/static/"),
            xsrf_cookies=True,
        )
        tornado.web.Application.__init__(self, handlers, **settings)

class wshandler(tornado.websocket.WebSocketHandler):
   
    client = set() 
    def check_origin(self,origin):
        print "origin = %s " % origin
        return True

    def open(self):
        print "cliet open "

    def on_close(self):
        print "close"

    def on_message(self,data):
        CS = msg_cs_pb2.CS()
        CS.ParseFromString(data)
        print CS.msg_type
        ret = pack_handle(CS)
        if  ret != None :
            self.write_message(ret.SerializeToString(),binary=True)
        return

def main():
    tornado.options.parse_command_line()
    app = Application()
    app.listen(options.port)

    print tornado.ioloop.IOLoop.instance()
    tornado.ioloop.IOLoop.instance().start()

if __name__ == "__main__":
    main()
