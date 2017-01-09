package msg
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class SBetNotify_Bet extends Message
	{

		public var uid:Long = null;
		public var position:int = 2;
		public var value:int = 3;
		public function writeTo(value:*):void{
		}
	}
}
