package conf
{
	import com.IProtobuf.Message;

	public class SRoomConfig extends Message
	{

		public var room_id:int = 1;
		public var room_type:int = 2;
		public var min_bet:int = 3;
		public var max_bet:int = 4;
		public var room_name:String = "5";
		public var max_player:int = 6;
		public var room_limit:int = 7;
		public var player_limit:int = 8;
		public var banker_limit:int = 9;
		public var banker_times:int = 10;
		public var pump_rate:int = 11;
		public var is_robbery:Boolean = 12;
		public var is_multi:Boolean = 13;
		public var water_level:int = 14;
		public var time_id:int = 15;
		public function writeTo(value:*):void{
		}
	}
}
