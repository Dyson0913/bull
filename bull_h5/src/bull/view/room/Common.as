package bull.view.room
{
	public class Common
	{
		public static const GameWidth:uint = 920;
		public static const GameHeight:uint = 575;
		public static const SwfName:String = "BullSkin";
		public static const BetMax:uint = 99999;	
		public static var LoadCarAnimTimeOutTimer:Number = 3000; // 2秒
		public static var TakeInTimeOut:Number = 10000; //30秒
		
		public static const RunState_Bet:uint = 0;
		public static const RunState_StopBet:uint = 1;
		public static const RunState_ShowResult:uint = 2; 
		
		/** fla中拥有的可用所有筹码   如果是现金，单位为元  */
		public static var clipAlls:Array = [ 0.1, 0.5, 1, 5, 10, 50, 100, 500, 1000, 5000, 10000 ]; 
		/** 选择筹码的索引对应MovieClip的当前帧  如果是现金，单位为元 */
		public static var clipSelectAlls:Array =[ 10, 50, 100, 500,1000,-1];
		
		/** 当前选中的筹码 */
		public static var curSelectBetClip:Number = 1;
		/** 记录当前我桌子上的钱，如果是现金，单位为元 */
		public static var myClip:Number = 0;
		/** 记录我当前使用钱的类型，true为虚拟币   false为现金+尼玛  */
		public static var isCoin:Boolean = true; // 
		public static var isDownClip:Boolean = true; //默认可以下注.
		/** 是否第一次关闭窗口 */
		public static var isFirstCanel:Boolean = true;
		public static var curMyBetClip:Number = 0;
		/** 标记是否正在处理下注重置  */
		public static var isProcessBetReset:Boolean = false;
		/** 正在播放下注动画 记录正在飞的筹码 */
		public static var betPlayCount:int = 0;
		/** 当前游戏运行的状态 */
		public static var runStatus:int = -1;
		/** 下注时间  */
		public static var dwBetTime:uint = 10;
		/** 系统消息提示 gameLanguage.xml 配置的 alert_msg+index */
		public static var AlertSysMsg:String = "alert_SysMsg";
		
		
	}
}