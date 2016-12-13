package msg
{
	import com.IProtobuf.Message;
	import conf.SNetAddress;

	public class ConnSvrInfo extends Message
	{

		public var listen_addresses:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
