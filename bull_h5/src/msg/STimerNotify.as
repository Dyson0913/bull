package msg
{
	import com.IProtobuf.Message;

	public class STimerNotify extends Message
	{

		public var timeStamp:uint = 1;
		public var timeLeft:int = 2;
		public var status:int = 3;
		public var bet_area:Boolean = 4;
		public var sure_area:Boolean = 5;
		public var deal_area:Boolean = 6;
		public var end_area:Boolean = 7;
		public var order_id:String = "8";
		public function writeTo(value:*):void{
		}
	}
}
