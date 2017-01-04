package bull.modules.room.mediator
{
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;	
	import com.lightUI.events.ScenceManagerEvent;
	
	import com.lightUI.events.LightEvent;
	
	import laya.display.BitmapFont;
	import laya.display.Text;
	import laya.events.Event;
	import laya.maths.Rectangle;
	import laya.resource.Texture;
	import laya.utils.Handler;
	import laya.utils.Timer;	
	
	import bull.events.BullNotification;
	import light.car.events.CarSceneEvent;
	import bull.modules.common.mediator.MusicSetMediator;
	import bull.modules.common.mediator.RuleMediator;
	import light.car.modules.common.model.data.CarData;
	import light.car.modules.common.model.data.MoneyType;
	import bull.modules.common.model.data.RoomData;
	import light.car.modules.common.model.data.UserInfoData;
	import light.car.modules.common.model.param.BetParam;
	import bull.modules.perload.services.PreLoadService;
	import light.car.modules.room.services.RoomSocketService;
	import light.car.utils.AlertTextUtil;
	import light.car.view.alert.AlertCancelPanel;
	import bull.view.room.BullScene;
	
	import bull.modules.common.model.data.Data;
	
	import msg.ENCSType;
	
	public class BullScenceMediator extends Mediator implements IMediator
	{
		public var perLoadService:PreLoadService;		
		public var roomSocketService:RoomSocketService;
		public var roomData:RoomData;
		public var userInfoData:UserInfoData;
		private var num:int;
		private var timer:Timer;
		
		public static const NAME:String = "BullScenceMediator";
		public function BullScenceMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		override public function getInjector():Array{
			return ["roomData","roomSocketService","perLoadService","userInfoData"];
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.setViewComponent(viewComponent);
			trace("BullScenceMediator setViewComponent")
			view.backLobby.on(Event.CLICK, this,onReturnClick);
			
			
			var settlewinFont:BitmapFont = new BitmapFont();
			var fnt:XmlDom = Light.loader.getRes("SettleWin.fnt");
			var fntTxt:Texture = Light.loader.getRes("res/gameScene/settleWin.png");
			settlewinFont.parseFont(fnt,fntTxt);
			Text.registerBitmapFont("SettleWin", settlewinFont);
			
			var settlelostFont:BitmapFont = new BitmapFont();
			fnt = Light.loader.getRes("Settlelost.fnt");
			fntTxt = Light.loader.getRes("res/gameScene/settlelost.png");
			settlelostFont.parseFont(fnt,fntTxt);
			Text.registerBitmapFont("SettleLost", settlelostFont);
			
			
			
			view.on(ScenceManagerEvent.UI_SHOW,this, onUIShow);
			view.on(ScenceManagerEvent.UI_HIDE,this, onUIHide);
			//view.on(CarSceneEvent.START_BET, this, onBetHandler);
			
			view.optionBtn.on(Event.CLICK, this, onClick);
			view.setupBtn.on(Event.CLICK, this, onClick);
			view.helpBtn.on(Event.CLICK,this, onClick);			
			view.CarryInBtn.on(Event.CLICK,this, onClick);			
			view.PlayerListBtn.on(Event.CLICK, this, onClick);					
			view.btn_display(false);			
			
			//TEST CMD			
			if ( view["TestPanel"] != undefined)
			{				
				view.TestPanel.on(LightEvent.ITEM_CLICK, this, ontest);
			}
			
			//notify
			addNotifiction(BullNotification.STATE_CHANGE);
			addNotifiction(BullNotification.HISTORY_NOTIFY);
			
			
			addNotifiction(BullNotification.RoomSocketClose);
			addNotifiction(BullNotification.ExitRoomEvent);
		}
		
		
		override public function onInitialize():void 
		{ 
			trace("===========================init");
		}
		
		private function ontest(cmd:int):void 
		{
			sentNotification(BullNotification.TestOrder,cmd);
		}
		
		/**
		 * 点击设置上的按钮 
		 */		
		private function onClick(e:Event):void
		{
			trace("onClick:" + e.target);
			
			
			switch(e.target)
			{
				case view.helpBtn:
					sentNotification(MusicSetMediator.SHOW_MUSIC_SET_PANEL);
					view.btn_display(!view.btnBg.visible);
				break;					
				case view.setupBtn:
					sentNotification(RuleMediator.SHOW_RULE_PANEL);
					view.btn_display(!view.btnBg.visible);
				break;
				
				case view.CarryInBtn:
					view.btn_display(!view.btnBg.visible);
					
					view.bankerPanel.set_data(["jjj",99999,"111",0,["player1","player2"],"[现金达到",-1]);
				break;
				
				case view.PlayerListBtn:
					view.btn_display(!view.btnBg.visible);
					
				break;
				
				case view.optionBtn:
					view.btn_display(!view.btnBg.visible);
					
				break;
			}
		}		
		
        override public function handler(noti:INotification):void
		{
			switch(noti.getName())
			{
				case BullNotification.STATE_CHANGE:
					state_change();
				break;
				case BullNotification.HISTORY_NOTIFY:
					history_update();
				break;
				
				case BullNotification.RoomSocketClose:
					dispose();
					break;
				case BullNotification.ExitRoomEvent:
					exitRoom();
			}
		}

		public function state_change():void 
		{
			switch( roomData.State) 
			{
				case RoomData.START:
					view.start();
				break;
				case RoomData.BANKER:
					view.banker();
				break;
				case RoomData.BET:
					view.bet();
				break;
				case RoomData.BET_CHECK:
					view.betCheck();
				break;
				case RoomData.DEAL:
					view.deal();
				break;
				case RoomData.END:
					view.end();
				break;
			}
		}
		
		public function history_update():void 
		{
			view.HistoryBoard.update_info(roomData.history_Win_info, roomData.history_lost_info, roomData.history_result_info);			
		}
		
		
		private function getPlayerInfoCallback(param:Object):void
		{
			trace("getPlayerInfoCallback!!!!!!!!!!!!!!!!!!");
			trace(param);
		}
		
		public function sendHeartBeat():void{
			startHeartCount();
			sendMsg();
		}
		
		private function sendMsg():void{
			if(num > 2){
				//提示断线了 正在为您重连，请稍等……
				clearTimer();
				roomSocketService.reconnect();
				return;
			}
			num++;
			sentNotification(BullNotification.ROOM_HEART_BEAT);
		}
		
		private function startHeartCount():void{
			if(!timer) {
				timer = new Timer();
				timer.loop(5000,this, sendMsg);
			}
		}
		private function clearTimer():void{
			if(!timer) return;
			timer.clear(this, sendMsg);
			timer = null;
			num = 0;
		}
		
		public function receiveHeartBeat():void
		{
			// TODO Auto Generated method stub
			num = 0;
		}
		
		private function onCarryInClick():void
		{
			sentNotification(CarNotification.GET_USER_BALANCE);
		}
		
		private function onCZClick(e:Event):void{
			if(roomData.chongzhi) return;
			sentNotification(ENCSType.CS_TYPE_PLAYER_CANCEL_BET_REQ.toString());
		}
		
		private function onXTClick(e:Event):void{
			if(roomData.xutou) return;
			sentNotification(ENCSType.CS_TYPE_PLAYER_SAVED_BET_REQ.toString());
		}
		
		
		private function onBetHandler(param:BetParam):void{
			sentNotification(ENCSType.CS_TYPE_PLAYER_BET_REQ.toString(),param);
		}
		
		private function onUIShow():void {
			
			
			//先别影藏 等数据请求回来再显示
			//view.roomData = roomData;
			//view.userInfoData = userInfoData;
			//roomData.initClipConfig();
			//view.initSelectClip();
			//
			//view.img_cash.visible = view.img_coin.visible = false;
			//roomData.chipsType == MoneyType.CASH ? view.img_cash.visible = true : view.img_coin.visible =true;
			view.showme();
			
		}
		
		private function onUIHide():void{
			//视图被移除的时候  做一些清理工作 
			view.hideme();
		}
		
		private function onReturnClick():void{
			trace("onReturnClick exit room");
			//if(roomData.isSelfBet()) 
				//Alert.show("确定退出"+AlertTextUtil.getEnterRoomText(roomData.chipsType,roomData.name)+"？\n\n\n    (本局下注将正常结算)","",AlertCancelPanel, null, Handler.create(this, exitRoomCall));
			//else
				exitRoom();
				
		}
		
		private function exitRoomCall(data:int,flg:String):void{
			if(flg == "ok_btn"){
				exitRoom();
			}
		}
		
		public function exitRoom():void {
				
		
			
			perLoadService.loadHall();
			sentNotification(BullNotification.Leave_Game);
			dispose();
		}
		
		private function dispose():void{
			//roomData.clear();
			//roomSocketService.close();
			//clearTimer();
			view.clear();
		}
		
		
		public function get view():BullScene
		{
			return getViewComponent() as BullScene;
		}

	}
}