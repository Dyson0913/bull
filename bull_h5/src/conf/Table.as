package conf
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class Table extends Message
	{

		public var table_id:uint = 1;
		public var table_name:String = "2";
		public var table_type:int = 3;
		public var min_bet:Long = null;
		public var max_bet:Long = null;
		public var max_player:int = 6;
		public var bet_time:int = 7;
		public var confirm_time:int = 8;
		public var cashing_time:int = 9;
		public function writeTo(value:*):void{
		}
	}
}
