package conf
{
	import com.IProtobuf.Message;

	public class SRoomInfo extends Message
	{

		public var config:SRoomConfig = null;
		public var cur_player:int = 20;
		public function writeTo(value:*):void{
		}
	}
}
