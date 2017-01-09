package msg
{
	import conf.SBetInfo;
	import com.IProtobuf.Message;

	public class SBetNotify extends Message
	{

		public var m1:conf.SBetInfo = null;
		public var m2:conf.SBetInfo = null;
		public var m3:conf.SBetInfo = null;
		public var m4:conf.SBetInfo = null;
		public var light_pos:int = 8;
		public var bets:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
