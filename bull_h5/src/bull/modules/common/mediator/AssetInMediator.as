package bull.modules.common.mediator
{
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
	
	import laya.utils.Handler;
	
	import bull.events.BullNotification;
	import light.car.modules.common.model.param.CarryInParam;
	import light.car.modules.perload.services.PreLoadService;
	import light.car.modules.room.services.RoomSocketService;
	import light.car.view.alert.AlertPanel;
	
	import msg.ENCSType;
	
	
	public class AssetInMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "assetInMediator";
		
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
			return ["roomSocketService","perLoadService"];
		}
		
		private function getAssetsPanel():AssetsInPanel{
			return viewComponent as AssetsInPanel;
		}
		
		override public function setViewComponent(viewComponent:Object):void{
			super.viewComponent = viewComponent;
			
			getAssetsPanel().visible = false;
//			Light.layer.top.addChild(getAssetsPanel());
			
			addNotifiction(BullNotification.SHOW_CARRY_IN_PANEL);
			getAssetsPanel().on(AssetsInEvent.OK, this, onCommitCarryIn);
			getAssetsPanel().on(AssetsInEvent.CANCEL,this, onCancelCarryIn);
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == BullNotification.SHOW_CARRY_IN_PANEL){
				trace("SHOW_CARRY_IN_PANEL Handler");
				//carryInPanelShow(notification.getBody() as CarryInParam);
			}
		}
		private var timerId:int;
		private function carryInPanelShow(param:CarryInParam):void{
			first = param.isFirst;
			if(first){
				timerId = timer.setTimeout(this, countCarryInTime, 30000, null);
			}
			//现金带入需要把步长设成0.01	
			getAssetsPanel().assetsIn(param.betMin, param.betMax, param.carrayType, param.betMin, param.cash, param.coin, param.nm, 0.01);
				
		}
		
		private function countCarryInTime():void{
			Alert.show("带入超时","",AlertPanel,null,Handler.create(this,onCancelCarryIn),null, 3000);
		}
		
		private function onTimeOver(data:int, flg:String):void{
			onCancelCarryIn(null);
		}
		
		private function onCancelCarryIn(e:AssetsInEvent):void
		{
			//退出房间消息
			if(first){
				roomSocketService.close();
				perLoadService.loadHall();
			}
			timer.clearTimeout(timerId);
			getAssetsPanel().close();
		}
		
		private function onCommitCarryIn(vo:AssetsVO):void
		{
			timer.clearTimeout(timerId);
			trace("amountCash: "+vo.amount_cash+"amount_nm: "+vo.amount_nm+"amount_total: "+vo.amount_total);
			sentNotification(ENCSType.CS_TYPE_CARRY_IN_REQ.toString(), vo);
			getAssetsPanel().close();
		}
		
	}
}