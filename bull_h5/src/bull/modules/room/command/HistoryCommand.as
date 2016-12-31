package bull.modules.room.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	
	import bull.events.BullNotification;
	import light.car.modules.common.model.data.HallData;
	import light.car.modules.common.model.data.RoomData;
	import bull.modules.perload.services.PreLoadService;
	import bull.modules.common.model.data.Data;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class HistoryCommand extends Command implements ICommand
	{
		public function HistoryCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == ENCSType.CS_TYPE_GET_HISTORY_NOTIFY.toString()){
				State(notification.getBody() as CS);
			}			
		}
		
		private function State(cs:CS):void
		{			
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			
			bullData.roomData.history_Win_info.length = 0;
			bullData.roomData.history_lost_info.length = 0;
			bullData.roomData.history_result_info.length = 0;
			
			for (var i:int = 0; i < 4; i++)
			{
				bullData.roomData.history_Win_info = [cs.histroy_notify.win_info._1, cs.histroy_notify.win_info._2, cs.histroy_notify.win_info._3, cs.histroy_notify.win_info._4];
				bullData.roomData.history_lost_info = [cs.histroy_notify.lose_info._1, cs.histroy_notify.lose_info._2, cs.histroy_notify.lose_info._3, cs.histroy_notify.lose_info._4];
			}
			
			var n:int = cs.histroy_notify.result_info.length;
			for (var i:int = 0; i < n; i++)
			{
				bullData.roomData.history_result_info.push([cs.histroy_notify.result_info._1, cs.histroy_notify.result_info._2, cs.histroy_notify.result_info._3, cs.histroy_notify.result_info._4]);
			}			
			
			sentNotification(BullNotification.HISTORY_NOTIFY);
			
		}
	}
}