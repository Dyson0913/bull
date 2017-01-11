package bull.modules.BullHall.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightUI.KGameComponents.assetsInPanel.CurrencyType;
	import com.lightUI.components.alert.Alert;
	
	import laya.utils.Handler;
	
	import bull.events.BullNotification
	import light.car.modules.common.model.data.CarData;
	import light.car.modules.common.model.data.ConstData;
	import bull.modules.common.model.data.HallData;
	import light.car.modules.common.model.data.RoomData;
	import light.car.modules.common.model.data.UserInfoData;	
	import light.car.modules.common.model.param.CarryInParam;
	import bull.modules.common.services.WebService;
	import light.car.utils.MoneyUtils;
	import light.car.view.alert.AlertCancelPanel;
	import light.car.view.alert.AlertPanel;
	
	import msg.ENCSType;
	
	public class UserBalanceCommand extends Command implements ICommand
	{
		private var _firstEnter:Boolean;
		public function UserBalanceCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == BullNotification.GET_USER_BALANCE){
				onUserBalanceHandler(notification.getBody() as Boolean);
			}
		}
		
		private function onUserBalanceHandler(firstEnter:Boolean = false):void
		{
			var ws:WebService = getModel(WebService.NAME) as WebService;
			ws.getUserBalance(new Handler(this, userBalanceCallback));
			_firstEnter = firstEnter;
		}		
		
		private function userBalanceCallback(param:Object):void{			
			var hallData:HallData = getSingleton(HallData.NAME) as HallData;
			
			trace("userBalanceCallback = "+param);
			//TODO parse param			
			
			//關閉大廳音樂
			sentNotification(BullNotification.Close_BGM);
			
			sentNotification(BullNotification.ENTER_ROOM);
			
			return;
			
			//如果房间不存在不处理
			//if(hallData.roomId > 0){
				//var carData:CarData = getSingleton(CarData.NAME) as CarData;
				//弹出带入面板
				//var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
				//var roomVO:HallRoomVO = hallData.getHallRoomInfoById(hallData.roomId);
				//判断房间是否存在
				//if(!roomVO) return;
				//var carryInParam:CarryInParam  = new CarryInParam(param);
				//var userInfo:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
				//roomData.chipsType = roomVO.chipsType;
				//carryInParam.name = roomVO.name;
				//carryInParam.betMin = MoneyUtils.getCashChange(roomVO.chipsType,roomVO.betMin);
				//carryInParam.isFirst = _firstEnter;
				//carryInParam.carrayType = roomVO.chipsType == CurrencyType.COIN ? CurrencyType.COIN : roomData.nm ? CurrencyType.CASHANDNM: CurrencyType.CASH;
				//
				//
				//
				//if(carData.states == ConstData.HALL_STATE){
					//if(checkInByBalanceEnough(carryInParam)){
						//sentNotification(CarNotification.ENTER_ROOM, roomVO);
					//}else{
						//Alert.show("抱歉，你的余额低于最低带入金。","",AlertCancelPanel,null, Handler.create(this, gotoRecharge));
					//}
				//
				//}else{
					//
					//if(!checkInByBalanceEnough(carryInParam)){
						//余额不足去充值
						//Alert.show("抱歉，你的余额低于最低带入金。", "",AlertCancelPanel,null, Handler.create(this, gotoRecharge));
					//}else{
						//sentNotification(CarNotification.SHOW_CARRY_IN_PANEL, carryInParam);
					//}
				//}
			//}
		}
		private function gotoRecharge(data:int,flg:String):void{
			if(flg =="ok_btn"){
				//去充值页面			
			}else{
				//关闭提示
			}
			
		}
		
		//private function checkInByBalanceEnough(param:CarryInParam):Boolean{
			//
			//if((param.carrayType == CurrencyType.COIN && param.coin < param.betMin) || (param.carrayType == CurrencyType.CASHANDNM && (param.cash + param.nm) < param.betMin) || (param.carrayType == CurrencyType.CASH && param.cash < param.betMin)){
				//return false;
			//}
			//return true;
//			sentNotification(CarNotification.SHOW_CARRY_IN_PANEL, param);
		//}
		
	}
}