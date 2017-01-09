package msg
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class SEnterTableReq extends Message
	{

		public var room_id:int = 1;
		public var token:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
