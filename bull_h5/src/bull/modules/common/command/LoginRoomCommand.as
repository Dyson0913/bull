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
	
	public class LoginRoomCommand extends Command implements ICommand
	{
		public function LoginRoomCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			if(notification.getName() == BullNotification.LOGIN_ROOM_RQS){
				onLoginRoomRqs();
			}else if(notification.getName() == ENCSType.CS_TYPE_LOGIN_RSP.toString()){
				onLoginRoomRsp(notification.getBody() as CS);
			}
		}
		
		private function onLoginRoomRqs():void{
			trace("onLoginRoomRqs");
			
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			bullData.hallData.ViewIn = "game";
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();			
			out.msg_type = ENCSType.CS_TYPE_LOGIN_REQ;
			out.login_req = proto.msg_proto.getLoginReq();
			out.login_req.uid = Long.fromNumber(bullData.uid);
			out.login_req.verify_sig = String(bullData.token);
			
			var socket:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			socket.sentMsg(out);
			
			
			//var carData:CarData = getSingleton(CarData.NAME) as CarData;
			//carData.roomLogin = true;
			//var userInfoData:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
			//userInfoData.uid = carData.uid;
			//var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
			//var proto:CarProtoModel = getModel(CarProtoModel.NAME) as CarProtoModel;
			//var out:CS = proto.msg_proto.getCS();
			//out.msg_type = ENCSType.CS_TYPE_LOGIN_REQ;
			//out.login_req = proto.msg_proto.getLoginReq();
			//out.login_req.uid = Long.fromNumber(carData.uid);
			//out.login_req.verify_sig = carData.token;
			//
			//var socket:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			//socket.sentMsg(out);
			//roomData.login = true;
		}
		
		private function onLoginRoomRsp(cs:CS):void{
			
			trace("room onLoginRoomRsp" + cs);								
			
			var bullData:Data = getSingleton(Data.NAME) as Data;			
			if ( bullData.hallData.ViewIn != "game")
			{
				trace("room 目前在大廳 return");
				return;
			}			
			
			//TODO
			(getMediator(BullScenceMediator.NAME) as BullScenceMediator).sendHeartBeat();
			
			//請求房間
			sentNotification(ENCSType.CS_TYPE_ENTER_TABLE_REQ.toString());						
			return;
			
			//var carData:CarData = getSingleton(CarData.NAME) as CarData;
			//if(!carData.roomLogin) return;
			//carData.roomLogin = false;
			//var rsp:LoginRsp = cs.login_rsp;
			//if(rsp.result != ENError.ERROR_OK){
				//Alert.show(Light.error.getError(rsp.result.toString()),"",AlertPanel);
			//}else{
				//var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
				//if(!roomData.login) return;
				//roomData.login = false;
				//roomData.coin  = rsp.currency.coin;
				//roomData.nm  = rsp.currency.nm;
				//roomData.cash  = rsp.currency.cash;
				//var userInfoData:UserInfoData = getSingleton(UserInfoData.NAME) as UserInfoData;
				//userInfoData.headIcon = rsp.head_icon;
				//userInfoData.name = rsp.uname;
				//
				//(getMediator(CarScenceMediator.NAME) as CarScenceMediator).sendHeartBeat();
				//获取用户余额
				//sentNotification(ENCSType.CS_TYPE_ENTER_TABLE_REQ.toString());
			//}
		}
	}
}