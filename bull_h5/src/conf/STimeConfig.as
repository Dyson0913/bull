package conf
{
	import com.IProtobuf.Message;

	public class STimeConfig extends Message
	{

		public var time_id:int = 1;
		public var start_time:int = 2;
		public var banker_time:int = 3;
		public var bet_time:int = 4;
		public var sure_time:int = 5;
		public var deal_time:int = 6;
		public var end_time:int = 7;
		public function writeTo(value:*):void{
		}
	}
}
