package BullHall.command
{
	import BullHall.event.BullHallEvent;
	import BullHall.model.HallAppMedel;
	import BullHall.service.WebService;	
	
	/**
	 * 进入游戏
	 */
	public class CreditCheckCommand
	{
		[Inject]
		public var webService:WebService;
		
		[Inject]
		public var appMedel:HallAppMedel;
		
		public function execute(e:BullHallEvent):void
		{
			switch(e.type)
			{
				case BullHallEvent.Credit_Check:
					loginRoom();
					break;
			}
		}
		
		private function loginRoom():void
		{
			
			webService.getUserBalance(appMedel.app_id,"",appMedel.userInfo.user_id); 
			
			
			return;
			//先询问 是否能打开窗口
			webService.addEventListener(BullHallEvent.CAN_START_ONE_GAME, canStartOneGame);			
			
			//调用js方法 判断是否可以打开游戏
			webService.ifCanStartOneGame(appMedel.app_id);
		}
		
		private function canStartOneGame(e:BullHallEvent):void{
			
			webService.removeEventListener(BullHallEvent.CAN_START_ONE_GAME, canStartOneGame);
						
			webService.getUserBalance(appMedel.app_id,"",appMedel.userInfo.user_id); 
		}
		
		
		
	}
}