package bull.modules.common.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.core.Light;
	import com.lightUI.manager.PopupManager;
	
	import laya.events.Event;
	
	import bull.core.ShareObjectMgr;
	import bull.events.BullNotification
	import bull.view.alert.MusicSetPanel;
	
	/**
	 * 设置声音面板 
	 */	
	public class MusicSetMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "musicSetMediator";
		public static const SHOW_MUSIC_SET_PANEL:String = "car.SHOW_MUSIC_SET_PANEL";
		public static const HIDE_MUSIC_SET_PANEL:String = "car.HIDE_MUSIC_SET_PANEL";
		
		public function MusicSetMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function getInjector():Array
		{
			return [];
		}
		
		public function get view():MusicSetPanel
		{
			return viewComponent as MusicSetPanel;
		}
		
		override public function setViewComponent(viewComponent:Object):void
		{
			super.setViewComponent(viewComponent);
			
			Light.layer.top.addChild(view);
			view.visible = false;
			PopupManager.centerPopUp(view);
			
			trace("MusicSetMediator setViewComponent visible:"+view.visible);
			view.btnClose.on(Event.CLICK, this, onClose);
			addNotifiction(SHOW_MUSIC_SET_PANEL);
			addNotifiction(HIDE_MUSIC_SET_PANEL);
			addNotifiction(BullNotification.SCENCE_CHANGE);
			view.chkMusic.on(Event.CHANGE, this, onChange);
			view.chkVoice.on(Event.CHANGE, this, onChange);
		}
		
		override public function handler(notification:INotification):void
		{
			switch(notification.getName())
			{
				case SHOW_MUSIC_SET_PANEL:
					onShow();
					break;
				case HIDE_MUSIC_SET_PANEL:
					onClose();
					break;
				case BullNotification.SCENCE_CHANGE:
					var curScene:String = notification.getBody() as String;
					trace("MusicSetMediator 切换到游戏场景:"+curScene);
					if( curScene == BullNotification.Scene_Game || curScene == BullNotification.Scene_Hall )
						onClose();
					break;
			}
		}
		
		private function onShow():void{
			trace("MusicSetMediator onShow()");
			view.chkMusic.selected =  !ShareObjectMgr.get().music; 
			view.chkVoice.selected = !ShareObjectMgr.get().sound;
			Light.layer.top.addChild(view);
			view.visible = true;
		}
		
		private function onClose(e:Event=null):void
		{
			trace("MusicSetMediator onClose()");
			view.close();
		}
		
		/**
		 * 设置声音 
		 */		
		private function onChange():void
		{
			trace("设置音乐音效：music:",view.chkMusic.selected," sound:",view.chkVoice.selected);
			ShareObjectMgr.get().setMusicSound(!view.chkMusic.selected,!view.chkVoice.selected);
		}
		
	}
}