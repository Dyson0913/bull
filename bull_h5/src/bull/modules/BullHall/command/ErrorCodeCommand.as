package BullHall.command
{
	import BullHall.common.Common;
	import BullHall.event.BullHallEvent;
	import BullHall.manager.LayerManager;
	import BullHall.manager.MessageCodeMgr;
	
	import kg.components.alert.Alert;
	import kg.core.CompInfoVO;
	
	public class ErrorCodeCommand
	{
		public function execute(e:BullHallEvent):void
		{
			var errorCode:uint = e.data as uint;
			var alertMsg:String = MessageCodeMgr.getInstance().getError( String(errorCode) );
			if( alertMsg == "" ) 
				alertMsg = "系统内部错误"+errorCode;
			var alertTitle:String = "";
			Alert.show( alertMsg, alertTitle, LayerManager.getInstance().layerTop,new CompInfoVO("comp_AlertWindow_alertwindow_ok",Common.SwfName));
		}
	}
}