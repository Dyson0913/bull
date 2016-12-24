package bull.modules.common.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	import com.lightUI.manager.PopupManager;
	
	import laya.events.Event;
	
	import bull.events.BullNotification
	import bull.view.alert.RulePanel;
	
	/**
	 * 规则面板 
	 */	
	public class RuleMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "ruleMediator";
		public static const SHOW_RULE_PANEL:String ="car.SHOW_RULE_PANEL";//显示规则说明面板事件
		public static const HIDE_RULE_PANEL:String ="car.HIDE_RULE_PANEL";//显示规则说明面板事件
		
		public function RuleMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function getInjector():Array{
			return [];
		}
		
		private function get view():RulePanel
		{
			return viewComponent as RulePanel;
		}
		
		override public function setViewComponent(viewComponent:Object):void
		{
			super.viewComponent = viewComponent;
			
			Light.layer.top.addChild(view);
			view.visible = false;
			PopupManager.centerPopUp(view);
			
			trace("RuleMediator setViewComponent visible:"+view.visible);
			view.btnClose.on(Event.CLICK, this, onClose);
			addNotifiction(SHOW_RULE_PANEL);
			addNotifiction(HIDE_RULE_PANEL);
			addNotifiction(BullNotification.SCENCE_CHANGE);
		}
		
		override public function handler(notification:INotification):void
		{
			switch(notification.getName())
			{
				case SHOW_RULE_PANEL:
					onShow();
					break;
				case HIDE_RULE_PANEL:
					onClose();
					break;
				case BullNotification.SCENCE_CHANGE:
					var curScene:String = notification.getBody() as String;
					trace("MusicSetMediator 切换到游戏场景:"+curScene);
					if( curScene == CarNotification.Scene_Game || curScene == CarNotification.Scene_Hall )
						onClose();
					break;
			}
		}
		
		private function onShow():void{
			trace("RuleMediator onShow()");
			Light.layer.top.addChild(view);
			view.visible = true;
		}
		
		private function onClose(e:Event=null):void
		{
			trace("RuleMediator onClose()");
			view.close();
		}
		
	}
}