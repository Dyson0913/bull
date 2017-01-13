package conf
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class SBetInfo extends Message
	{

		public var money:Long = null;
		public var user_info_s:Array = null;
		public var light_bet:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
