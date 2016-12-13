package bull.modules.BullHall.common
{
	public class Common
	{
		public static const CASH:int = 1;	//现金场
		public static const COIN:int = 2;	//虚拟币场
		
		public static const GameWidth:uint = 920;
		public static const GameHeight:uint = 610;
		
		public static var appId:String = "4126d6e9e679c9574dc799e06fc70e6a";
		
		public static var path:String="";
		
		public static var SwfName:String = "BullHallSkin"; 
		/** 记录当前环境是本地环境还是平台web环境  true为平台web环境 */
		public static var isWeb:Boolean = false;
		/** 记录服务器是否关闭 */
		public static var isOpenServer:Boolean = true;
		public static var curTableId:int = -1;
		public static var isFirstConnect:Boolean = true;
		/** 异地登录通知大厅 当为true时，已经被已经登录踢下线 */
		public static var isOtherPlaceLogin:Boolean = false;
	}
}