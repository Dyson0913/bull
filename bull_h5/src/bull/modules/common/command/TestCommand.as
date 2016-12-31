package bull.modules.common.command
{
	import com.IProtobuf.Long;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import com.lightUI.components.alert.Alert;	
	
	import com.lightUI.core.Light;
	import laya.utils.Handler;
	import com.lightUI.components.alert.Alert;
	import bull.view.alert.AlertPanel
	
	import bull.events.BullNotification;	
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.Data;
	import bull.modules.room.mediator.BullScenceMediator;
	import bull.modules.room.services.RoomSocketService;
	import light.car.view.alert.AlertPanel;
	
	import msg.CS;
	import msg.ENCSType;
	import msg.ENError;
	import msg.LoginRsp;
	
	public class TestCommand extends Command implements ICommand
	{
		public function TestCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == BullNotification.TestOrder){
				onLoginRoomRqs(notification.getBody() as int);
			}
		}
		
		private function onLoginRoomRqs(cmd:int):void{
			trace("Test "+ cmd);
						
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();			
			out.msg_type = ENCSType.CS_TYPE_TRY_ENTER_TABLE_REQ;
			out.try_enter_table_req  = proto.msg_proto.getSTryEnterTableReq()
			out.try_enter_table_req.room_id = cmd;
			
			var socket:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			socket.sentMsg(out);
			
		}
		
		
	}
}