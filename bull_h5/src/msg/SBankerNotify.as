package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class SBankerNotify extends Message
	{

		public var banker_id:Long = null;
		public var hand_money:Long = null;
		public var banker_time:int = 3;
		public var max_time:int = 4;
		public function writeTo(value:*):void{
		}
	}
}
