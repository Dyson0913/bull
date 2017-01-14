package bull.modules.room.command
{
	import bull.modules.common.model.data.RoomData;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import conf.SDealInfo;
	
	import bull.events.BullNotification;	
	import bull.modules.perload.services.PreLoadService;	
	
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
			trace("============================發牌資訊");
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			
			roomData.card_info.length = 0;
			roomData.card_info.push(cs.deal_card_notify.banker);
			roomData.card_info.push(cs.deal_card_notify._1);
			roomData.card_info.push(cs.deal_card_notify._2);
			roomData.card_info.push(cs.deal_card_notify._3);
			roomData.card_info.push(cs.deal_card_notify._4);
			
			roomData.each_zone_win.length = 0;
			roomData.each_zone_display.length = 0;
			for ( var i:int = 1; i < roomData.card_info.length; i++)
			{
				var deal:SDealInfo = roomData.card_info[i];
				roomData.each_zone_display.push( roomData.appearMoney(roomData.GetMoney(deal.player_win)));
				roomData.each_zone_win.push(deal.player_win);				
			}
			//trace("============================發牌資訊"+roomData.each_zone_display);
			//trace("============================發牌資訊"+roomData.each_zone_win);
			
			sentNotification(BullNotification.CARD_NOTIFY);
			
		}
		
		
		
	}
}