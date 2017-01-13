package msg
{
	import com.IProtobuf.Message;
	import conf.SBankerCalcInfo;
	import com.IProtobuf.Long;

	public class SBankerCalculateNotify extends Message
	{

		public var total_win_money:Long = null;
		public var banker_calc_info_s:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
