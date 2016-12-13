package BullHall.command
{	
	
	
	import BullHall.event.BullHallEvent;
	import BullHall.event.SocketEvent;
	import BullHall.model.HallAppMedel;
	import BullHall.service.LocalcnnService;
	import BullHall.service.SocketService;
	
	import conf.SNetAddress;
	
	import msg.CS;
	import msg.ENCSType;
	import msg.ENError;
	import msg.STryEnterTableReq;
	import msg.STryEnterTableRsp;
	
	public class JoinTableCommand
	{
		[Inject]
		public var evt:IEventDispatcher;
		
		[Inject]
		public var appMedel:HallAppMedel;
		
		[Inject]
		public var socket:SocketService;
		
		[Inject]
		public var localcnn:LocalcnnService;
		
		public function JoinTableCommand()
		{
		}
		
		public function execute(e:BullHallEvent):void
		{
			switch(e.type)
			{
				case BullHallEvent.JoinTable_Request:
					request();
					break;
				case String(ENCSType.CS_TYPE_TRY_ENTER_TABLE_RSP):
					Response(e.data as CS);
					break;
			}
		}
		
		private function request():void{
			
			//本地限制 check
			
			//多開
			if(localcnn.getClinetLength() >= 1){				
				
				evt.dispatchEvent(new BullHallEvent(BullHallEvent.MsgCode_NotOpenTwoClient));
				return;
			}
			
			//TODO check餘額不足以加入
//			if(1)
//			{
//				//evt.dispatchEvent(new CarHallEvent(CarHallEvent.MsgCode_NoEnoughMoney));
//				evt.dispatchEvent(new CarHallEvent(CarHallEvent.Multi_Login));
//				//evt.dispatchEvent(new CarHallEvent(CarHallEvent.ErrorCode, ENError.ERROR_SERVER_STOPPED));
//				//evt.dispatchEvent(new SocketEvent(SocketEvent.CONNECT_FAIL)); 
//				return;
//			}
			
			
			var cs:CS = new CS(); 
			cs.msgType = ENCSType.CS_TYPE_TRY_ENTER_TABLE_REQ;
			var req:STryEnterTableReq = new STryEnterTableReq();
			
			req.roomType = appMedel.room_type;
			
			//從roomlist 拿 rood_id
			var roomOb:Object = appMedel.roomLists[appMedel.join_group];
			req.roomId =roomOb["roomId"];
			
			//房間限紅
			appMedel.roomParam.roomlimit = roomOb["roomLimit"];
			
			cs.tryEnterTableReq = req;
			evt.dispatchEvent(new SocketEvent(SocketEvent.SEND, cs));
		}
		
		private function Response(cs:CS):void
		{			
			var rsp:STryEnterTableRsp = cs.tryEnterTableRsp;			
			switch(rsp.errorCode)
			{
				case 0:
						var cu:int = rsp.currency;
						//pMedel.Join_roomId= rsp.roomId;
						
						var ip_add_port:conf.SNetAddress = rsp.netAddress;											
						appMedel.join_IP = ip_add_port.ip;
						appMedel.join_Port =  ip_add_port.port;
						
						appMedel.Lobby_token = rsp.token;
						
						//平台額度檢查
						evt.dispatchEvent(new BullHallEvent(BullHallEvent.Credit_Check));		
						
					break;
				default:
					evt.dispatchEvent(new BullHallEvent(BullHallEvent.ErrorCode, rsp.errorCode));
					break;
			}
		}
	}
}