package bull.modules.room.command
{
	import bull.modules.common.model.data.RoomData;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import bull.events.BullNotification;	
	import bull.modules.perload.services.PreLoadService;
	import bull.modules.common.model.data.Data;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class SettleNotifyCommand extends Command implements ICommand
	{
		public function SettleNotifyCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == ENCSType.CS_TYPE_CALCULATE_NOTIFY.toString()){
				settle(notification.getBody() as CS);
			}
		}
		
		private function settle(cs:CS):void
		{	
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;			
			
			roomData.settle_banker_id = cs.calculate_notify.banker_id;
			roomData.settle_win_money = cs.calculate_notify.win_money;
			roomData.settle_hand_money = cs.calculate_notify.hand_money;
			roomData.settle_User_info = cs.calculate_notify.user_info_s;
			
			roomData.Total_money = roomData.settle_hand_money;
			
			sentNotification(BullNotification.SETTLE_NOTIFY);
			
		}
		
		
		
	}
}