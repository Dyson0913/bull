package bull.modules.common.model.data
{
	import com.iflash.events.EventDispatcher;
	import com.IProtobuf.Long;
	import com.lightUI.events.LightEvent;
		
	
	[Event(name="change", type="com.lightUI.events.LightEvent")]
	public class HallData extends EventDispatcher
	{
		
		
		public static const NAME:String = "hallData";
		
		
		private var _roomList:Array;////////////HallRoomVO
		public var _already_in_msg:String;
		public var _already_in_room_idx:int;
		
		private var _join_room_idx:int;
		public var ip:String
		public var port:int
		public var Token:Long;
		public var Cash_Type:int;
		
		public var ViewIn:String = "Lobby";	
		
		public function HallData()
		{
			super();
			_already_in_roomid = -1;
		}
		
		public function get roomList():Array
		{
			return _roomList;
		}		
		
		public function set roomList(value:Array):void
		{
			//trace("set roomList",value);
			_roomList = value;
			this.dispatchEvent(new LightEvent(LightEvent.CHANGE));
		}
		
		public function get join_room_idx():int
		{
			return _join_room_idx;
		}
		
		public function set join_room_idx(value:int):void
		{		
			_join_room_idx = value;			
		}

	}
}