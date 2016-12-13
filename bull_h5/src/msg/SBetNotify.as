package msg
{
	import com.IProtobuf.Message;
	import conf.SBetInfo;
	import com.IProtobuf.Long;

	public class SBetNotify extends Message
	{

		public var m1:conf.SBetInfo = null;
		public var m2:conf.SBetInfo = null;
		public var m3:conf.SBetInfo = null;
		public var m4:conf.SBetInfo = null;
		public var uid:Long = null;
		public var position:int = 6;
		public var value:int = 7;
		public var light_pos:int = 8;
		public function writeTo(value:*):void{
		}
	}
}
