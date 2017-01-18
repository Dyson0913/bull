package bull.modules.common.command
{
	import bull.modules.room.services.RoomSocketService;
	import com.IProtobuf.Long;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightMVC.parrerns.Mediator;
	import msg.ExitTableRsp;
	import msg.SExitTableRsp;
	
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
				case ENCSType.CS_TYPE_EXIT_TABLE_RSP.toString():
					exit_game(noti.getBody() as CS);
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
			
			//TODO
			//(getMediator(HallMediator.NAME) as HallMediator).sendHeartBeat();
			
			//請求房間列表
			sentNotification(ENCSType.CS_TYPE_GET_ROOM_LIST_REQ.toString());				
		}
		
		private function returnHallReq():void
		{
			trace("-----------------back to hall");
			var bullData:Data = getSingleton(Data.NAME) as Data;
			bullData.hallData.ViewIn = "Lobby";
			
			
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_EXIT_TABLE_REQ;
			
			
			var roomService:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;			
			roomService.sentMsg(out);
			
		}
		
		private function exit_game(cs:CS):void
		{
			var rsp:SExitTableRsp = cs.exit_table_rsp;
			switch(rsp.error_code)
			{
				case 0:
					trace("============exit_game ok"  );
					sentNotification(BullNotification.Change_to_Lobby);
				break;
			}
		}
		
	}
}