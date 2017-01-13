package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class SBetNotify_Bet extends Message
	{

		public var uid:Long = null;
		public var position:int = 2;
		public var value:int = 3;
		public function writeTo(value:*):void{
		}
	}
}
