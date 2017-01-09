package msg
{
	import com.IProtobuf.Message;
	import conf.SUserInfo;

	public class SBankerListNotify extends Message
	{

		public var player_count:int = 1;
		public var user_info_s:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
