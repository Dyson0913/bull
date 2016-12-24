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
	import bull.modules.common.mediator.MusicSetMediator;
	import bull.modules.common.mediator.RuleMediator;
	import bull.modules.common.model.data.HallData;
	import bull.modules.common.model.data.UserInfoData;
	import bull.modules.common.model.data.vo.HallRoomVO;	
	import bull.modules.BullHall.service.HallSocketService;
	import bull.view.hall.Hall;
	
	import msg.ENCSType;
	
	
	public class HallMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "hallMediator";
		
		public var hallSocketService:HallSocketService;
		public var hallData:HallData;
		public var userInfoData:UserInfoData;		
		
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
			
			//資料更新通知	
			hallData.addEventListener(LightEvent.CHANGE, this, onRoomListChange);			
			
			//view.list.on(LightEvent.ITEM_CLICK,this,onListItemClick);
			
			//view.on(ScenceManagerEvent.UI_HIDE,this, onHideHandler);
			//view.on(ScenceManagerEvent.UI_SHOW,this, onShowHandler);
			
			view.helpBtn.on(Event.CLICK,this, onClick);
			view.setupBtn.on(Event.CLICK, this, onClick);
			view.optionBtn.on(Event.CLICK, this, onClick);
			
			
			view.GBtn.on(Event.CLICK, this, onGBtnClick);
			view.MBtn.on(Event.CLICK, this, onMBtnClick);
			
			showOrHideBtnGroup(false);			
		}
		
		override public function handler(notification:INotification):void
		{

		}
		
		private function onGBtnClick(e:Event):void
		{
			trace("onGBtnClick");
			view.showRoomList([hallData.roomList[0], hallData.roomList[1]]);
			view.show_G();
		}
		
		private function onMBtnClick(e:Event):void
		{
			trace("onMBtnClick");
			view.showRoomList([hallData.roomList[2], hallData.roomList[3]]);
			view.show_M();
		}
		
		
		/**
		 * 点击设置上的按钮 
		 */		
		private function onClick(e:Event):void
		{
			trace("onClick:"+e.target);
			switch(e.target)
			{
				case view.helpBtn:
					sentNotification(MusicSetMediator.SHOW_MUSIC_SET_PANEL);
					showOrHideBtnGroup(!view.btnBg.visible);
				break;					
				case view.setupBtn:
					sentNotification(RuleMediator.SHOW_RULE_PANEL);
					showOrHideBtnGroup(!view.btnBg.visible);
				break;
				case view.optionBtn:
					showOrHideBtnGroup(!view.btnBg.visible);
				break;
			}
		}
		
		/**
		 * 隐藏或显示设置按钮状态 
		 */		
		private function showOrHideBtnGroup(flag:Boolean):void
		{
			view.btnBg.visible = flag;
			view.setupBtn.visible = flag;
			view.helpBtn.visible = flag;
		}
		
		
		private function onHideHandler():void{
			//记得移除一些事情
			trace("Hall onHideHandler");
		}
		
		private function onShowHandler():void{
			//记得添加一些事情
			trace("Hall onShowHandler");
			//startRoomList();
		}
		
		private function onRoomListChange(e:LightEvent):void {
			trace("get room data")
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