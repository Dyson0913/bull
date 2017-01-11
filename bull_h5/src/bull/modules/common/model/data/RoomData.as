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
	
	import bull.modules.common.model.data.vo.ChipVO;
	import bull.modules.common.model.data.vo.ClipConfigVo;
	
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
		
		/** 保存筹码配置列表 **/
		public var dataSelectClips:Array = null;
		public var chipTool:BetSplit = new BetSplit();
		
		public function RoomData()
		{
			history_Win_info = [];
			history_lost_info = [];
			history_result_info = [];
			playerList = [];
			card_info = [];
			
			
			Banker_calcu_info = new SBankerCalculateNotify();
		}
		
		/**
		 * 初始化选择筹码配置 
		 */		
		public function initClipConfig():void
		{
			var objData:Object = Light.loader.getRes("clipConfig");
			if( objData == null )
				return;
			dataSelectClips = [];
			var objItem:Object;
			for each (objItem in objData) 
			{
				var dataSelectClip:ClipConfigVo = new ClipConfigVo();
				dataSelectClip.type = objItem.type; 
				dataSelectClip.selectClips = String(objItem.value).split("、");
				dataSelectClip.clipConfigs = String(objItem.config).split("、");
				dataSelectClips.push(dataSelectClip);
			}
		}
		
		/**
		 * 根据筹码类型，获取当前选择筹码面板的筹码 
		 * @param clipType
		 * @return 
		 */		
		public function getClipBets( clipType:uint ):ClipConfigVo
		{
			if( dataSelectClips==null || dataSelectClips.length==0 )
				return null;
			for (var j:int = 0; j < dataSelectClips.length; j++) 
			{
				var dataSelectClip:ClipConfigVo = dataSelectClips[j];
				if(dataSelectClip.type == clipType)
					return dataSelectClip;
			}
			return null;
		}
		
	}
}