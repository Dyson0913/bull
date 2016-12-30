package bull.modules.common.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import bull.events.BullNotification
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.Data;
	import bull.modules.room.mediator.BullScenceMediator;
	import bull.modules.room.services.RoomSocketService;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class RoomHeartBeatCommand extends Command implements ICommand
	{
		public function RoomHeartBeatCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == BullNotification.ROOM_HEART_BEAT){
				heartReqHandler();
			}else if(notification.getName() == ENCSType.CS_TYPE_HEART_BEAT_RSP.toString()){
				heartRspHandler(notification.getBody() as CS);
			}
		}
		
		private function heartReqHandler():void
		{
			var bullData:Data = getSingleton(Data.NAME) as Data;
			bullData.roomHeartBeat = true;						
			var socket:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_HEART_BEAT_REQ;
			out.heart_beat_req = proto.msg_proto.getHeartBeatReq()
			
			socket.sentMsg(out);			
		}
		
		private function heartRspHandler(cs:CS):void
		{
			trace("Room heartRspHandler");
			var bullData:Data = getSingleton(Data.NAME) as Data;
			if(!bullData.roomHeartBeat) return;
			bullData.roomHeartBeat = false;
			(getMediator(BullScenceMediator.NAME) as BullScenceMediator).receiveHeartBeat();
		}
	}
}