package bull.modules.common.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	
	import laya.events.Event;
	
	import bull.events.BullNotification;
	//import light.car.modules.common.model.param.CarryInParam;
	import bull.view.alert.AlertPanel;
	
	
	public class AlertMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "alertMediator";
		
		public function AlertMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		private function showPanel():void{
//			Light.layer.top.addChild(viewComponent);
		}
		
		private function hidePanel():void{
//			Light.layer.top.removeChild(viewComponent);
		}
		
		override public function getInjector():Array{
			return [];
		}
		
		private function getAlertPanel():AlertPanel{
			return viewComponent as AlertPanel;
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.viewComponent = viewComponent;
			trace("alter  init");
			getAlertPanel().visible = false;
			Light.layer.top.addChild(getAlertPanel());
			//
			getAlertPanel().close_btn.on(Event.CLICK, this, onClose);
			getAlertPanel().ok_btn.on(Event.CLICK, this, onClose);
			addNotifiction(BullNotification.SHOW_ALERT_PANEL);
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == BullNotification.SHOW_ALERT_PANEL){
				trace("SHOW_ALERT_PANEL Handler");
				//alertPanelShow(notification.getBody() as CarryInParam);
				getAlertPanel().show(true);
			}
		}
		
		private function alertPanelShow(param:CarryInParam):void{
			getAlertPanel().show(true);
		}
		
		private function onClose(e:Event):void
		{
			getAlertPanel().close();
		}
		
	}
}