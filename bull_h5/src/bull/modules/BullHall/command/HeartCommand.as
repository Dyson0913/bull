package BullHall.command
{
	
	import BullHall.event.BullHallEvent;
	import BullHall.service.HeartService;
	
	import msg.ENCSType;
	
	/**
	 */
	public class HeartCommand
	{
		[Inject]
		public var heat:HeartService;
		
		public function execute(e:BullHallEvent):void
		{
			if(e.type == String(BullHallEvent.Heart_Start)){
				//连接成功   开始心跳
				heat.startHeat();
			}else if(e.type == String(ENCSType.CS_TYPE_HEART_BEAT_RSP)){
				//接收心跳回调
				heat.heatResponese();
			}
		}
	}
}
