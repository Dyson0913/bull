package bull.modules.common.model.data
{
	import com.IProtobuf.Long;
	import com.iflash.events.Event;
	import com.iflash.events.EventDispatcher;
	import com.lightUI.comman.bet.BetInfoVO;
	import com.lightUI.comman.bet.BetSlipParam;
	import com.lightUI.comman.bet.BetSplit;
	import com.lightUI.core.Light;
	import com.lightUI.events.LightEvent;
	import conf.SBankerCalcInfo;
	import conf.SUserInfo;
	import msg.SBankerCalculateNotify;
	import msg.SBankerNotify;
	
	import conf.BetInfo;
	import conf.Money;
	
	import light.car.modules.common.model.data.vo.ChipVO;
	import light.car.modules.common.model.data.vo.ClipConfigVo;
	
	import msg.RoundInfo;
	import msg.RoundResult;
	import msg.TableInfoNotify;

	public class RoomData extends EventDispatcher
	{
		public static const NAME:String = "roomData";
		
		
		public var id:int;//////////////////房间名字（id）
		public var name:String = "";////////////////房间用来展示的名字
		
		public var State:int;			//桌子状态 
		//-------------events---------------
		public static const START:int = 1; 
		public static const BANKER:int = 2;
		public static const BET:int = 3;
		public static const BET_CHECK:int = 4;
		public static const DEAL:int = 5;
		public static const END:int = 6;
		
		public var RoundID:String;			//局ID
		public var LeftTime:int;     //剩余时间 SEC
		
		//hisotry
		public var history_Win_info:Array;
		public var history_lost_info:Array;
		public var history_result_info:Array;
		
		//playerlist
		public var player_num:int;
		public var playerList:Array;
		
		//card_info
		public var card_info:Array;
		
		//settle_info		
		public var settle_banker_id:Long;
		public var settle_win_money:Long;
		public var settle_hand_money:Long;		
		public var settle_User_info:Array;
		
		//banker_info
		public var banker_num:int;
		public var bankerlist:Array;
		
		public var newBaner_info:SBankerNotify;
		public var Banker_calcu_info:SBankerCalculateNotify;
		
		
		
		
		public function RoomData()
		{
		}
		
	
		
	}
}