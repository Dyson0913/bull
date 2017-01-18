package bull.modules.room.command
{
	import bull.modules.common.model.BullProtoModel;
	import com.IProtobuf.Long;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsVO;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;
	import conf.ENMoneyType;
	import conf.SBullMoney;
	import msg.SCarryInRsp;
	
	import bull.events.BullNotification;
	import bull.modules.common.model.data.RoomData;	
	import bull.modules.room.services.RoomSocketService;	
	import bull.view.alert.AlertPanel;
	
	import msg.CS;	
	import msg.ENCSType;
	import msg.ENError;
	
	public class CarryInCommand extends Command implements ICommand
	{
		public function CarryInCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
				if(notification.getName() == ENCSType.CS_TYPE_CARRY_IN_REQ.toString()){
					onCarryInReques(notification.getBody() as AssetsVO);
				}else if(notification.getName() == ENCSType.CS_TYPE_CARRY_IN_RSP.toString()){
					onCarryInResponse(notification.getBody() as CS);
				}
		}
		
		
		private function onCarryInReques(vo:AssetsVO):void
		{		
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			trace("vo.amount_nm:" + vo.amount_nm + "vo.amount_coin:" + vo.amount_coin + "vo.amount_cash:" + vo.amount_cash + "vo.amount_total:" + vo.amount_total + "amount_default:" + vo.amount_default);
			
			out.msg_type = ENCSType.CS_TYPE_CARRY_IN_REQ;
			out.carry_in_req = proto.msg_proto.getSCarryInReq();
			var m:SBullMoney = proto.conf_proto.getSBullMoney();			
			m.cash = Long.fromNumber(vo.amount_cash * 100);			
			m.gb = Long.fromNumber(vo.amount_coin);			
			m.nm = Long.fromNumber(vo.amount_nm * 100);			
			out.carry_in_req.money = m;
			
			var roomService:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;			
			roomService.sentMsg(out);
		}
		
		private function onCarryInResponse(cs:CS):void
		{			
			
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			var rsp:SCarryInRsp = cs.carry_in_rsp;
			if(rsp.error_code == ENError.ERROR_OK ){
				//更新帶入金額				
				if ( roomData.Cash_Type == ENMoneyType.MONEY_TYPE_COIN)
				{
					roomData.Total_money = rsp.money.gb.toNumber();
				}
				else
				{
					roomData.Total_money = rsp.money.cash.toNumber() + rsp.money.nm.toNumber();
					roomData.Total_money /= 100;					
				}				
				trace("carryIn rsp: gb =" + rsp.money.gb + " cash = " +rsp.money.cash + " nm = " + rsp.money.nm);
				trace("carryIn rsp: total money =" + roomData.Total_money);
				
				//更新個人金額
				sentNotification(BullNotification.CASH_TAKEIN_RESPONES);
				
				if ( !roomData.panel_alreay_slider_in) 
				{
					//介面滑入
					sentNotification(BullNotification.VIEW_INIT);
				}
				
			}else{
				//提示错误
				Alert.show(Light.error.getError(rsp.error_code.toString()),"",AlertPanel);
			}
		}
	}
}