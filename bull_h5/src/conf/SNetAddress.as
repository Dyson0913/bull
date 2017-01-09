package conf
{
	import com.IProtobuf.Message;

	public class SNetAddress extends Message
	{

		public var ip:String = "1";
		public var port:uint = 2;
		public var hport:uint = 3;
		public function writeTo(value:*):void{
		}
	}
}
