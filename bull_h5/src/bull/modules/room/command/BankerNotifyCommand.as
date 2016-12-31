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
	
	public class BankerNotifyCommand extends Command implements ICommand
	{
		public function BankerNotifyCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == ENCSType.CS_TYPE_BANKER_LIST_NOTIFY.toString()){
				bankerlist(notification.getBody() as CS);
			}
			else if(notification.getName() == ENCSType.CS_TYPE_BANKER_NOTIFY.toString()){
				newbaner(notification.getBody() as CS);
			}
			else if(notification.getName() == ENCSType.CS_TYPE_BANKER_CALCULATE_NOTIFY.toString()){
				banker_calcu(notification.getBody() as CS);
			}
		}
		
		private function bankerlist(cs:CS):void
		{			
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			
			bullData.roomData.banker_num = cs.banker_list_notify.player_count;
			bullData.roomData.bankerlist = cs.banker_list_notify.user_info_s;
			
			sentNotification(BullNotification.BANKER_LIST);
			
		}
		
		private function newbaner(cs:CS):void
		{			
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			bullData.roomData.newBaner_info = cs.banker_notify;			
			
			sentNotification(BullNotification.BANKER_LIST);			
		}
		
		private function banker_calcu(cs:CS):void
		{			
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			bullData.roomData.Banker_calcu_info = cs.banker_calc_notify;
			
			sentNotification(BullNotification.BANKER_CALCU);			
		}
		
	}
}