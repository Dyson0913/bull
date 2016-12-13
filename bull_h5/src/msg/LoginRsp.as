package msg
{
	import com.IProtobuf.Message;

	public class LoginRsp extends Message
	{

		public var result:int = 1;
		public var source:uint = 2;
		public var currency:String = "3";
		public function writeTo(value:*):void{
		}
	}
}
