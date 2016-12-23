package bull.modules.common.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightMVC.parrerns.Notification;
	
	import bull.core.ShareObjectMgr;
	import bull.events.BullNotification;
	import bull.modules.common.model.data.ConfigData;	
	import bull.modules.common.model.param.WebParam;
	import bull.modules.common.services.WebService;
	import bull.modules.common.model.data.Data;
	import bull.modules.BullHall.service.HallSocketService;
	
	import msg.ENCSType;
	
	public class ConnectHallCommand extends Command implements ICommand
	{
		public function ConnectHallCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == BullNotification.HALL_SOCKET_CONNECT){
				hallConnectHandler();
			}else if(notification.getName() == BullNotification.HALL_SOCKET_CONNECT_COMPLETE){
				hallConnectCompleteHandler();
			}else if(notification.getName() == BullNotification.HALL_SOCKET_CONNECT_FAILED){
				trace("connect failed:"+notification.getName()+" body: "+notification.getBody());
			}
		}
		
		private function hallConnectHandler():void{
			var config:ConfigData = getSingleton(ConfigData.NAME) as ConfigData;
			var hallSocketService:HallSocketService = getModel(HallSocketService.NAME) as HallSocketService;
			hallSocketService.connect(config.ip,config.port);
		}
		
		private function hallConnectCompleteHandler():void{
			trace("hallConnectCompleteHandler");
			var param:WebParam = WebService.resolveBrowserParam();
			var bullData:Data = getSingleton(Data.NAME) as Data;
			if(param.uid) {
				bullData.uid = param.uid;
				ShareObjectMgr.get().init(param.uid.toString());
			}
			if(param.access_token) bullData.token = param.access_token;
			
			sentNotification(BullNotification.LOGIN_HALL_RQS);
		}
	}
}