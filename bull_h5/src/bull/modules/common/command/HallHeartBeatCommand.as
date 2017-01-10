package bull.modules.common.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import bull.events.BullNotification;
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.Data;
	import bull.modules.BullHall.mediator.HallMediator;
	import bull.modules.BullHall.service.HallSocketService;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class HallHeartBeatCommand extends Command implements ICommand
	{
		public function HallHeartBeatCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == BullNotification.HALL_HEART_BEAT.toString()){
				heartReqHandler();
			}else if(notification.getName() == ENCSType.CS_TYPE_HEART_BEAT_RSP.toString()){
				heartRspHandler(notification.getBody() as CS);
			}
		}
		
		private function heartReqHandler():void
		{			
			var bullData:Data = getSingleton(Data.NAME) as Data;
			bullData.hallHeartBeat = true;
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_HEART_BEAT_REQ;
			out.heart_beat_req = proto.msg_proto.getHeartBeatReq()
			
			var socket:HallSocketService = getModel(HallSocketService.NAME) as HallSocketService;
			socket.sentMsg(out);
		}
		
		private function heartRspHandler(cs:CS):void
		{
			trace("heartRspHandler");		
			var bullData:Data = getSingleton(Data.NAME) as Data;
			//if(!bullData.hallHeartBeat) return;
			bullData.hallHeartBeat = false;
			(getMediator(HallMediator.NAME) as HallMediator).receiveHeartBeat();
		}
	}
}