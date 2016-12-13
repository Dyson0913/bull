package bull.modules.BullHall.model
{
	
	import com.IProtobuf.Long;
	
	import bull.modules.common.model.param.RoomParam;
	

	public class HallAppMedel
	{			
		
		public var app_id:String="0a636149fdf36c98e47e7b4e62fdbc7a";
		public var access_token:String;   //经过处理后的加密验证token
		public var timestamp:Long;		//时间戳
		
		public var extra:String;////////////////log需要的特殊字符		
		
		public var Lobby_token:Long;
		
		//目前選擇幣別
		public var room_type:int;
		
		//己開的房間,id
		public var already_join_roomType:int;
		public var already_join_roomId:int;
		
		public var roomLists:Array = [];
		public var roomParam:RoomParam;
		public var join_group:int;
		public var join_IP:String;
		public var join_Port:int;
		public var Join_roomId:int;	
		
		//BGM
		public var sound_playing:Boolean;
		
		public var pushmsg:Array;
		
		//TODO 
		public var currency_allowed:Array;/////允许的货币类型
		
		public var injector:Array = ["UserInfoModel"];

		
		public function HallAppMedel()
		{
			roomParam = new RoomParam();			
			join_group = 0;
			
//			enum ENRoomType {
//				ROOM_TYPE_COIN             = 1; // 虚拟币
//				ROOM_TYPE_CASH             = 2; // 现金
//				ROOM_TYPE_CASH_NM          = 3; // 现金拟码
//			}
			room_type = 1;
			pushmsg =[];
		}
		
	}
}