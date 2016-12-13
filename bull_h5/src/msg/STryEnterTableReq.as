package msg
{
	import com.IProtobuf.Message;

	public class STryEnterTableReq extends Message
	{

		public var room_type:int = 1;
		public var room_id:int = 2;
		public function writeTo(value:*):void{
		}
	}
}
