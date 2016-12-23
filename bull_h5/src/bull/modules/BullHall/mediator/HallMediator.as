package bull.modules.BullHall.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.events.LightEvent;
	import com.lightUI.events.ScenceManagerEvent;
	
	import laya.events.Event;
	import laya.utils.Timer;
	
	import bull.events.BullNotification;
	//import light.car.modules.common.mediator.MusicSetMediator;
	//import light.car.modules.common.mediator.RuleMediator;
	import bull.modules.common.model.data.HallData;
	import bull.modules.common.model.data.UserInfoData;
	import bull.modules.common.model.data.vo.HallRoomVO;	
	import bull.modules.BullHall.service.HallSocketService;
	import bull.view.hall.Hall;
	
	import msg.ENCSType;
	
	
	public class HallMediator extends com.lightMVC.parrerns.Mediator implements IMediator
	{
		public static const NAME:String = "hallMediator";
		
		public var hallSocketService:HallSocketService;
		public var hallData:HallData;
		public var userInfoData:UserInfoData;
		
		private var roomListInterval:int = 30000;
		
		public function HallMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			mediatorName = mediatorName?mediatorName:NAME;
			super(mediatorName, viewComponent);
		}
		
		override public function getInjector():Array
		{
			return [HallSocketService.NAME,HallData.NAME,UserInfoData.NAME];
		}
		
		public function get view():Hall
		{
			return viewComponent as Hall;
		}
		
		override public function setViewComponent(viewComponent:Object):void
		{
			super.setViewComponent(viewComponent);
			//view.list.on(LightEvent.ITEM_CLICK,this,onListItemClick);
			hallData.addEventListener(LightEvent.CHANGE, this,onRoomListChange);
			//view.on(ScenceManagerEvent.UI_HIDE,this, onHideHandler);
			//view.on(ScenceManagerEvent.UI_SHOW,this, onShowHandler);
			
			//view.btnModify.on(Event.CLICK,this, onClick);
			//view.btnRule.on(Event.CLICK, this, onClick);
			//view.btnSet.on(Event.CLICK, this, onClick);
			//showOrHideBtnGroup(false);
//			view.loginPanel.login_btn.on(Event.CLICK, this, loginHandler);
		}
		
		override public function handler(notification:INotification):void
		{
//			trace("HallMediator handler",notification.getName());
//			var type:String = notification.getName();
//			switch(type)
//			{
//				case CarNotification.SOCKET_CONNECT:
//					socketService.sfs.connect();
//					break;
//				case CarNotification.ONLOGIN:
//					onLogin();
//				default:
//					break;
//			}
		}
		
		
		public function startRoomList():void{
			getRoomList();
			Laya.timer.loop(roomListInterval,this,getRoomList);
		}
		public function stopRoomList():void{
			Laya.timer.clear(this,getRoomList);
		}
		private function getRoomList():void{
			sentNotification(ENCSType.CS_TYPE_GET_TABLE_LIST_REQ.toString());
		}
		
		/**
		 * 点击设置上的按钮 
		 */		
		private function onClick(e:Event):void
		{
			trace("onClick:"+e.target);
			switch(e.target)
			{
				case view.btnSet:
					sentNotification(MusicSetMediator.SHOW_MUSIC_SET_PANEL);
					break;
				case view.btnRule:
					sentNotification(RuleMediator.SHOW_RULE_PANEL);
					break;
				case view.btnModify:
					showOrHideBtnGroup(!view.imgSetBackground.visible);
					break;
			}
		}
		
		/**
		 * 隐藏或显示设置按钮状态 
		 */		
		private function showOrHideBtnGroup(flag:Boolean):void
		{
			view.imgSetBackground.visible = flag;
			view.btnRule.visible = flag;
			view.btnSet.visible = flag;
		}
		
		private function loginHandler():void{
//			userInfoData.name = view.loginPanel.name_txt.text;
//			view.hideLogin();
//			sentNotification(CarNotification.SOCKET_CONNECT);
		}
		
		private function onHideHandler():void{
			//记得移除一些事情
			trace("Hall onHideHandler");
//			stopRoomList();
		}
		
		private function onShowHandler():void{
			//记得添加一些事情
			trace("Hall onShowHandler");
			//startRoomList();
		}
		
		private function onRoomListChange(e:LightEvent):void{
			view.showRoomList(hallData.roomList);
		}
		
		private function onListItemClick(data:*):void{
			trace("onListItemClick",data.id);
			currentId = data.id;
//			if(!roomSocketService) roomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			sentNotification(ENCSType.CS_TYPE_GET_PLAYER_ENTER_STATE_REQ.toString());
		}
		
		public function enterRoom():void{
			var vo:HallRoomVO = hallData.getHallRoomInfoById(currentId);
			userInfoData.moneyType = vo.chipsType;
			sentNotification(CarNotification.ENTER_ROOM, vo);
			currentId = -1;
		}
		
		private var timer:Timer;
		private var num:int;
		public var currentId:int;
		public function sendHeartBeat():void
		{
			//启动心跳计时并发送
			startHeartCount();
			sendMsg();
		}
		
		private function sendMsg():void{
			if(num > 2){
				//提示断线了 正在为您重连，请稍等……
//				alert("正在为您重连，请稍等……");
				clearTimer();
				hallSocketService.reconnect();
				return;
			}
			num++;
			sentNotification(BullNotification.HALL_HEART_BEAT);
		}
		
		private function startHeartCount():void{
			if(!timer) {
				timer = new Timer();
				timer.loop( 5000,this, sendMsg);
			}
		}
		
		private function clearTimer():void{
			timer.clear(this, sendMsg);
			timer = null;
			num = 0;
		}
		
		public function receiveHeartBeat():void
		{
			num = 0;
		}
	}
}