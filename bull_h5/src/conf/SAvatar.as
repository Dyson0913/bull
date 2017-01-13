package conf
{
	import com.IProtobuf.Message;

	public class SAvatar extends Message
	{

		public var uid:int = 1;
		public var username:String = "2";
		public var nickname:String = "3";
		public var avatar:String = "4";
		public function writeTo(value:*):void{
		}
	}
}
