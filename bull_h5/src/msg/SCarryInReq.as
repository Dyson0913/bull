package msg
{
	import conf.SBullMoney;
	import com.IProtobuf.Message;

	public class SCarryInReq extends Message
	{

		public var money:conf.SBullMoney = null;
		public var token:String = "2";
		public function writeTo(value:*):void{
		}
	}
}
