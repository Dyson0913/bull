package msg
{
	import com.IProtobuf.Message;

	public class SBetReq extends Message
	{

		public var position:int = 1;
		public var bet_money:int = 2;
		public function writeTo(value:*):void{
		}
	}
}
