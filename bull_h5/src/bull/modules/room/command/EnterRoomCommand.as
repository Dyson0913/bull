package bull.modules.room.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import bull.events.BullNotification;
	import light.car.modules.common.model.data.HallData;
	import light.car.modules.common.model.data.RoomData;
	import bull.modules.perload.services.PreLoadService;
	
	public class EnterRoomCommand extends Command implements ICommand
	{
		public function EnterRoomCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == BullNotification.ENTER_ROOM){
				enterRoomRqsHandler(notification.getBody());
			}
		}
		
		private function enterRoomRqsHandler(data:*):void
		{
			var preLoad:PreLoadService =  getModel(PreLoadService.NAME) as PreLoadService;
			preLoad.loadRoom();
		}
	}
}