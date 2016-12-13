package BullHall.command
{
	
	
	import BullHall.common.Common;
	import BullHall.event.BullHallEvent;
	import BullHall.event.SocketEvent;
	import BullHall.manager.Loger;
	import BullHall.model.HallAppMedel;
	import BullHall.model.GameConfig;
	import BullHall.service.SocketService;
	import BullHall.service.WebService;
	
	import msg.CS;
	import msg.ENCSType;
	import msg.GetPlayerEnterStateReq;
	import msg.GetPlayerEnterStateRsp;
	import msg.PlayerEnterNotify;
	import msg.PlayerLeaveNotify;

	public class OtherPlaceLoginCommand
	{
		[Inject]
		public var evt:IEventDispatcher;
		
		[Inject]
		public var appMedel:HallAppMedel;
		
		[Inject]
		public var config:GameConfig;
		
		[Inject]
		public var socket:SocketService;
		
		[Inject]
		public var webService:WebService;
		
		public function execute(e:BullHallEvent):void
		{
			switch(e.type)
			{
//				case String(ENCSType.CS_TYPE_PLAYER_ENTER_NOTIFY):
//					playerEnterNotifyHandler(e.data as CS);
//					break;
//				case String(ENCSType.CS_TYPE_PLAYER_LEAVE_NOTIFY):
//					playerLeaveNotifyHandler(e.data as CS);
//					break;
			}
		}
		
		private function playerEnterNotifyHandler(cs:CS):void
		{
//			var rsp:PlayerEnterNotify = cs.playerEnterNotify;
//			if(rsp.hasTableId)
//				Common.curTableId = rsp.tableId;
//			else
//				Common.curTableId = -1;
//			Loger.get().logPrint("服务器通知玩家进入游戏 tableId:"+Common.curTableId);
		}
		
		private function playerLeaveNotifyHandler(cs:CS):void
		{
//			var rsp:PlayerLeaveNotify = cs.playerLeaveNotify;
//			Common.curTableId = -1;
//			webService.update_balance();
//			Loger.get().logPrint("服务器通知玩家离开游戏 tableId:"+Common.curTableId);
		}
		
	}
}