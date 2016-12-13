package conf
{
	import com.IProtobuf.Message;

	public class Mail extends Message
	{

		public var type:int = 1;
		public var mail_type:uint = 2;
		public var sender:String = "3";
		public var title:String = "4";
		public var content:String = "5";
		public function writeTo(value:*):void{
		}
	}
}
