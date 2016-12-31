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
	
	public class DealCardNotifyCommand extends Command implements ICommand
	{
		public function DealCardNotifyCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == ENCSType.CS_TYPE_DEAL_CARD_NOTIFY.toString()){
				deal(notification.getBody() as CS);
			}
		}
		
		private function deal(cs:CS):void
		{			
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			
			bullData.roomData.card_info.push(cs.deal_card_notify.banker);
			bullData.roomData.card_info.push(cs.deal_card_notify._1);
			bullData.roomData.card_info.push(cs.deal_card_notify._2);
			bullData.roomData.card_info.push(cs.deal_card_notify._3);
			bullData.roomData.card_info.push(cs.deal_card_notify._4);
			
			sentNotification(BullNotification.CARD_NOTIFY);
			
		}
		
		
		
	}
}