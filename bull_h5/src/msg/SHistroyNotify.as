package msg
{
	import conf.SResultInfo;
	import com.IProtobuf.Message;
	import conf.SCountInfo;

	public class SHistroyNotify extends Message
	{

		public var win_info:conf.SCountInfo = null;
		public var lose_info:conf.SCountInfo = null;
		public var result_info:Array = null;
		public function writeTo(value:*):void{
		}
	}
}
