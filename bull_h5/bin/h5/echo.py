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

define("port", default=58210, help="run on the given port", type=int)

def heart(pack):
    ret = msg_cs_pb2.HeartBeatRsp()
    
    cs = msg_cs_pb2.CS()
    cs.msg_type = 4
    cs.heart_beat_rsp.CopyFrom(ret)
    return cs

def login(pack):
    ret = msg_cs_pb2.LoginRsp()
    ret.result = 0
    ret.source = 1
    ret.currency = "G"
   
    cs = msg_cs_pb2.CS()
    cs.msg_type = 9
    cs.login_rsp.CopyFrom(ret)
    return cs

def get_room_list(pack):

    maxbet_config = [1000,10000,1000,10000]
    minbet_config = [100,1000,100,1000]
    playerlimit_config = [2000,20000,2000,20000]
    roomlimit_config = [20000,200000,20000,200000]
    bankerlimit_config = [200000,2000000,200000,2000000]
    roomname_config = ["Glow","Ghigh","Mlow","mhigh"]
    roomtype_config = [1,1,2,2]
    roominfos  = [] 
    for i in range(4):
        ret = conf_game_pb2.SRoomConfig()
        ret.room_id = 1
        ret.room_type = roomtype_config[i]
        ret.min_bet = minbet_config[i]
        ret.max_bet = maxbet_config[i]
        ret.room_name = roomname_config[i]
        ret.max_player = 100
        ret.room_limit = roomlimit_config[i]
        ret.player_limit = playerlimit_config[i]
        ret.banker_limit = bankerlimit_config[i]
        ret.banker_times = 10
        ret.is_robbery = True
        ret.time_id = 1
        roominfos.append(ret)


    Sroominfo = []
    for i in range(4):
        room_info  = conf_game_pb2.SRoomInfo()
        room_info.config.CopyFrom(roominfos[i])
        room_info.cur_player = 0
        Sroominfo.append(room_info)        

    
    ret = msg_cs_pb2.SGetRoomListRsp()
    ret.error_code = 0
    ro = conf_game_pb2.SRoomInfos()
    #repeat push
    
    for i in range(4):
        ro.roominfo.add().CopyFrom(Sroominfo[i])

    ret.room_infos.CopyFrom(ro)
#    ret.net_address
#    ret.token    

 
    cs = msg_cs_pb2.CS()
    cs.msg_type = 12
    cs.get_room_list_rsp.CopyFrom(ret)
    return cs

def enter_room_req(pack):
    ret = msg_cs_pb2.STryEnterTableRsp()
    ret.error_code = 0 
    ret.room_type = 1
    ret.room_id = 1
    net  = conf_game_pb2.SNetAddress()
    net.ip = "52.68.210.98"
    net.port = 58211
    ret.net_address.CopyFrom(net)
    ret.token = 123
   
    cs = msg_cs_pb2.CS()
    cs.msg_type = 14
    cs.try_enter_table_rsp.CopyFrom(ret)
    return cs


def pack_handle(pack):
    switcher = {
        3:heart,
        8:login,
       11:get_room_list, 
       13:enter_room_req
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
