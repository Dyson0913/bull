package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class SBetRsp extends Message
	{

		public var error_code:int = 1;
		public var position:int = 2;
		public var hand_money:Long = null;
		public var bet_money:int = 4;
		public function writeTo(value:*):void{
		}
	}
}
