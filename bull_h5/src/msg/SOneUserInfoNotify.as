package msg
{
	import conf.SUserInfo;
	import com.IProtobuf.Message;

	public class SOneUserInfoNotify extends Message
	{

		public var user_info:conf.SUserInfo = null;
		public var type:int = 2;
		public function writeTo(value:*):void{
		}
	}
}
