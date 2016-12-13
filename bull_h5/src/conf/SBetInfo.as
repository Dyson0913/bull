package conf
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class SBetInfo extends Message
	{

		public var money:Long = null;
		public var user_info_s:Array = null;
		public var light_bet:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
