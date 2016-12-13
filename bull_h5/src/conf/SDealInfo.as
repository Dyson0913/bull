package conf
{
	import com.IProtobuf.Long;
	import com.IProtobuf.Message;

	public class SDealInfo extends Message
	{

		public var card1:int = 1;
		public var card2:int = 2;
		public var card3:int = 3;
		public var card4:int = 4;
		public var card5:int = 5;
		public var bull_type:int = 6;
		public var max_card:int = 7;
		public var odds:int = 8;
		public var player_win:Long = null;
		public function writeTo(value:*):void{
		}
	}
}
