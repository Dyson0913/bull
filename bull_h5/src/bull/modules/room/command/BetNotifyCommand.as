package bull.modules.room.command
{	
	
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.HallData;
	import bull.modules.common.model.data.RoomData;
	import bull.modules.common.model.data.vo.ClipConfigVo;
	import bull.modules.room.services.RoomSocketService;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import conf.ENMoneyType;
	import conf.SBetInfo;
	import conf.SUserInfo;
	import msg.SBetNotify;
	import msg.SBetRsp;
	import com.lightUI.core.Light;
	
	import bull.events.BullNotification;	
	import bull.modules.perload.services.PreLoadService;
	import bull.modules.common.model.data.Data;
	
	import bull.view.alert.AlertPanel;
	import com.lightUI.components.alert.Alert;
	
	import msg.CS;
	import msg.ENCSType;
	import conf.ENBetPosition;
	import conf.ENRoomType;
	
	public class BetNotifyCommand extends Command implements ICommand
	{		
		
		public function BetNotifyCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == ENCSType.CS_TYPE_BET_REQ.toString()){
				Request();
			}
			else if(notification.getName() == ENCSType.CS_TYPE_BET_RSP.toString()){
				betResponse(notification.getBody() as CS);
			}
			else if(notification.getName() == ENCSType.CS_TYPE_BET_NOTIFY.toString()){
				betnotify(notification.getBody() as CS);
			}
			else if(notification.getName() == BullNotification.BET_SAME){
				SameRequest();
			}
			else if(notification.getName() == BullNotification.BET_CANCEL){
				CancelRequest();
			}
			
		}
		
		private function Request():void
		{
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_BET_REQ;
			out.bet_req = proto.msg_proto.getSBetReq();
			
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			//下那區
			var betzone:int = 0;
			if( roomData.bet_zone == 0) betzone = conf.ENBetPosition.BET_POSITION_1;
			else if (roomData.bet_zone == 1) betzone = conf.ENBetPosition.BET_POSITION_2;
			else if (roomData.bet_zone == 2) betzone = conf.ENBetPosition.BET_POSITION_3;
			else if (roomData.bet_zone == 3) betzone = conf.ENBetPosition.BET_POSITION_4;
			
			out.bet_req.position = betzone;
			
			//金額
			var hallData:HallData = getSingleton(HallData.NAME) as HallData;
			var dataSelectClip:ClipConfigVo  = roomData.getClipBets(hallData.join_room_idx);
			var bet_add_value:int;
			if ( roomData.bet_idx == 5) bet_add_value = -1;  //MAX
			else 
			{
				bet_add_value = parseInt(dataSelectClip.selectClips[roomData.bet_idx]);
				
				//現金下10塊,傳1000
				if( roomData.Cash_Type != ENMoneyType.MONEY_TYPE_COIN ) bet_add_value = bet_add_value*100;
			}
			
			out.bet_req.bet_money  = bet_add_value;			
			
			var socket:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			socket.sentMsg(out);
		}
		
		private function betResponse(cs:CS):void
		{
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;	
			
			var rsp:SBetRsp = cs.bet_rsp;	
			trace("=============================betResponse "+rsp.error_code)
			switch(rsp.error_code)
			{
				case 0:
					//下注位置    (11. 取消,  10. 同上一轮,  1~4. 下注位置)
					if ( rsp.position ==  conf.ENBetPosition.BET_POSITION_CANCEL )
					{						
						roomData.Has_bet  = false;
						//更新自己手中的錢
						roomData.Total_money = roomData.GetMoney(rsp.hand_money.toNumber());
						sentNotification(BullNotification.BET_CANCEL_OK); 
					}					
					else 
					{
						// conf.ENBetPosition.BET_POSITION_REPEAT;一樣處理
						roomData.Has_bet = true;			
						roomData.Total_money = roomData.GetMoney(rsp.hand_money.toNumber());
						sentNotification(BullNotification.BET_RSP); 
					}
					
					
					
				break;
				
				default:				
					if (  rsp.error_code ==14 ||  rsp.error_code ==7 || rsp.error_code >=17 &&  rsp.error_code <=29)
					{
						var po:int; 
						//相同下注失敗 po 回傳10
						if( rsp.position ==10 )
						{
							po = 0;
							sentNotification(BullNotification.BET_CANCEL_FAIL);
						}
						else
						{
							po = rsp.position -1;
						}
						
						sentNotification(BullNotification.BET_ERROR,{"error_msg":Light.error.getError(rsp.error_code.toString()),"po":po,"error_code":rsp.error_code});
					}
					else
					{
						Alert.show("error code :"+rsp.error_code.toString,"",AlertPanel);
					}
					
					break;
			}
			
		}
		
		private function betnotify(cs:CS):void
		{	
			trace("betnotify +",cs);
			var data:SBetNotify = cs.bet_notify;
			
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;			
			
			var m1:SBetInfo = data.m1;
			var m2:SBetInfo = data.m2;
			var m3:SBetInfo = data.m3;
			var m4:SBetInfo = data.m4;
			
			
			//總下注更新
			roomData.Zone_Total_bet[0] = roomData.GetMoney(m1.money.toNumber());
			roomData.Zone_Total_bet[1] = roomData.GetMoney(m2.money.toNumber());
			roomData.Zone_Total_bet[2] = roomData.GetMoney(m3.money.toNumber());
			roomData.Zone_Total_bet[3] = roomData.GetMoney(m4.money.toNumber());
			
			//下注資訊更新
			roomData.sameBetinfo = [];
			roomData.sameBetinfo = data.bets;
			roomData.light_po = data.light_pos - 1;			
			
			//各區前三名資訊
			roomData.first_three_info.length = 0;
			var list:Array = [m1, m2, m3, m4];
			var tip_list:Array =[];	
			for (var i:int = 0; i < list.length; i++)
			{
				var n:int = list[i].user_info_s.length;
				var zone_list:Array =[];
				for (var j:int =0;j< n;j++)
				{
					var info:SUserInfo =  list[i].user_info_s[j];
					var name:String = roomData.find_player("username", info.uid as Number);
					var money:String  = roomData.appearMoney(roomData.GetMoney(info.bet_money.toNumber()));
					var one:Object = { "name":name, "light":info.is_light, "money":money};
					zone_list.push(one);
				}
				tip_list.push(zone_list);			
			}
			roomData.first_three_info = tip_list;
			
			sentNotification(BullNotification.BET_INFO_UPDATE);
		}
		
		
		private function CancelRequest():void
		{			
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_BET_REQ;
			out.bet_req = proto.msg_proto.getSBetReq();
			out.bet_req.position = conf.ENBetPosition.BET_POSITION_CANCEL;	
			
			var socket:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			socket.sentMsg(out);
		}
		
		private function SameRequest():void
		{
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_BET_REQ;
			out.bet_req = proto.msg_proto.getSBetReq();
			out.bet_req.position = conf.ENBetPosition.BET_POSITION_REPEAT;	
			
			var socket:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			socket.sentMsg(out);
		}
		
		
	}
}