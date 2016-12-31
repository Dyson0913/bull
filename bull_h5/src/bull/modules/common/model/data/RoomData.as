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
		
		public var RoundID:int;			//局ID
		public var LeftTime:int;     //剩余时间 SEC
		
		//hisotry
		public var history_Win_info:Array;
		public var history_lost_info:Array;
		public var history_result_info:Array;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		private  var _chips:Array;
		public var chipTool:BetSplit = new BetSplit();
				
//		private var _betInfo:Array;///////////////////BetInfo 当前所有下注信息
		private var _carLocation:int = 0;//////////////////////小车位置
		private var _lotteruResult:int;////////////////开奖结果
		
//		public var canGame:Boolean = false;
		
		private var _status:int;///////////////RoomStatusType  START_BET:int = 0  开始下注      END_BET:int = 1 结束下注     LOTTERY_DRAW:int = 2  开奖 后   
//		private var _serverStatus:int = -1;/////////初始化的 时候服务端的状态  下注阶段的话 可以正常开启游戏  非下注阶段则显示游戏中  等下一个START_BET指令解锁 
		
		
		private var _otherUserBets:Array = [0,0,0,0,0,0,0,0];///////////////////八门下注的总信息
		private var _selfBets:Array = [0,0,0,0,0,0,0,0];///////////////自己的八门下注信息 
		
		
		
		public static const ADD_BET:String = "addBet";
		public static const REMOVE_BET:String = "removeBet";
		public static const ADD_BET_SELF:String = "addBetSelf";
		public static const REMOVE_BET_SELF:String = "removeBetSelf";
		public static const CANCEL_BET_SELF:String = "cancelBetSelf";
		//----------end of events---------------
		public var cash:Boolean;
		public var coin:Boolean;
		public var nm:Boolean;
		public var betTime:uint;
		public var confirmTime:uint;
		public var countTime:uint;
		private var _playerBalance:Money;
		private var _playerSavedBet:Array = [];
		private var _hitHistoryAry:Array=[];
		private var _hitStatisticsAry:Array = [0,0,0,0,0,0,0,0];
		private var _roundInfo:RoundInfo;
		private var _roundResult:RoundResult;
		private var _chipsType:int;							//房间货币类型
		/** 保存筹码配置列表  数据源bin/h5/res/config/clipConfig.json */
		public var dataSelectClips:Array = null;
		public var login:Boolean = false; 				//是否为房间登录
		public var xutou:Boolean = false;
		public var chongzhi:Boolean = false;
		
		public function RoomData()
		{
		}
		
		public function get chipsType():int
		{
			return _chipsType;
		}

		public function set chipsType(value:int):void
		{
			_chipsType = value;
		}

		public function get roundInfo():RoundInfo
		{
			return _roundInfo;
		}

		public function set roundInfo(value:RoundInfo):void
		{
			//没有局信息不处理(第一个进入者)
			if(!value) return;
			roundid = String(value.round_id);
			status = value.round_state;
			leftTime = Math.round(Long(value.state_remain_time).toNumber() / 1000);
			
			var ary:Array = [];
			for(var i:int =0;i<value.player_bets.length; i++){
				var amount:Number = chipsType == MoneyType.CASH ? value.player_bets[i].amount /100: value.player_bets[i].amount;
				var chipVo:ChipVO = new ChipVO(true,value.player_bets[i].item_id, amount);
				ary.push(chipVo);
			}			
			addBetsSelf(ary);
			
			upDataBets(value.total_bets);
			_roundInfo = value;
		}
		
		public function get hitStatisticsAry():Array
		{
			return _hitStatisticsAry;
		}

		public function set hitStatisticsAry(value:Array):void
		{
			if( value == null || value.length==0 )
				_hitStatisticsAry = [0,0,0,0,0,0,0,0];
			else{
				for(var i:int = 0; i<value.length; i++){
					_hitStatisticsAry[value[i].id] = value[i].num;
				}
			}
		}

		public function get hitHistoryAry():Array
		{
			return _hitHistoryAry;
		}

		public function set hitHistoryAry(value:Array):void
		{
			_hitHistoryAry = value;
		}

		public function get playerSavedBet():Array
		{
			return _playerSavedBet;
		}

		public function set playerSavedBet(value:Array):void
		{
			_playerSavedBet = value;
			dispatchEvent(new Event(LASTTIME_BET_RECORD));
		}

		public function get playerBalance():Money
		{
			return _playerBalance;
		}

		public function set playerBalance(value:Money):void
		{
			_playerBalance = value;
			dispatchEvent(new Event(USER_BALANCE_CHANGE));
		}
		
		public function transformChipVoList(ary:Array, moneyType:int):Array{
			var chips:Array = [];
			var chipVO:ChipVO;
			for(var i:int=0; i<ary.length; i++){
				var bet:Number = ary[i].amount;
				//如果是现金要转换单位元
				if(moneyType == MoneyType.CASH) bet = bet / 100;
				var chip:BetInfoVO = chipTool.getChip(bet);
				if(!chip){
					//找不倒 一个整的筹码  需要拆分
					var temp:BetSlipParam = chipTool.splitBet(bet);
					for (var j:int = 0; j < temp.chips.length; j++) 
					{
						chip = temp.chips[j];
						chipVO = new ChipVO(true,ary[i].item_id, chip.value);
						chips.push(chipVO);
					}
					
				}else{
					chipVO = new ChipVO(true,ary[i].item_id, bet);
					chips.push(chipVO);
				}
			}
			return chips;
		}

		/**
		 * 自己撤销下注 
		 * 
		 */		
		public function cancelBetSelf(userInfo:UserInfoData):void{
			for (var i:int = 0; i < _selfBets.length; i++) 
			{
				userInfo.balance += Number(_selfBets[i]);
				_selfBets[i] = 0;
			}
			event(CANCEL_BET_SELF);
		}
		
		/**
		 * 看自己是否已经下注 
		 * @return 
		 * 
		 */		
		public function isSelfBet():Boolean{
			for (var i:int = 0; i < _selfBets.length; i++) 
			{
				if(_selfBets[i] > 0) return true;
			}
			return false;
		}
		
		public function getBets():Array{
			var re:Array = [];
			for (var i:int = 0; i < 8; i++) 
			{
				re.push(_otherUserBets[i]+_selfBets[i]);
			}
			return re;
		}
		
		public function getChipByID(id:int):int{
			if(id >= chips.length) return -1;
			return chips[id];
		}
		
		public function clear():void{						
			_selfBets = [0,0,0,0,0,0,0,0,0];
			_otherUserBets = [0,0,0,0,0,0,0,0,0];
			xutou = false;
		}
		
		public function startBet(roundID:String):void{
			clear();
						
			
			status = RoomStatusType.START_BET;
			dispatchEvent(new Event(START_BET));
		}
		
		public function endBet():void{
			
			status = RoomStatusType.END_BET;
			dispatchEvent(new Event(END_BET));
		}
		
		public function set roundResult(result:RoundResult):void
		{
			
			carLocation = result.location_id;
			_roundResult = result;
			status = RoomStatusType.LOTTERY_DRAW;
			dispatchEvent(new Event(LOTTERY_DRAW));
		}
		
		public function get roundResult():RoundResult{
			
			return _roundResult;
		}
		
		public function addBetSelf(id:int, amount:Number):void{
			var selfBet:Number = Number(_selfBets[id]);
			selfBet += Number(amount);
			_selfBets[id] = selfBet;
		}
		public function addBetsSelf(bets:Array):void{
			var bet:ChipVO;
			for (var i:int = 0; i < bets.length; i++) 
			{
				bet = bets[i];
				addBetSelf(bet.type,bet.value);
			}
			event(ADD_BET_SELF,[bets]);
		}
		
		public function getBetSelf(id:int):int{
			return _selfBets[id];
		}
		
		
		
		public function removeBetSelf(id:int, amount:int):void{
//			_otherUserBets[id] -= amount;
			_selfBets[id] -= amount;
		}
		public function deldelAllSelfBet():int{
			var sun:int = 0;
			var l:int = _selfBets.length;
			for (var i:int = 0; i < l; i++) 
			{
				if(_selfBets[i] > 0) {
					sun += _selfBets[i];
					removeBetSelf(i,_selfBets[i]);
				}
			}
			return sun;
		}
		
		public function upDataBets(values:Array):void{
			//正在游戏不处理下注信息
			var betInfo:BetInfo;
			for (var i:int = 0; i < values.length; i++) 
			{
				betInfo = values[i];
				var bet:Number = betInfo.amount.toNumber();
				bet = chipsType == MoneyType.CASH ? bet / 100 : bet;
				
				//总的下注减去自己的下注  得到他人的下注额
				var otherBets:int = bet - getBetSelf(betInfo.item_id);
				//trace(i,values[i] , _bets[i])
				if(otherBets >= 0 ){ 
					if(otherBets > _otherUserBets[betInfo.item_id]){
						trace("增加筹码",otherBets - _otherUserBets[betInfo.item_id]);
						var chip:ChipVO = new ChipVO(false,betInfo.item_id, otherBets - _otherUserBets[betInfo.item_id]);
						this.event(ADD_BET,chip);
					}else if(otherBets < _otherUserBets[betInfo.item_id]){
						trace("减少筹码",_otherUserBets[betInfo.item_id] - otherBets);	
						var remove_chip:ChipVO = new ChipVO(false,betInfo.item_id, _otherUserBets[betInfo.item_id] - otherBets);
						this.event(REMOVE_BET,remove_chip);
					}
					_otherUserBets[betInfo.item_id] = otherBets;
				}
			}
		}

		public function toString():String{
			return "{name:"+id+",status:"+status+",leftTime:"+leftTime+"}";
		}		

//		public function get betInfo():Array
//		{
//			return _betInfo;
//		}
//
//		public function set betInfo(value:Array):void
//		{
//			_betInfo = value;
//		}

		public function get carLocation():int
		{
			return _carLocation;
		}

		public function set carLocation(value:int):void
		{
			_carLocation = value;
		}

		public function get lotteruResult():int
		{
			return _lotteruResult;
		}

		public function set lotteruResult(value:int):void
		{
			_lotteruResult = value;
		}

		public function set chips(value:String):void
		{
			var temp:Array = JSON.parse(value) as Array;
			
			var config:Array = [];
			for (var i:int = 0; i < temp.length; i++) 
			{
				config.push(new BetInfoVO(temp[i][0],temp[i][1]));
			}
			if(config.length == 0) throw new Error("筹码配置信息错误");
			chipTool.betConfig = config;
		}

		

		public function set tableInfo(value:TableInfoNotify):void
		{
			state =value.table_state;
			carLocation = value.cur_location_id;
			//中奖历史
			hitHistoryAry = value.item_id;
			//中奖结果统计
			hitStatisticsAry = value.item_hit_sts;
			//当前局信息
			roundInfo = value.cur_round;
			
			//下注时间
			betTime = value.bet_time / 1000;
			//确认时间
			confirmTime = value.confirm_time / 1000;
			//结算时间
			countTime = value.cashing_time / 1000;
			
			//玩家余额信息
			playerBalance = value.player_balance;
			//玩家上一局投注信息
			playerSavedBet = value.player_saved_bet;
			dispatchEvent(new LightEvent(UPDATA));
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
		
		public function addOtherUserBet(type:int, value:int):void
		{
			_otherUserBets[type] += value;
		}
		
		public function getOtherUserBet(type:int):Number{
			return _otherUserBets[type];			 
		}
		
		
		public function minusOtherUserBet(type:int, value:int):void
		{
			_otherUserBets[type] -= value;
		}
	}
}