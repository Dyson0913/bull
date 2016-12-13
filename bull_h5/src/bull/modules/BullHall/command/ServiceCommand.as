package BullHall.command
{
	import BullHall.common.Common;
	import BullHall.event.BullHallEvent;
	
	import msg.ENCSType;
	
	public class ServiceCommand
	{
		public function execute(e:BullHallEvent):void
		{
			switch(e.type)
			{
				case String(ENCSType.CS_TYPE_SERVER_START_NOTIFY):
					Common.isOpenServer = true;
					break;
				case String(ENCSType.CS_TYPE_SERVER_CLOSE_NOTIFY):
					Common.isOpenServer = false;
					break;
			}
		}
		
	}
}