package msg
{
	import com.IProtobuf.Message;

	public class SEnterTableRsp extends Message
	{

		public var error_code:int = 1;
		public var serverinfo:String = "2";
		public var room_id:int = 3;
		public var table_id:int = 4;
		public var room_type:int = 5;
		public function writeTo(value:*):void{
		}
	}
}
