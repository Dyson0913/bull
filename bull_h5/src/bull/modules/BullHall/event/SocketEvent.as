package BullHall.event
{
	public class SocketEvent extends BullHallEvent
	{
		public static const CONNECT:String = "carHall.CONNECT";
		public static const CONNECT_FINISH:String = "carHall.CONNECT_FINISH";
		public static const SEND:String = "carHall.SEND";
		public static const CLOSE:String = "close";
		public static const CONNECT_FAIL:String = "carHall.connectFail";
		/** 没有心跳，没有网络 */
		public static const No_Heart_No_Net:String = "carHall.No_Heart_No_Net";
		
		public function SocketEvent(type:String, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type,data, bubbles, cancelable);
		}
	}
}