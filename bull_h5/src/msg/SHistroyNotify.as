package msg
{
	import conf.SResultInfo;
	import conf.SCountInfo;
	import com.IProtobuf.Message;

	public class SHistroyNotify extends Message
	{

		public var win_info:conf.SCountInfo = null;
		public var lose_info:conf.SCountInfo = null;
		public var result_info:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
