package BullHall.event
{
	
	
	public class BullHallEvent extends Event
	{
		public static const START_UP:String = "carhall.startUp";
		public static const CONFIG_LOADED:String = "carhall.configLoaded";
		public static const Login_Request:String = "carhall.Login_Request";
		public static const Heart_Start:String = "carhall.Heart_Start";
				
		//房間列表
		public static const Roomlist_Request:String = "carhall.Roomlist_Request";
		public static const Update_RoomInfo:String = "carhall.Update_RoomInfo";
		
		//申請加入桌
		public static const JoinTable_Request:String = "carhall.JoinTable_Request";
		
		//平台額度申請
		public static const Credit_Check:String = "carhall.Credit_Check";
		public static const MsgCode_NoEnoughMoney:String = "carHall.MsgCode_NoEnoughMoney";
		
		//多開處理
		public static const MsgCode_MultiOpen:String = "carHall.MsgCode_MultiOpen";
		public static const CAN_START_ONE_GAME:String = "carHall.canStartOneGame";
		public static const Multi_Login:String = "carHall.Multi_login";
		public static const MsgCode_NotOpenTwoClient:String = "carHall.MsgCode_NotOpenTwoClient";
		
		//推送公告
		public static const push_msg_notify:String = "carHall.push_msg_notify";
		
		//TODO check
		public static const SOUND_CONTROL:String = "carhall.soundControl";
		public static const ErrorCode:String = "carhall.ErrorCode";			
		
		
		public var data:Object;
		public function BullHallEvent(type:String, data:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.data = data;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new BullHallEvent(type,data,bubbles,cancelable);
		}
	}
}