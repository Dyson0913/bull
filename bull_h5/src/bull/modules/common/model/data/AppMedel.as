package bull.modules.common.model.data
{
	import com.IProtobuf.Long;
	import com.netease.protobuf.Int64;
	import com.netease.protobuf.UInt64;
	import laya.utils.Log;

	
	public class AppMedel 	
	{
		public static const NAME:String = "appMedel";
		
		//通用資訊
		public var app_id:String = "";
		public var user_id:String = "";
		private var _nick_name_64:String = "";
		private var _nick_name:String = ""; 
		public var uin:int;
		public var access_token:String;   //经过处理后的加密验证token
		public var timestamp:Int64;		//时间戳
		public var extra:String;
		public var userHeadIcon:String="";
		public var takeinTimeOut:uint = 0;
		
		//背景音樂
		public var soundbg:Sound =null;
		public var soundbg_channel:SoundChannel = null;
		
		
		//SERVER 版號
		public var Server_version:String;
		
		//遊戲狀態
		public static const START:int = 1; 
		public static const BANKER:int = 2;
		public static const BET:int = 3;
		public static const BET_CHECK:int = 4;
		public static const DEAL:int = 5;
		public static const END:int = 6;			
		public var gameState:int;
		public var RoundID:String;
		
		//下注相關
		public var TotalMoney:Number;
		public var Bet_money:int;
		public var chipVo:ChipVo;
		public var myBetClip:Number;
		public var IsBetMax:Boolean;
		public var IsRepeat:Boolean;
		public var Is_Inside_take:Boolean;
		public var where_is_lamp:int;
		public var Current_chipValue:Array;
		
		public var roomParam:RoomParam;
		public var dataStartStatus:StartStatusVo; 
		public var dataResult:ShowResultVo;
		public var sameBetinfo:Array;
		
		public var popWin:Boolean;
		public  var pop_windows:IAlertWindow; 
		public  var pop_Banker_continue_windows:IAlertWindow; 
		public  var banker_default_ok:int 
		public  var Totalplayer_in_table:int 
		
		//桌內玩家列表
		public var TablePlayerlist:Array;
		public var TabPlayerList:Array;		
		
		public var apply_type:int;
		public var applybanker_success:Boolean;
		public var applydebanker_success:Boolean;
		
		//坐庄
		public var WaitBankList:Array;
		public var Banker_uid:String;
		public var banker_settle_show:Boolean;
		
		//歷史記錄
		public var dataRecord:RecordVo;
		
		//poker 
		public var pokerdata:Array;
		public var Winlost_zone:Array;
		
		//結算
		public var first_threePlayer:Array;
		public var self_settle_win:Long;
		public var Settle_Time:int;
		
		
		public var Banker_settle:Array;
		public var Banker_Total_settle:Int64;
		
		public var half_in_update:Boolean;
		public var half_in_bet:Number;
		
		public var dataLastCarStopPosition:uint;
		public var dataCurTime:int;
				
		public var viewTakeMoney:AssetsInPanel = null;
		public var alertOpenedDic:Dictionary = null; //处理弹出两次
		public var xmlClipConfig:XML = null;
		public var BetRecode:Boolean;
		
		public function AppMedel()
		{
			dataStartStatus = new StartStatusVo();
			dataResult = new ShowResultVo();
			dataRecord = new RecordVo();
			dataLastCarStopPosition = 0;
			dataCurTime = 0;			
			pokerdata =[];
			TablePlayerlist = [];
			first_threePlayer = [];
			TabPlayerList = [];
			WaitBankList = [];
			Banker_settle = [];
			Winlost_zone = [];
			Current_chipValue = [];
			sameBetinfo= [];
			
			TotalMoney = 0;
			Banker_uid ="0";
			banker_settle_show =  false;
			BetRecode = false;
			Is_Inside_take = false;
			myBetClip = 0;
			applybanker_success = false;
			applydebanker_success = false;
			popWin = false;
			half_in_update = false;
			
			alertOpenedDic = new Dictionary(true);
		}
		
		public function restart():void
		{
		}
		
		public function get nick_name():String
		{
			return _nick_name;
		}
		
		public function set nick_name(value:String):void
		{
			_nick_name = value;
		}
		
		public function get nick_name_64():String
		{
			return _nick_name_64;
		}
		
		public function set nick_name_64(value:String):void
		{
			_nick_name_64 = value;
			//nick_name = Base64.decode(value);
		}		
		
		public function getClipBets( clipType:uint ):Array
		{
			if( xmlClipConfig == null )
				return null;
			var items:XMLList = xmlClipConfig.Item;
			var result:Array = [];
			for each (var item:XML in items)  
			{
				if( clipType == int(item.type) )
				{
					result = String(item.value).split("、");
					break;
				}
			}
			if( result.length == 0 )
				return null;
			for (var i:int = 0; i < result.length; i++) 
			{
				result[i] = Number(result[i]); 
			}
			return result;
		}
	}
}