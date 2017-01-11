package bull.modules.common.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import conf.ENRoomType;
	import conf.SRoomConfig;
	import conf.SRoomInfo;
	import conf.SRoomInfos;
	
	import laya.utils.Handler;
	
	import com.lightUI.core.Light;
	import com.lightUI.components.alert.Alert;
	import bull.view.alert.AlertCancelPanel
	
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.Data;	
	import bull.modules.BullHall.service.HallSocketService;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class RoomListCommand extends Command implements ICommand
	{
		public function RoomListCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == ENCSType.CS_TYPE_GET_ROOM_LIST_REQ.toString()){
				roomListRequestHandler();
			}else if(notification.getName() == ENCSType.CS_TYPE_GET_ROOM_LIST_RSP.toString()){
				roomListResponseHandler(notification.getBody() as CS);
			}
		}
		
		private function roomListRequestHandler():void{			
			
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_GET_ROOM_LIST_REQ;
			out.get_room_list_req = proto.msg_proto.getSGetRoomListReq();
			
			var socket:HallSocketService = getModel(HallSocketService.NAME) as HallSocketService;
			socket.sentMsg(out);
			
		}
		
		private function roomListResponseHandler(param:CS):void{
			trace("roomListResponseHandler",param);
			
			var bulldata:Data = getSingleton(Data.NAME) as Data;
			
			if ( param.get_room_list_rsp.error_code != 0)
			{
				Alert.show("无法取得桌资讯!", "", AlertPanel);
				return;
			}			
			
			var list:SRoomInfos = param.get_room_list_rsp.room_infos as SRoomInfos;
			var l:int = list.roominfo.length;
			var roomList:Array = [];			
			for (var i:int = 0; i < l; i++) 
			{							
				roomList.push(list.roominfo[i]);
			}
			bulldata.hallData.roomList = roomList;			
			
			//己經在桌內處理
			if ( param.get_room_list_rsp.room_id != null)
			{				
				//找出己經在房的ROOM id
				for (var i:int = 0; i < bulldata.hallData.roomList.length ; i++)
				{
					var roominfo:SRoomInfo = bulldata.hallData.roomList[i] as SRoomInfo;
					var config:SRoomConfig = roominfo.config;					
					
					if (config.room_id == param.get_room_list_rsp.room_id)
					{
						bulldata.hallData._already_in_room_idx = i;
						break;
					}				
				}				
				var roominfo:SRoomInfo = bulldata.hallData.roomList[bulldata.hallData._already_in_room_idx] as SRoomInfo;
				var config:SRoomConfig = roominfo.config;
				var str:String = "";
				if (config.room_type == ENRoomType.ROOM_TYPE_COIN) str = "G币场" + " - " +config.room_name;				
				else str = "现金场" + " - " +config.room_name;				
				
				trace("---------room str" + str);
				bulldata.hallData._already_in_msg = "您正在" + str  +" \n桌进行游戏，是否进入？";				
			}
			else bulldata.hallData._already_in_room_idx = -1;
			
		}
		
		
	}
}