package conf
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class SUserInfo extends Message
	{

		public var uid:Long = null;
		public var money:conf.SBullMoney = null;
		public var is_light:Boolean = 3;
		public var win_money:Long = null;
		public var bet_money:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
