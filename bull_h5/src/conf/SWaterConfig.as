package conf
{
	import com.IProtobuf.Message;

	public class SWaterConfig extends Message
	{

		public var room_type:int = 1;
		public var pump_rate:int = 2;
		public var water_level:int = 3;
		public function writeTo(value:*):void{
		}
	}
}
