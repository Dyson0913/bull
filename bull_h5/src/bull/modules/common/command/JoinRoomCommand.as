package bull.modules.common.command
{
	import bull.modules.common.model.data.RoomData;
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
	import bull.modules.room.services.RoomSocketService;
	import bull.view.alert.AlertPanel;
	
	import msg.CS;
	import msg.ENCSType;
	import msg.ENError;
	
	public class JoinRoomCommand extends Command implements ICommand
	{
		public function JoinRoomCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == ENCSType.CS_TYPE_ENTER_TABLE_REQ.toString()){
				joinRoomRqsHandler();
			}else if(notification.getName() == ENCSType.CS_TYPE_ENTER_TABLE_RSP.toString()){
				joinRoomRspHandler(notification.getBody() as CS);
			}
		}
		
		private function joinRoomRqsHandler():void{
			trace("joinRoomRqsHandler");
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_ENTER_TABLE_REQ;
			out.enter_table_req = proto.msg_proto.getSEnterTableReq();
			
			var bullData:Data = getSingleton(Data.NAME) as Data;
			var roominfo:SRoomInfo = bullData.hallData.roomList[bullData.hallData.join_room_idx] as SRoomInfo;
			var config:SRoomConfig = roominfo.config;
			out.enter_table_req.room_id = config.room_id;
			out.enter_table_req.token = bullData.token;
						
			
			var socket:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			socket.sentMsg(out);
		}
		
		private function joinRoomRspHandler(e:CS):void{
			trace("joinRoomRspHandler",e);
			
			if (e.enter_table_rsp.error_code  == ENError.ERROR_OK) {
				
				var hallData:HallData = getSingleton(HallData.NAME) as HallData;				
				var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
				
				//更新用戶訊息
				sentNotification(ENCSType.CS_TYPE_GET_PLAYER_INFO_REQ.toString(), [roomData.uid]);
				
				//己在遊戲內不帶入
				if ( e.enter_table_rsp.user_info != null && e.enter_table_rsp.user_info.money != null)
				{
					//TODO 金額處理
					//更新個人金額
					sentNotification(BullNotification.CASH_TAKEIN_RESPONES);
				
					//介面滑入				
					sentNotification(BullNotification.VIEW_INIT);
				}
				else 
				{				
					var roominfo:SRoomInfo = hallData.roomList[hallData.join_room_idx] as SRoomInfo;					
					var config:SRoomConfig = roominfo.config;					
					
					//帶入前就指定;
					roomData.Cash_Type = hallData.Cash_Type;
					trace("===================joinroom = "+config.room_type);
					
					sentNotification(BullNotification.SHOW_CARRY_IN_PANEL,[config,roomData]);	
				}
				
				
			}else{
				trace("error code: " + e.enter_table_rsp.error_code);
				Alert.show(Light.error.getError(e.enter_table_rsp.error_code.toString()),"",AlertPanel);
			}
		}
	}
}