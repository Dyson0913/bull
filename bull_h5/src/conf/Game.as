package conf
{
	import com.IProtobuf.Message;

	public class Game extends Message
	{

		public var dirty_words:Array = null;
		public var notices:Array = null;
		public var mails:Array = null;
		public var room_config:Array = null;
		public var time_config:Array = null;
		public var water_level_config:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
