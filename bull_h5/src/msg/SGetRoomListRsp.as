package msg
{
	import com.IProtobuf.Long;
	import conf.SRoomInfos;
	import com.IProtobuf.Message;
	import conf.SNetAddress;

	public class SGetRoomListRsp extends Message
	{

		public var error_code:int = 1;
		public var room_infos:conf.SRoomInfos = null;
		public var room_type:int = 3;
		public var room_id:int = 4;
		public var net_address:conf.SNetAddress = null;
		public var token:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
