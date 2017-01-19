package bull.modules.common.mediator
{
	import bull.modules.common.model.data.RoomData;
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
		
		
		public var roomData:RoomData;
		
		public function MusicSetMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		override public function getInjector():Array
		{
			return ["roomData"];
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
			addNotifiction(BullNotification.ROUND_INFO_UPATE);
			view.musicButton.on(Event.CHANGE, this, onChangeMusic);
			view.soundButton.on(Event.CHANGE, this, onChangeSound);
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
				case BullNotification.ROUND_INFO_UPATE:
					update_round_id();
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
			view.musicButton.selected =  !ShareObjectMgr.get().music; 
			view.soundButton.selected = !ShareObjectMgr.get().sound;
			Light.layer.top.addChild(view);
			view.visible = true;
			
			update_round_id();
			
		}
		
		private function onClose(e:Event=null):void
		{
			trace("MusicSetMediator onClose()");
			view.close();
		}
		
		private function update_round_id():void
		{
			if ( roomData != null) 
			{				
				view.txt_RoundID.text = roomData.RoundID;
			}			
			
		}
		
		/**
		 * 设置声音 
		 */	
		
		private function onChangeMusic():void
		{
			ShareObjectMgr.get().setMusic(!view.musicButton.selected);
		}
		private function onChangeSound():void
		{
			ShareObjectMgr.get().setSound(!view.soundButton.selected);
		}
		
	}
}