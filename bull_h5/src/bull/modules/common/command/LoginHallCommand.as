package bull.modules.common.command
{
	import com.IProtobuf.Long;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightMVC.parrerns.Mediator;
	
	import bull.events.BullNotification;
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.Data;
	import bull.modules.BullHall.mediator.HallMediator;
	import bull.modules.BullHall.service.HallSocketService;
	
	
	import msg.CS;
	import msg.ENCSType;
	import msg.ReturnHallReq;
	import msg.ReturnHallRsp;
	
	public class LoginHallCommand extends Command implements ICommand
	{
		public function LoginHallCommand()
		{
			super();
		}
		
		override public function handler(noti:INotification):void
		{
			switch(noti.getName())
			{
				case BullNotification.LOGIN_HALL_RQS:
					hallLoginReqHandler();
					break;
				case ENCSType.CS_TYPE_LOGIN_RSP.toString():
					hallLoginRspHandler(noti.getBody() as CS);
					break;
				case BullNotification.Leave_Game:
					returnHallReq();
					break;
				case ENCSType.CS_TYPE_RETURN_HALL_RSP.toString():
					returnHallRsp(noti.getBody() as CS);
					break;
			}
		}
		
		private function hallLoginReqHandler():void{
			
			var bullData:Data = getSingleton(Data.NAME) as Data;
			
			bullData.truthLogin = true;
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();			
			out.msg_type = ENCSType.CS_TYPE_LOGIN_REQ;
			out.login_req = proto.msg_proto.getLoginReq();
			out.login_req.uid = Long.fromNumber(bullData.uid);
			out.login_req.verify_sig = bullData.token;
			
			var socket:HallSocketService = getModel(HallSocketService.NAME) as HallSocketService;
			socket.sentMsg(out);
			
		}
		
		private function hallLoginRspHandler(msg:CS):void{
			trace("hall hallLoginRspHandler",msg);
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			if ( bullData.hallData.ViewIn != "Lobby" )
			{
				trace("hall 在遊戲 return");
				return;			
			}
			
			if (bullData.truthLogin) {
				//TODO 
				//(getMediator(HallMediator.NAME) as HallMediator).sendHeartBeat();				
			}
			bullData.truthLogin = false;
			
			//請求房間列表
			sentNotification(ENCSType.CS_TYPE_GET_ROOM_LIST_REQ.toString());				
		}
		
		private function returnHallReq():void
		{
			trace("-----------------back to hall");
			var bullData:Data = getSingleton(Data.NAME) as Data;
			bullData.hallData.ViewIn = "Lobby";
			return;
			
			var proto:CarProtoModel = getModel(CarProtoModel.NAME) as CarProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_RETURN_HALL_REQ;
			var req:ReturnHallReq = proto.msg_proto.getReturnHallReq();
			out.return_hall_req = req;
			var socket:HallSocketService = getModel(HallSocketService.NAME) as HallSocketService;
			socket.sentMsg(out);
		}
		
		private function returnHallRsp(cs:CS):void
		{
			var rsp:ReturnHallRsp = cs.return_hall_rsp;
			switch(rsp.result)
			{
				case 0:
					trace("returnHallRsp rsp:",rsp);
					sentNotification(ENCSType.CS_TYPE_GET_TABLE_LIST_REQ.toString());
//					sentNotification(ENCSType.CS_TYPE_GET_PLAYER_ENTER_STATE_REQ.toString());
					break;
				default:
					trace("returnHallRsp ........... errorCode:" + rsp.result);
					
					break;
			}
		}
		
	}
}