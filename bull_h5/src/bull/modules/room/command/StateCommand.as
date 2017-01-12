package bull.modules.room.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import bull.events.BullNotification;
	import light.car.modules.common.model.data.HallData;
	import bull.modules.common.model.data.RoomData;
	import bull.modules.perload.services.PreLoadService;
	import bull.modules.common.model.data.Data;
	
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
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			bullData.roomData.State = cs.timer_notify.status;
			bullData.roomData.RoundID = cs.timer_notify.order_id;			
			bullData.roomData.LeftTime = cs.timer_notify.timeLeft;
			
			
			//留2秒動畫時間
			if (cs.timer_notify.status == RoomData.END) bullData.roomData.LeftTime -= 2;
			
			sentNotification(BullNotification.STATE_CHANGE);
			
		}
	}
}