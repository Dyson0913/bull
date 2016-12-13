package conf
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class SUserInfo extends Message
	{

		public var uid:Long = null;
		public var money:conf.SBullMoney = null;
		public var is_lamp:Boolean = 3;
		public var vip:int = 4;
		public var win_money:Long = null;
		public var bet_money:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
