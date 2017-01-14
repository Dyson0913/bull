package bull.modules.room.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import bull.events.BullNotification;	
	import bull.modules.common.model.data.RoomData;
	import bull.modules.perload.services.PreLoadService;	
	
	import msg.CS;
	import msg.ENCSType;
	
	public class StateCommand extends Command implements ICommand
	{
		public function StateCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == ENCSType.CS_TYPE_TIMER_NOTIFY.toString()){
				State(notification.getBody() as CS);
			}			
		}
		
		private function State(cs:CS):void
		{	
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;			
			roomData.State = cs.timer_notify.status;
			roomData.RoundID = cs.timer_notify.order_id;
			roomData.LeftTime = cs.timer_notify.timeLeft;
			
			
			//留2秒動畫時間
			if (cs.timer_notify.status == RoomData.END) roomData.LeftTime -= 2;
			
			//deal 13
			trace("===================================狀態 " + roomData.State + " 秒數 " + roomData.LeftTime);			
			
			
			sentNotification(BullNotification.STATE_CHANGE);
			
		}
	}
}