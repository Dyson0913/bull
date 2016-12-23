package bull.modules.common.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.Data;
	import light.car.modules.common.model.data.vo.HallRoomVO;
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
			out.get_room_list_req = proto.msg_proto.getSGetRoomListReq()
			
			var socket:HallSocketService = getModel(HallSocketService.NAME) as HallSocketService;
			socket.sentMsg(out);
			
		}
		
		private function roomListResponseHandler(param:CS):void{
			trace("roomListResponseHandler",param);
			return;
			var bulldata:Data = getSingleton(Data.NAME) as Data;
			
			var list:Array = param.get_room_list_rsp
			var l:int = list.length;
			var roomList:Array = [];
			var room:HallRoomVO;
			for (var i:int = 0; i < l; i++) 
			{
				room = new HallRoomVO();
				room.parse(list[i]);
				roomList.push(room);
			}
			cardata.hallData.roomList = roomList;
		}
	}
}