package conf
{
	import com.IProtobuf.Message;
	import com.IProtobuf.Long;

	public class SBankerCalcInfo extends Message
	{

		public var banker_type:int = 1;
		public var _1_type:int = 2;
		public var _2_type:int = 3;
		public var _3_type:int = 4;
		public var _4_type:int = 5;
		public var win_money:Long = null;
		public var round_id:String = "7";
		public function writeTo(value:*):void{
		}
	}
}
