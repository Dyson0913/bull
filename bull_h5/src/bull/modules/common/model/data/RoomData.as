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
	import conf.ENMoneyType;
	import conf.SBankerCalcInfo;
	import conf.SRoomConfig;
	import conf.SUserInfo;
	import laya.utils.Handler;
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
		public var Cash_Type:ENMoneyType;
		public var room_info:SRoomConfig;		
		
		
		// player_Money.cash
		// player_Money.coin
		// player_Money.nm	
		public var uid:Number;
		public var user_name:String;
		public var user_head:String;
		public var player_Money:Object;
		
		
		
		
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
		public var player_List_ob:Array;
		
		//card_info
		public var card_info:Array;
		public var each_zone_win:Array;
		public var each_zone_display:Array;
		
		//settle_info		
		public var settle_banker_id:Long;
		public var settle_win_money:Long;
		public var settle_hand_money:Long;		
		public var settle_User_info:Array;
		
		//banker_info
		public var banker_num:int;
		public var bankerlist:Array;
		public var banker_id:Long;
		public var apply_type:int;
		
		
		public var newBaner_info:SBankerNotify;
		public var Banker_calcu_info:SBankerCalculateNotify;		
		
		//bet info
		public var Total_money:Number;
		public var bet_zone:int;
		public var bet_idx:int;
		public var Has_bet:Boolean;
		public var rest_betlimit:Number;
		public var light_po:int;
		
		//四區個人和他人下注
		public var Zone_Total_bet:Array;
		public var Zone_self_bet:Array;
		public var sameBetinfo:Array;
		
		
		/** 保存筹码配置列表 **/
		public var dataSelectClips:Array = null;
		public var chipTool:BetSplit = new BetSplit();
		
		public function RoomData()
		{			
			
			user_name = "";
			user_head = "";
			
			history_Win_info = [];
			history_lost_info = [];
			history_result_info = [];
			
			player_List_ob = [];			
			
			
			card_info = [];
			
			each_zone_win = [];
			each_zone_display = [];
			
			Zone_Total_bet = [0,0,0,0];
			Zone_self_bet = [0,0,0,0];
			sameBetinfo = [];
			light_po = -1;
			
			uid = 0;
			Has_bet = false;
			banker_id = Long.fromNumber( -1);
			
			settle_User_info = [];
			
			Banker_calcu_info = new SBankerCalculateNotify();
		}
		
		public function IsMoney(money:Number):Boolean
		{
			return (Cash_Type != ENMoneyType.MONEY_TYPE_COIN) == true ? true : false;
		}
		
		public function GetMoney(money:Number):Number
		{
			return (Cash_Type != ENMoneyType.MONEY_TYPE_COIN) == true ? money / 100 : money;
		}
		
		public function appearMoney(num:Number):String
		{
			return (Cash_Type != ENMoneyType.MONEY_TYPE_COIN) == true ? ("¥"+num.toFixed(2)) : num.toString();
		}
		
		public function IsSysBanker():Boolean
		{
			return banker_id.toNumber() == 0 ? true: false;  
		}
		
		public function IsSelfBanker():Boolean
		{
			return banker_id.toNumber() == uid ? true: false;  
		}
		
		public function GetTotalBet():Number
		{
			var total:Number = 0;
			for (var i:int = 0; i < 4; i++)
			{
				if (banker_id.toNumber() == uid) total += Zone_Total_bet[i];
				else total += Zone_self_bet[i];
			}
			
			return total;
		}		
		
		public function find_banker(type:String):String
		{
			for (var j:int = 0; j < player_List_ob.length; j++)
			{
				var ob:Object = player_List_ob[j];				
				if ( ob.uid == banker_id)
				{
					return ob[type];
				}
			}
			
			//找不到,為系統當庄
			return "res/gameScene/HeadIcon.jpg";
		}
		
		public function find_self(type:String):String
		{
			for (var j:int = 0; j < player_List_ob.length; j++)
			{
				var ob:Object = player_List_ob[j];				
				if ( ob.uid == uid)
				{
					return ob[type];
				}
			}
			return null;
		}
		
		public function find_player(type:String,id:Number):String
		{
			for (var j:int = 0; j < player_List_ob.length; j++)
			{
				var ob:Object = player_List_ob[j];				
				if ( ob.uid == id)
				{
					return ob[type];
				}
			}
			return null;
		}
		
		//資料由 info 轉移到 roomData.player_List_ob
		public function attch_to_player_List_ob(info:Object):void
		{
			//msg =uid = 1014461
			//msg =username = dy***3
			// msg =nickname = 
			// msg =avatar = http://statics.kgame63.com/common/images/avatars/1.png		
			
			for (var j:int = 0; j < player_List_ob.length; j++)
			{
				var ob:Object = player_List_ob[j];				
				if ( ob.uid.toNumber() == info.uid)
				{
					ob["username"] = info.username;
					ob["nickname"] = info.nickname;
					ob["avatar"] = info.avatar;						
				}
			}
			
			//是自己的就存起來			
			if (info.uid == uid) 
			{
				user_name = info.username;
				user_head = info.avatar;
			}
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