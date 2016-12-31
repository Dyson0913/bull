package bull.modules.room.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import bull.events.BullNotification;	
	import bull.modules.perload.services.PreLoadService;
	import bull.modules.common.model.data.Data;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class UserNotifyCommand extends Command implements ICommand
	{
		public function UserNotifyCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == ENCSType.CS_TYPE_ALL_USER_INFO_NOTIFY.toString()){
				alluser(notification.getBody() as CS);
			}			
			else if(notification.getName() == ENCSType.CS_TYPE_ONE_USER_INFO_NOTIFY.toString()){
				oneuser(notification.getBody() as CS);
			}			
		}
		
		private function alluser(cs:CS):void
		{			
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			
			bullData.roomData.player_num = cs.all_user_info_notify.player_count;
			bullData.roomData.playerList = cs.all_user_info_notify.user_info_s;		
			
			sentNotification(BullNotification.USER_NOTIFY);
			
		}
		
		private function oneuser(cs:CS):void
		{			
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			
			bullData.roomData.playerList.push(cs.one_user_info_notify.user_info);
			
			sentNotification(BullNotification.USER_NOTIFY);
			
		}
		
	}
}