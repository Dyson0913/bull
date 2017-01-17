package bull.modules.room.command
{
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.RoomData;
	import bull.modules.room.services.RoomSocketService;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import conf.ENBankerType;
	import conf.SBankerCalcInfo;
	import conf.SUserInfo;
	import msg.SBankerRsp;
	
	import bull.events.BullNotification;	
	import bull.modules.perload.services.PreLoadService;
	import bull.modules.common.model.data.Data;
	
	import msg.CS;
	import msg.ENCSType;
	
	public class BankerNotifyCommand extends Command implements ICommand
	{
		public function BankerNotifyCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == ENCSType.CS_TYPE_BANKER_LIST_NOTIFY.toString()){
				bankerlist(notification.getBody() as CS);
			}
			else if(notification.getName() == ENCSType.CS_TYPE_BANKER_NOTIFY.toString()){
				newbaner(notification.getBody() as CS);
			}
			else if(notification.getName() == ENCSType.CS_TYPE_BANKER_CALCULATE_NOTIFY.toString()){
				banker_calcu(notification.getBody() as CS);
			}
			else if(notification.getName() == ENCSType.CS_TYPE_BANKER_REQ.toString()){
				banker_request(notification.getBody() as int);
			}
			else if(notification.getName() == ENCSType.CS_TYPE_BANKER_RSP.toString()){
				banker_rsp(notification.getBody() as CS);
			}
			
		}
		
		private function bankerlist(cs:CS):void
		{			
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			roomData.banker_num = cs.banker_list_notify.player_count;			
			
			
			roomData.bankerlist.length = 0
			var myidx:int = -1;
			var list:Array = [];
			for (var i:int = 0; i < cs.banker_list_notify.user_info_s.length; i++)
			{
				var data:SUserInfo = cs.banker_list_notify.user_info_s[i];				
				var name:String = roomData.find_player("username", data.uid as Number);
				if ( data.uid.toNumber() == roomData.uid) myidx = i;
				list.push(name);
			}	
			var title:String = roomData.IsMoney() == true ? "[现金达到":"[G币达到";
			var limit:String = roomData.appearMoney(roomData.GetMoney(roomData.room_info.banker_limit));
			roomData.bankerlist.push(list);
			roomData.bankerlist.push(title);
			roomData.bankerlist.push(myidx);
			roomData.bankerlist.push(limit);
			
			sentNotification(BullNotification.BANKER_LIST);
			
		}
		
		private function newbaner(cs:CS):void
		{			
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;	
			roomData.newBaner_info = cs.banker_notify;
			
			sentNotification(BullNotification.NEW_BANKER);			
		}
		
		private function banker_calcu(cs:CS):void
		{
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;			
			roomData.banker_calcu_total_win = roomData.appearMoney(roomData.GetMoney(cs.banker_calc_notify.total_win_money.toNumber()));
			
			
			roomData.banker_calcu_info.length = 0;
			for (var i:int = 0; i < cs.banker_calc_notify.banker_calc_info_s.length; i++)
			{
				var data:SBankerCalcInfo = cs.banker_calc_notify.banker_calc_info_s[i];				
				var money:String  = roomData.appearMoney(roomData.GetMoney(data.win_money.toNumber()));				
				var ob:Object = { "idx":i, "money":money, "info":data};
				roomData.banker_calcu_info.push(ob);
			}			
			
			
			sentNotification(BullNotification.BANKER_CALCU);			
		}
		
		private function banker_request(join:int):void
		{
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();			
			out.msg_type = ENCSType.CS_TYPE_BANKER_REQ;
			out.banker_req = proto.msg_proto.getSBankerReq();
			
			out.banker_req.type =  (join == ENBankerType.BANKER_TYPE_UP) ? ENBankerType.BANKER_TYPE_UP : ENBankerType.BANKER_TYPE_DOWN	;
			
			var roomService:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;			
			roomService.sentMsg(out);
			
		}
		
		private function banker_rsp(cs:CS):void
		{			
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			var Rsp:SBankerRsp = cs.banker_rsp;	
			sentNotification(BullNotification.BANKER_ACTION_RESULT,[Rsp.error_code,roomData.apply_type]);			
		}
		
	}
}