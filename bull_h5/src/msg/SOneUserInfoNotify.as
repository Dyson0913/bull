package msg
{
	import com.IProtobuf.Message;
	import conf.SUserInfo;

	public class SOneUserInfoNotify extends Message
	{

		public var user_info:conf.SUserInfo = null;
		public var type:int = 2;
		public function writeTo(value:*):void{
		}
	}
}
