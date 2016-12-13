package BullHall.command
{
	import com.netease.protobuf.UInt64;
	
	
	
	import BullHall.event.BullHallEvent;
	import BullHall.event.SocketEvent;
	import BullHall.manager.Loger;
	import BullHall.model.HallAppMedel;
	import BullHall.model.GameConfig;
	import BullHall.service.SocketService;
	
	import msg.CS;
	import msg.ENCSType;
	import msg.ENPlatformType;
	import msg.LoginReq;
	import msg.LoginRsp;

	public class LoginCommand
	{
		[Inject]
		public var evt:IEventDispatcher;
		
		[Inject]
		public var appMedel:HallAppMedel;
		
		[Inject]
		public var config:GameConfig;
		
		[Inject]
		public var socket:SocketService;
		
		public function execute(e:BullHallEvent):void
		{
			switch(e.type)
			{
				case BullHallEvent.Login_Request:
					loginRequest();
					break;
				case String(ENCSType.CS_TYPE_LOGIN_RSP):
					loginResponse(e.data as CS);
					break;
			}
		}
		
		private function loginRequest():void
		{
			var cs:CS = new CS(); 
			cs.msgType = ENCSType.CS_TYPE_LOGIN_REQ;
			var req:LoginReq = new LoginReq();
			req.uid = UInt64.parseUInt64(config.userInfo.user_id);
			req.verifySig = appMedel.access_token;
			req.platform = ENPlatformType.PLATFORM_TYPE_WEB;
			cs.loginReq = req;
			evt.dispatchEvent(new SocketEvent(SocketEvent.SEND, cs));
		}
		
		private function loginResponse(cs:CS):void
		{
			Loger.get().logPrint("登录返回 result="+cs.loginRsp.result);
			var rsp:LoginRsp = cs.loginRsp;
			switch(rsp.result)
			{
				case 0:
					//appMedel.roomParam.isCanUseCoin = rsp.currency.coin;
					//appMedel.roomParam.isCanUseCash = rsp.currency.cash;
					//appMedel.roomParam.isCanUseNm = rsp.currency.nm;
					
					evt.dispatchEvent(new BullHallEvent(BullHallEvent.Heart_Start));
					evt.dispatchEvent(new BullHallEvent(BullHallEvent.Roomlist_Request));					
					break;
				default:
					evt.dispatchEvent(new BullHallEvent(BullHallEvent.ErrorCode, rsp.result));
					break;
			}
		}
	}
}