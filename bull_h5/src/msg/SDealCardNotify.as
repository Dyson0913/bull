package msg
{
	import conf.SDealInfo;
	import com.IProtobuf.Message;

	public class SDealCardNotify extends Message
	{

		public var banker:conf.SDealInfo = null;
		public var _1:conf.SDealInfo = null;
		public var _2:conf.SDealInfo = null;
		public var _3:conf.SDealInfo = null;
		public var _4:conf.SDealInfo = null;
		public function writeTo(value:*):void{
		}
	}
}
