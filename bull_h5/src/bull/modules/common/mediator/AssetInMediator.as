package bull.modules.common.mediator
{
	import bull.modules.common.model.data.HallData;
	import bull.modules.common.model.data.RoomData;
	import bull.modules.common.services.WebService;
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInEvent;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsVO;
	import com.lightUI.KGameComponents.assetsInPanel.CurrencyType;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;
	import com.lightUI.manager.timer.Timer;
	import conf.ENRoomType;
	import conf.SRoomConfig;
	import conf.SRoomInfo;
	
	import laya.utils.Handler;
	
	import bull.events.BullNotification;	
	import bull.modules.perload.services.PreLoadService;
	import bull.modules.room.services.RoomSocketService;
	import bull.view.alert.AlertCancelPanel;
	
	import msg.ENCSType;
	
	
	public class AssetInMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "assetInMediator";
		
		public var roomData:RoomData;
		
		private var roomSocketService:RoomSocketService;
		private var first:Boolean;
		public var perLoadService:PreLoadService;
		private var timer:Timer = new Timer();
		public function AssetInMediator(mediatorName:String="", viewComponent:Object=null)
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
			return ["roomData"];
		}
		
		private function getAssetsPanel():AssetsInPanel{
			return viewComponent as AssetsInPanel;
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.viewComponent = viewComponent;
			
			getAssetsPanel().visible = false;
			Light.layer.top.addChild(getAssetsPanel());
			
			addNotifiction(BullNotification.SHOW_CARRY_IN_PANEL);
			getAssetsPanel().on(AssetsInEvent.OK, this, onCommitCarryIn);
			getAssetsPanel().on(AssetsInEvent.CANCEL,this, onCancelCarryIn);
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == BullNotification.SHOW_CARRY_IN_PANEL){				
				carryInPanelShow();
			}
		}		
		private function carryInPanelShow():void {
			
			var config:SRoomConfig = roomData.room_info;			
			
			
			//房間類型
			var money_type:Number = config.room_type == ENRoomType.ROOM_TYPE_COIN ? CurrencyType.COIN : CurrencyType.CASHANDNM;
			trace("==============money_type " + money_type);
			var betMin:Number;
			var betMax:Number;
			var nm:Number;
			var hint:String;
			if (money_type == CurrencyType.COIN)
			{
				//最小帶入需要是房間最小下注額10倍,因為可能一把輸十倍,最大帶入是自己所有的錢
			   	betMin = config.min_bet * 10;
				betMax = roomData.player_Money.coin;
			}
			else if( money_type == CurrencyType.CASHANDNM)
			{
				betMin = (config.min_bet / 100) * 10;
				betMax = (roomData.player_Money.cash) / 100;
				
				nm = 0;
				hint = "玩家上庄桌，不允许带入拟码。";
			}
			else
			{
				betMin = (config.min_bet / 100) * 10;
				betMax = (roomData.player_Money.cash + roomData.player_Money.nm) / 100;
				nm = roomData.player_Money.nm;
				hint = "投注优先扣除拟码";
			}
			
			//錢不夠最低帶入,直接提示
			if ( betMax < betMin)
			{				
				Alert.show(Light.language.getSrting("alert_msg7"), "", AlertCancelPanel, null, Handler.create(this, GotoRecharge));
				return;				
			}
			
			getAssetsPanel().roomName = config.room_name;
			
			//现金带入需要把步长设成0.01	
			//getAssetsPanel().assetsIn(param.betMin, param.betMax, param.carrayType, param.betMin, param.cash, param.coin, param.nm, 0.01);
			getAssetsPanel().assetsIn(betMin, betMax,money_type,betMin,roomData.player_Money.cash, roomData.player_Money.coin,nm);
			
		}
		
		private function onCancelCarryIn(e:AssetsInEvent):void
		{
			//TODO 帶入
			//1.首次帶入取消 -> 變觀局,不可下注,帶0
			//2.遊戲內帶入 取消->  
			
			getAssetsPanel().close();
		}
		
		private function onCommitCarryIn(vo:AssetsVO):void
		{
			
			trace("amountCash: "+vo.amount_cash+"amount_nm: "+vo.amount_nm+"amount_total: "+vo.amount_total);
			sentNotification(ENCSType.CS_TYPE_CARRY_IN_REQ.toString(), vo);
			getAssetsPanel().close();
		}
		
		private function GotoRecharge(data:int,flg:String):void{
			if (flg == "ok_btn")
			{
				trace("ok_btn");
				//去充值頁面
				var ws:WebService = getModel(WebService.NAME) as WebService;
				
				var type:String = "";
				if ( roomData.IsMoney() ) type = "cash";
				else type = "coin";
				ws.recharge(type,new Handler(this, GotoRechargeCallback));
				
				//TODO 去充值介面怎麼處理
				//更新個人金額
				sentNotification(BullNotification.CASH_TAKEIN_RESPONES);
				
				//介面滑入
				sentNotification(BullNotification.VIEW_INIT);
			}
			else
			{
				//TODO更新 實際 HEAD money
				sentNotification(BullNotification.VIEW_INIT);
			}
		}
		
		private function GotoRechargeCallback(param:Object):void 
		{
			trace("GotoRechargeCallback  ="+param);
		}
		
	}
}