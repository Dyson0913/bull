package bull.modules.common.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;	
	
	import com.lightUI.core.Light;
	import laya.utils.Handler;
	import com.lightUI.components.alert.Alert;
	import bull.view.alert.AlertPanel
	
	import bull.events.BullNotification;	
	import bull.modules.common.model.data.HallData;
	import bull.modules.room.services.RoomSocketService;
	
	public class ConnectRoomCommand extends Command implements ICommand
	{
		public function ConnectRoomCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName().toString() == BullNotification.ROOM_SOCKET_CONNECT){
				connectRoom();
			}else if(notification.getName().toString() == BullNotification.ROOM_SOCKET_CONNECT_COMPLETE){
				onConnectRoomComplete();
			}else if(notification.getName().toString() == BullNotification.ROOM_SOCKET_CONNECT_FAILED){				
				Alert.show("无法连接到游戏服务器。", "",AlertPanel,null, Handler.create(this, Server_not_open));
			}
		}
		
		private function onConnectRoomComplete():void
		{		
			sentNotification(BullNotification.LOGIN_ROOM_RQS);
		}
		
		private function connectRoom():void
		{
			var hallData:HallData = getSingleton(HallData.NAME) as HallData;						
			
			var roomSocketService:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			roomSocketService.connect(hallData.ip,hallData.port);
		}
		
		 private function Server_not_open():void{
			sentNotification(BullNotification.ExitRoomEvent);
		}
	}
}