package BullHall.command
{
	import car.comm.LocalConCarCmdCode;
	
	import BullHall.event.BullHallEvent;
	import BullHall.service.WebService;

	public class WebServiceCommand
	{
		[Inject]
		public var webService:WebService;
		
		public function execute(e:BullHallEvent):void
		{
			switch(e.type)
			{
				case LocalConCarCmdCode.Code_CloseGameWindowSure:
					var roomId:String = e.data.roomId;
					webService.onCloseGameWindow(roomId);
					break;
			}
		}
	}
}