package msg
{
	import conf.SBullMoney;
	import com.IProtobuf.Message;

	public class SCarryInRsp extends Message
	{

		public var error_code:int = 1;
		public var money:conf.SBullMoney = null;
		public function writeTo(value:*):void{
		}
	}
}
