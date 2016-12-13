package msg
{
	import com.IProtobuf.Message;

	public class SExitTableRsp extends Message
	{

		public var error_code:int = 1;
		public function writeTo(value:*):void{
		}
	}
}
