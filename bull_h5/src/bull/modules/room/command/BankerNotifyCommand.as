package bull.modules.room.command
{
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.RoomData;
	import bull.modules.room.services.RoomSocketService;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import conf.ENBankerType;
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
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			
			bullData.roomData.banker_num = cs.banker_list_notify.player_count;
			bullData.roomData.bankerlist = cs.banker_list_notify.user_info_s;
			
			sentNotification(BullNotification.BANKER_LIST);
			
		}
		
		private function newbaner(cs:CS):void
		{			
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			bullData.roomData.newBaner_info = cs.banker_notify;			
			
			sentNotification(BullNotification.NEW_BANKER);			
		}
		
		private function banker_calcu(cs:CS):void
		{
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			bullData.roomData.Banker_calcu_info.banker_calc_info_s = cs.banker_calc_notify.banker_calc_info_s;
			bullData.roomData.Banker_calcu_info.total_win_money =  cs.banker_calc_notify.total_win_money;
			
			sentNotification(BullNotification.BANKER_CALCU);			
		}
		
		private function banker_request(join:int):void
		{
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();			
			out.msg_type = ENCSType.CS_TYPE_BANKER_REQ;
			out.banker_req = proto.msg_proto.getSBankerReq();
			out.banker_req.type =  join == ENBankerType.BANKER_TYPE_UP ? ENBankerType.BANKER_TYPE_UP : ENBankerType.BANKER_TYPE_DOWN
			
			var roomService:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;			
			roomService.sentMsg(out);			
			
			//appMedel.apply_type = req.type;			
		}
		
		private function banker_rsp(cs:CS):void
		{
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			var Rsp:SBankerRsp = cs.banker_rsp;			
			sentNotification(BullNotification.BANKER_ACTION_RESULT,[Rsp.error_code,roomData.apply_type]);
			
			//if( appMedel.apply_type  ==conf.ENBankerType.BANKER_TYPE_UP)
			//{
				//appMedel.applybanker_success =true;	
			//}
			//else
			//{
				//appMedel.applydebanker_success = true;
			//}
			
		}
		
	}
}