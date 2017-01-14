package bull.modules.room.command
{
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.RoomData;
	import bull.modules.room.services.RoomSocketService;
	import com.lightMVC.interfaces.ICommand;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Command;
	import conf.SUserInfo;
	import msg.GetPlayerInfoRsp;
	
	import bull.events.BullNotification;	
	import bull.modules.perload.services.PreLoadService;	
	
	import msg.CS;
	import msg.ENCSType;
	import msg.ENError;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	
	public class UserNotifyCommand extends Command implements ICommand
	{
		public function UserNotifyCommand()
		{
			super();
		}
		
		override public function handler(notification:INotification):void{
			
			if(notification.getName() == ENCSType.CS_TYPE_ALL_USER_INFO_NOTIFY.toString()){
				alluser(notification.getBody() as CS);
			}			
			else if(notification.getName() == ENCSType.CS_TYPE_ONE_USER_INFO_NOTIFY.toString()){
				oneuser(notification.getBody() as CS);
			}			
			else if(notification.getName() == ENCSType.CS_TYPE_GET_PLAYER_INFO_REQ.toString()){
				userinfo_req(notification.getBody() as Array);
			}
			else if(notification.getName() == ENCSType.CS_TYPE_GET_PLAYER_INFO_RSP.toString()){
				userinfo_rep(notification.getBody() as CS);
			}
		}
		
		private function alluser(cs:CS):void
		{			
			trace("-------------------------------新玩家列表刷新");
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;			
			
			roomData.player_List_ob.length = 0;
			for ( var i:int = 0; i < cs.all_user_info_notify.user_info_s.length; i++)
			{
				var data:SUserInfo = cs.all_user_info_notify.user_info_s[i];
				
				var win_str:String = "";
				if ( data.win_money.toNumber() > 0) win_str = "赢" + roomData.appearMoney(roomData.GetMoney(data.win_money));
				else if( data.win_money.toNumber() < 0) win_str = "输" + roomData.appearMoney(roomData.GetMoney(data.win_money));
				else win_str = "0";
				
				var ob:Object = { "idx":i,"uid":data.uid,"is_light":data.is_light, "win_money":win_str};
				roomData.player_List_ob.push(ob);				
			}			
			
			//取回頭像資訊
			for (var i:int = 0; i< roomData.player_List_ob.length; i++)
			{
				var data:Object = roomData.player_List_ob[i];
				
				sentNotification(ENCSType.CS_TYPE_GET_PLAYER_INFO_REQ.toString(), [data.uid.toNumber()]);
			}
			
			//等一下再發送更新,確保玩家資訊都取回
			Tween.to(this, {}, 500,Ease.cubicOut,Handler.create(this,infoHandler));			
		}
		
		public function infoHandler():void
		{			
			sentNotification(BullNotification.USER_NOTIFY);
		}
		
		private function oneuser(cs:CS):void
		{	
			trace("-------------------------------新的玩家進入");
			var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;			
			
			
			var data:SUserInfo = cs.one_user_info_notify.user_info;				
			var win_str:String = "";
			if ( data.win_money.toNumber() > 0) win_str = "赢" + roomData.appearMoney(roomData.GetMoney(data.win_money));
			else if( data.win_money.toNumber() < 0) win_str = "输" + roomData.appearMoney(roomData.GetMoney(data.win_money));
			else win_str = "0";
			
			var ob:Object = { "idx":i,"uid":data.uid,"is_light":data.is_light, "win_money":win_str};
			roomData.player_List_ob.push(ob);
			
			//更新用戶訊息
			roomData.user_info_callback = this.get_info_ok;
			sentNotification(ENCSType.CS_TYPE_GET_PLAYER_INFO_REQ.toString(), [data.uid.toNumber()]);			
		}
		
		private function get_info_ok():void
		{			
			//調用完變回null
			user_info_callback = null;
			sentNotification(BullNotification.USER_NOTIFY);
		}
		
		private function userinfo_req(uid_and_callback:Array):void
		{			
			var proto:BullProtoModel = getModel(BullProtoModel.NAME) as BullProtoModel;
			var out:CS = proto.msg_proto.getCS();
			out.msg_type = ENCSType.CS_TYPE_GET_PLAYER_INFO_REQ;
			out.get_player_info_req = proto.msg_proto.getGetPlayerInfoReq();
			
			var uid:Number = uid_and_callback[0];
			out.get_player_info_req.uid_s = uid.toString();
			
			var socket:RoomSocketService = getModel(RoomSocketService.NAME) as RoomSocketService;
			socket.sentMsg(out);
		}
		
		private function userinfo_rep(cs:CS):void
		{	
			trace("-------------------------------玩家訊息取得");			
			var rsp:GetPlayerInfoRsp = cs.get_player_info_rsp;
			var ob:Object = JSON.parse(rsp.json_result);			
			if ( ob.code == ENError.ERROR_OK) 
			{
				var uid:String;
				var info:Object;
				for (var id:String in ob.result)
				{
					uid = id;
					info = ob.result[id];
				}
				
				var roomData:RoomData = getSingleton(RoomData.NAME) as RoomData;
				roomData.attch_to_player_List_ob(info);					
				
				if (roomData.user_info_callback != null)
				{
					roomData.user_info_callback.apply();
				}
			}
		}
		
		
		
	}
}