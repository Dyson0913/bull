package BullHall.command
{
	
	
	import BullGame.event.NewNewGameEvent;
	
	import BullHall.common.Common;
	import BullHall.event.BullHallEvent;
	import BullHall.event.SocketEvent;
	import BullHall.manager.LayerManager;
	import BullHall.manager.Loger;
	import BullHall.manager.MessageCodeMgr;
	import BullHall.model.HallAppMedel;
	import BullHall.model.GameConfig;
	import BullHall.service.SocketService;
	
	import KGameComponents.assetsInPanel.AssetsInEvent;
	
	import conf.ENMoneyType;
	import conf.ENRoomType;
	
	import kg.components.alert.Alert;
	import kg.components.alert.IAlertWindow;
	import kg.core.CompInfoVO;
	import kg.events.WindowEvent;
	
	import msg.CS;
	import msg.CS_Table;
	import msg.ENCSType;
	import msg.NoticeInfo;
	import msg.PushNoticeNotify;
	import msg.SBankerCalculateNotify;

	public class MessageCommand
	{
		[Inject]
		public var evt:IEventDispatcher;
		
		[Inject]
		public var appMedel:HallAppMedel;
		
		[Inject]
		public var config:GameConfig;
		
		[Inject]
		public var socket:SocketService;
		
		private  var _pop_windows:IAlertWindow; 
		
		public function execute(e:BullHallEvent):void
		{
			switch(e.type)
			{
				case SocketEvent.CONNECT_FAIL:					
					var alertMsg:String = MessageCodeMgr.getInstance().getMessage("4");
					pop_window(alertMsg,connectFail);
					break; 
				case SocketEvent.CONNECT_FINISH:
					//DO nothing
					break;
				case BullHallEvent.MsgCode_NotOpenTwoClient:
					alertMsg = MessageCodeMgr.getInstance().getMessage("5");
					pop_window(alertMsg,Onclose);
					break;
				case BullHallEvent.MsgCode_NoEnoughMoney:
					alertMsg = MessageCodeMgr.getInstance().getMessage("6");
					pop_window(alertMsg,Onclose);	
					break;
				case BullHallEvent.Multi_Login:
					alertMsg = MessageCodeMgr.getInstance().getMessage("1");
					pop_window(alertMsg,Onclose);	
					break;					
				case BullHallEvent.MsgCode_MultiOpen:
					alertMsg = "您正在 ";
					if( appMedel.already_join_roomType == conf.ENRoomType.ROOM_TYPE_CASH_NM )
					{
						alertMsg += "现金场";
					}
					else alertMsg += "G币场";
					
					var join_group:int = appMedel.already_join_roomId;
					
					var roomOb:Object = appMedel.roomLists[appMedel.already_join_roomId];
					alertMsg += ("-" +roomOb["roomName"]+ " \n桌进行游戏，是否进入？");
					
					pop_window(alertMsg,Join_old_table);			
					
					break;
				case String(ENCSType.CS_TYPE_PUSH_NOTICE_NOTIFY):
				{
					push_notify(e.data as CS);
				}
			}
			
		}
		
		private function push_notify(cs:CS):void 
		{
			var data:PushNoticeNotify = cs.pushNoticeNotify;
			var n:int =data.notices.length;
			
			appMedel.pushmsg = [];
			for(var i:int =0;i<n;i++)
			{
				var notice:NoticeInfo = data.notices[i];
				
				appMedel.pushmsg.push(notice.content);
			}
			evt.dispatchEvent(new BullHallEvent(BullHallEvent.push_msg_notify));			
		}
		
		private function pop_window(msg:String,callback:Function):void
		{			
			_pop_windows = Alert.show(msg,"",LayerManager.getInstance().layerBottom,new CompInfoVO("comp_AlertWindow_alertwindow_ok",Common.SwfName));				
			_pop_windows.addEventListener(WindowEvent.CLOSE,callback); 
		}
		
		private function connectFail(e:WindowEvent):void
		{
			_pop_windows.removeEventListener(WindowEvent.CLOSE, connectFail); 
			socket.reconnect(config.ip, config.port); 
			//干掉菊花
			LayerManager.getInstance().loadingMask.clear();
		}
		
		private function Onclose(e:WindowEvent):void
		{
			if(e.data == "ok_btn")
			{
				_pop_windows.removeEventListener(WindowEvent.CLOSE, Onclose); 			
			}			
		}
		
		private function Join_old_table(e:WindowEvent):void
		{
			if(e.data == "ok_btn")
			{
				_pop_windows.removeEventListener(WindowEvent.CLOSE,Join_old_table); 
				//走手動加入流程
				appMedel.room_type =  appMedel.already_join_roomType;
				appMedel.join_group = appMedel.already_join_roomId;
				evt.dispatchEvent(new BullHallEvent(BullHallEvent.JoinTable_Request));							
			}
		}
		
	}
}