package msg
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class SBankerNotify extends Message
	{

		public var banker_id:Long = null;
		public var hand_money:Long = null;
		public var banker_time:int = 3;
		public var max_time:int = 4;
		public var banker_status:int = 5;
		public var player_count:int = 6;
		public function writeTo(value:*):void{
		}
	}
}
