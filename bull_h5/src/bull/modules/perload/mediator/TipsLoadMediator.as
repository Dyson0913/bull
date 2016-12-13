package bull.modules.perload.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.events.ScenceManagerEvent;
	
	import com.lightUI.core.Light;
	import bull.events.BullNotification;
	import bull.view.tipsLoad.TipsLoadPanel;
	
	public class TipsLoadMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "tipsLoadMediator";
		public function TipsLoadMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		
		override public function getInjector():Array{
			return [];
		}
		override public function setViewComponent(viewComponent:Object):void{
			super.setViewComponent(viewComponent);
			addNotifiction(BullNotification.LOAD_DATA_MESSAGE);			
			trace("TipsLoadMediator setViewComponent");			
			
			var objData:Object = Light.loader.getRes("tipText");			
			
			var  tips:Array = [];			
			for (var id:String in objData)
            {
                var value:Object = objData[id];   
				trace
				tips.push(value.cn);
            }
			
			view.showTips(tips);
			
		}
		
		public function get view():TipsLoadPanel
		{
			return viewComponent as TipsLoadPanel;
		}
		
		override public function handler(noti:INotification):void {
			
			if(noti.getName() == BullNotification.LOAD_DATA_MESSAGE){				
				view.show(noti.getBody().value);
			}
		}
		
		private function onShowProgress(value:int):void
		{
			// TODO Auto Generated method stub
			trace("this tips progress --- "+value);
		}
		
	}
}