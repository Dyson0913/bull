package conf
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class Money extends Message
	{

		public var type:int = 1;
		public var num:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
