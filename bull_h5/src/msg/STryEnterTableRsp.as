package msg
{
	import com.IProtobuf.Long;
	import conf.SNetAddress;
	import com.IProtobuf.Message;

	public class STryEnterTableRsp extends Message
	{

		public var error_code:int = 1;
		public var room_id:int = 3;
		public var net_address:conf.SNetAddress = null;
		public var token:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
