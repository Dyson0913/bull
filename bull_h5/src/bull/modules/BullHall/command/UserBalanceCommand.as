package bull.modules.BullHall.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightUI.KGameComponents.assetsInPanel.CurrencyType;
	import com.lightUI.components.alert.Alert;
	
	import laya.utils.Handler;
	
	import bull.events.BullNotification		
	import bull.modules.common.model.data.HallData;
	import bull.modules.common.model.data.RoomData;	
	import bull.modules.common.services.WebService;	
	import bull.view.alert.AlertCancelPanel;
	import bull.view.alert.AlertPanel;
	
	import msg.ENCSType;
	
	public class UserBalanceCommand extends Command implements ICommand
	{
		private var _firstEnter:Boolean;
		public function UserBalanceCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == BullNotification.GET_USER_BALANCE){
				onUserBalanceHandler(notification.getBody() as Boolean);
			}
		}
		
		private function onUserBalanceHandler(firstEnter:Boolean = false):void
		{
			var ws:WebService = getModel(WebService.NAME) as WebService;
			ws.getUserBalance(new Handler(this, userBalanceCallback));
			_firstEnter = firstEnter;
			
		}		
		
		private function getPlayerGuideStatusCallback(param:Object):void 
		{			
			trace("jjj = " + param.info);
			//code
			 for (var id:String in param.info)
                       {
                         var value:Object = param.info[id];
                         trace(" msg =" + id + " = " + value);
                       }
		}
		
		private function userBalanceCallback(param:Object):void{			
			var hallData:HallData = getSingleton(HallData.NAME) as HallData;	
			
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			if( param !=undefined)  roomData.player_Money = param.info;
			else
			{
				roomData.player_Money = { "cash":10000, ",coin":10000, "nm":0 };
			}
			
			if ( _firstEnter)
			{
				//由大廳進入,走登入流程
				//關閉大廳音樂
				sentNotification(BullNotification.Close_BGM);			
				sentNotification(BullNotification.ENTER_ROOM);
			}
			else
			{
				//遊戲內帶入 單純彈出面版,不走登入流程
				sentNotification(BullNotification.SHOW_CARRY_IN_PANEL);
				
			}
		}
	}
}