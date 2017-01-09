package msg
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;
	import conf.SUserInfo;

	public class SCalculateNotify extends Message
	{

		public var banker_id:Long = null;
		public var win_money:Long = null;
		public var hand_money:Long = null;
		public var user_info_s:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
