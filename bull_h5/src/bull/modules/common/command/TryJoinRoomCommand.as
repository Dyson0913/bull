package bull.modules.common.command
{
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import conf.SRoomConfig;
	import conf.SRoomInfo;
	
	import com.lightUI.core.Light;
	import com.lightUI.components.alert.Alert;
	import bull.view.alert.AlertPanel;
	
	import bull.events.BullNotification;
	import bull.modules.common.model.data.Data;
	import bull.modules.common.model.data.HallData;
	import bull.modules.common.model.BullProtoModel;	
	import bull.modules.BullHall.service.HallSocketService;
	import bull.view.alert.AlertPanel;
	
	import msg.CS;
	import msg.ENCSType;
	import msg.ENError;
	
	public class TryJoinRoomCommand extends Command implements ICommand
	{
		public function TryJoinRoomCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == ENCSType.CS_TYPE_TRY_ENTER_TABLE_REQ.toString()){
				joinRoomRqsHandler();
			}else if(notification.getName() == ENCSType.CS_TYPE_TRY_ENTER_TABLE_RSP.toString()){
				joinRoomRspHandler(notification.getBody() as CS);
			}
		}
		
		private function joinRoomRqsHandler():void{
			trace("try joinRoomRqsHandler");
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_TRY_ENTER_TABLE_REQ;
			out.try_enter_table_req = proto.msg_proto.getSTryEnterTableReq();
			
			var bullData:Data = getSingleton(Data.NAME) as Data;
			var roominfo:SRoomInfo = bullData.hallData.roomList[bullData.hallData.join_room_idx] as SRoomInfo;					
			var config:SRoomConfig = roominfo.config;
			
			out.try_enter_table_req.room_id = config.room_id;			
			
			var socket:HallSocketService = getModel(HallSocketService.NAME) as HallSocketService;
			socket.sentMsg(out);
		}
		
		private function joinRoomRspHandler(e:CS):void{
			trace("try joinRoomRspHandler",e);
			
			if (e.try_enter_table_rsp.error_code  == ENError.ERROR_OK) {
				
				var hallData:HallData = getSingleton(HallData.NAME) as HallData;
				hallData.ip = e.try_enter_table_rsp.net_address.ip;
				hallData.port = e.try_enter_table_rsp.net_address.hport;
				//hallData.Token = e.try_enter_table_rsp.token;
				
				sentNotification(BullNotification.GET_USER_BALANCE, true);
				(getModel(HallSocketService.NAME) as HallSocketService).close();
			}else{
				trace("error code: " + e.try_enter_table_rsp.error_code);
				Alert.show(Light.error.getError(e.try_enter_table_rsp.error_code.toString()),"",AlertPanel);
			}
		}
	}
}