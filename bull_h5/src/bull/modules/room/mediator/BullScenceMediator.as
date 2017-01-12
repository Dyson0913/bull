package bull.modules.room.mediator
{
	import bull.modules.common.model.BullProtoModel;
	import bull.modules.common.model.data.AppMedel;
	import bull.modules.common.model.data.appmodel;
	import bull.view.room.Chip;
	import com.iflash.utils.BindMethod;
	import com.IProtobuf.Long;
	import com.lightMVC.interfaces.IMediator;
	import com.lightMVC.interfaces.INotification;
	import com.lightMVC.parrerns.Mediator;
	import com.lightUI.components.alert.Alert;
	import com.lightUI.core.Light;	
	import com.lightUI.events.ScenceManagerEvent;
	import conf.ENMoneyType;
	import conf.SBullMoney;
	import conf.SUserInfo;
	import laya.ui.Image;
	import msg.CS;
	import msg.SBetNotify_Bet;
	import msg.SCalculateNotify;
	
	import bull.view.room.Common;
	import com.lightUI.events.LightEvent;
	
	import laya.display.BitmapFont;
	import laya.display.Text;
	import laya.events.Event;
	import laya.maths.Rectangle;
	import laya.resource.Texture;
	import laya.utils.Handler;
	import laya.utils.Timer;	
	
	import bull.events.BullNotification;
	import light.car.events.CarSceneEvent;
	import bull.modules.common.mediator.MusicSetMediator;
	import bull.modules.common.mediator.RuleMediator;
	import light.car.modules.common.model.data.CarData;
	import light.car.modules.common.model.data.MoneyType;
	import bull.modules.common.model.data.RoomData;
	import bull.modules.common.model.data.UserInfoData;
	import light.car.modules.common.model.param.BetParam;
	import bull.modules.perload.services.PreLoadService;
	import bull.modules.room.services.RoomSocketService;
	import light.car.utils.AlertTextUtil;
	import bull.view.alert.AlertCancelPanel;
	import bull.view.room.BullScene;
	
	import bull.modules.common.model.data.Data;
	import bull.modules.common.model.data.HallData;
	
	import bull.utils.BetAreaUtil;
	import bull.modules.common.model.data.vo.ChipVO;
	import com.lightUI.comman.bet.BetInfoVO;
	import com.lightUI.comman.bet.BetSlipParam;
	import com.lightUI.comman.bet.BetSplit;
	
	
	import msg.ENCSType;
	
	public class BullScenceMediator extends Mediator implements IMediator
	{
		public var hallData:HallData;
		public var perLoadService:PreLoadService;		
		public var roomSocketService:RoomSocketService;
		public var roomData:RoomData;
		public var userInfoData:UserInfoData;
		public var appMedel:AppMedel;
		private var num:int;
		private var timer:Timer;
		private var _isSys:Boolean = true;		
		
		public var chipTool:BetSplit = new BetSplit();
		
		public static const NAME:String = "BullScenceMediator";
		public function BullScenceMediator(mediatorName:String="", viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		override public function getInjector():Array {			
			return ["roomData","roomSocketService","perLoadService","userInfoData","appMedel",HallData.NAME];
		}
		
		override public function setViewComponent(viewComponent:Object):void {			
			
			super.setViewComponent(viewComponent);
			trace("BullScenceMediator setViewComponent")
			view.backLobby.on(Event.CLICK, this,onReturnClick);			
			
			//結算字型
			regFont("SettleWin.fnt", "res/gameScene/settleWin.png");
			regFont("Settlelost.fnt", "res/gameScene/settlelost.png");
			
			//冒泡字型
			regFont("bubbleWin.fnt", "res/gameScene/bubbleWin.png");			
			regFont("bubbleLost.fnt", "res/gameScene/bubbleLost.png");
			
			//限紅字型
			regFont("LimitFont.fnt", "res/gameScene/limitFont.png");
						
			//下注字型
			regFont("mybetFont.fnt", "res/gameScene/tableFont.png");
			
			//rank vip字型
			regFont("vipfont.fnt", "res/gameScene/vipfont.png");
			regFont("smallvip.fnt", "res/gameScene/smallvip.png");
			
			view.on(ScenceManagerEvent.UI_SHOW,this, onUIShow);
			view.on(ScenceManagerEvent.UI_HIDE,this, onUIHide);
			//view.on(CarSceneEvent.START_BET, this, onBetHandler);
			
			view.optionBtn.on(Event.CLICK, this, onClick);
			view.setupBtn.on(Event.CLICK, this, onClick);
			view.helpBtn.on(Event.CLICK,this, onClick);			
			view.CarryInBtn.on(Event.CLICK,this, onClick);			
			view.PlayerListBtn.on(Event.CLICK, this, onClick);					
			view.btn_display(false);			
			
			//TEST CMD			
			if ( view["TestPanel"] != undefined)
			{				
				view.TestPanel.on(LightEvent.ITEM_CLICK, this, ontest);
			}
			
			//notify
			addNotifiction(BullNotification.STATE_CHANGE);
			addNotifiction(BullNotification.HISTORY_NOTIFY);
			addNotifiction(BullNotification.USER_NOTIFY);			
			addNotifiction(BullNotification.CARD_NOTIFY);			
			addNotifiction(BullNotification.SETTLE_NOTIFY);
			
			
			//banker
			addNotifiction(BullNotification.BANKER_LIST);
			addNotifiction(BullNotification.NEW_BANKER);
			addNotifiction(BullNotification.BANKER_CALCU);
			
			//bet
			addNotifiction(BullNotification.BET_RSP);		
			addNotifiction(BullNotification.BET_INFO_UPDATE);
			//reaction
			
			
			addNotifiction(BullNotification.CASH_TAKEIN_RESPONES);				
			addNotifiction(BullNotification.VIEW_INIT);				
			
			
			addNotifiction(BullNotification.RoomSocketClose);
			addNotifiction(BullNotification.ExitRoomEvent);
			
			//元件點擊事件
			view.viewArea.on(LightEvent.ITEM_CLICK,this, onBetzoneClick);
			view.ViewBetGroup.on(LightEvent.ITEM_CLICK,this, onBetAction);
			view.viewSelectClip.on(LightEvent.ITEM_CLICK, this, onCoinSelect);
			view.viewResult.on(LightEvent.ITEM_CLICK, this, runEnd_recycle);
			
			//廣播訊息			
			addNotifiction(BullNotification.Change_to_Lobby);
		}
		
		private function onCoinSelect(select:int):void
		{
			roomData.bet_idx = select;
		}
		
		private function onBetAction(name:String):void
		{
			if (name == "same")
			{
				//dispatchEvent(new OperateEvent(NewNewGameEvent.SameBet, []));
								
				
			}
			else if (name =="cancel")
			{
				
				
				//dispatchEvent(new OperateEvent(NewNewGameEvent.CancelMybet, []));
			}
			
		}
		
		private function onBetzoneClick(idx:int):void
		{
			trace("onBetzoneClick = " + idx);
			
			roomData.bet_zone = idx;
			sentNotification(ENCSType.CS_TYPE_BET_REQ.toString());
			
			
			//view.viewArea.tablelimit_updata(800);
			
		}
		
		private function get_coin_info(amount:Number,zone:int,is_my:Boolean):Array
		{
			var bet:Number = amount;
			bet = roomData.Cash_Type == ENMoneyType.MONEY_TYPE_COIN ? bet : bet / 100;			
			var chip:BetInfoVO = chipTool.getChip(bet);
			var chips:Array = [];
			var chipVO:ChipVO;				
			if(!chip){
				//找不倒 一个整的筹码  需要拆分				
				var temp:BetSlipParam = roomData.chipTool.splitBet(bet);
				for (var i:int = 0; i < temp.chips.length; i++) 
				{
					chip = temp.chips[i];
					chipVO = new ChipVO(is_my,zone,chip.value);
					chips.push(chipVO);
				}
					
			}else{
				chipVO = new ChipVO(is_my,zone,chip.value);
				chips.push(chipVO);
			}
			//check number
			//for ( var i:int = 0; i < chips.length; i++)
			//{
				//var item:ChipVO = chips[i];
				//trace("chips type= " + item.type);
				//trace("chips valu= " + item.value);				
			//}
			return chips;
		}
		
		private function add_selfbet(arr_chipsVO:Array):void
		{
			var l:int = arr_chipsVO.length;
			var chipVO:ChipVO;
			var chip:Chip = null;
			for (var i:int = 0; i < l; i++) 
			{
				chipVO = arr_chipsVO[i];
				var betArea:Image = view.viewArea.get_zone(chipVO.type)	;				 
				var betInfo:BetInfoVO = roomData.chipTool.getChip(chipVO.value);
				if(!betInfo){
					var temp:BetSlipParam = roomData.chipTool.splitBet(chipVO.value);
					for (var j:int = 0; j < temp.chips.length; j++) 
					{
						chip = new Chip();
						betInfo = temp.chips[j];
						chipVO = new ChipVO(true,arr_chipsVO[i].type,betInfo.value);
						chip.vo = chipVO;
						pos = BetAreaUtil.getRandomByRectangle(chipVO.type,betArea.getBounds());
						view.flySelfChip(chip,pos);
					}
					
				}else{
					chip = new Chip();
					var pos:Point = BetAreaUtil.getRandomByRectangle(chipVO.type,betArea.getBounds());
					chip.vo = chipVO;
					trace("userBet",chipVO);
					view.flySelfChip(chip,pos);
				}
			}
			
		}
		
		private function add_otherbet(arr_chipsVO:Array):void
		{
			var l:int = arr_chipsVO.length;
			var chipVO:ChipVO;
			var chip:Chip = null;
			for (var i:int = 0; i < l; i++) 
			{
				chipVO = arr_chipsVO[i];
				var betArea:Image = view.viewArea.get_zone(chipVO.type)	;				 
				var betInfo:BetInfoVO = roomData.chipTool.getChip(chipVO.value);
				if(!betInfo){
					var temp:BetSlipParam = roomData.chipTool.splitBet(chipVO.value);
					for (var j:int = 0; j < temp.chips.length; j++) 
					{
						chip = new Chip();
						betInfo = temp.chips[j];
						chipVO = new ChipVO(true,chipsVO[i].type,betInfo.value);
						chip.vo = chipVO;
						pos = BetAreaUtil.getRandomByRectangle(chipVO.type,betArea.getBounds());
						view.flayChipOther(chip,pos);
					}
					
				}else{
					chip = new Chip();
					var pos:Point = BetAreaUtil.getRandomByRectangle(chipVO.type,betArea.getBounds());
					chip.vo = chipVO;
					trace("userBet",chipVO);
					view.flayChipOther(chip,pos);
				}
			}
			
		}
		
		private function sub_otherbet(arr_chipsVO:Array):void
		{
			var l:int = arr_chipsVO.length;
			var chipVO:ChipVO;
			var chip:Chip = null;			
			for (var i:int = 0; i < l; i++) 
			{
				chipVO = arr_chipsVO[i];				
				var betInfo:BetInfoVO = roomData.chipTool.getChip(chipVO.value);
				if(!betInfo){
					var temp:BetSlipParam = roomData.chipTool.splitBet(chipVO.value);					
					for (var j:int = 0; j < temp.chips.length; j++) 
					{
						chip = new Chip();
						betInfo = temp.chips[j];						
						chipVO = new ChipVO(false,arr_chipsVO[i].type,betInfo.value);
						chip.vo = chipVO;						
						view.removeOthersChip(chipVO);
					}
					
				}else {					
					chip = new Chip();					
					chip.vo = chipVO;					
					view.removeOthersChip(chipVO);
				}
			}
			
		}
		
		private function cashViewHandler():void
		{			
			view.viewHead.setMoney(roomData.Total_money); 
			view.viewHead.setMoneyT(Common.isCoin?2:1);					
		}
		
		private function onSettleUpdateHandler():void
		{
			appMedel.Banker_uid = "10";
			appMedel.user_id = "1";
			appMedel.nick_name_64 = "Dyson";
			appMedel.first_threePlayer = [ { "rank":0, "ligt":true, "name":"dyson1", "money":999 }, { "rank":1, "ligt":true, "name":"dyson2", "money":999 }, { "rank":2, "ligt":true, "name":"dyson3", "money":999 } ];
			
			//無人下注,跳過結算面版
			//if( appMedel.Settle_Time <2)
			//{
				//evt.dispatchEvent(new NewNewGameEvent(NewNewGameEvent.RUN_ResultOver));				
			//}
			//else
			{				
			    //本局庄資訊
				
				var isbaner:Boolean = appMedel.Banker_uid === appMedel.user_id;
				if( _isSys ) _bankerName = "吉胜游戏平台";
				view.viewResult.initView(appMedel.nick_name_64,roomData.settle_hand_money,roomData.LeftTime,roomData.settle_win_money,roomData.settle_User_info,isbaner,_bankerName);
				view.viewResult.show();
				
				sentNotification(BullNotification.CASH_TAKEIN_RESPONES);
			}
		}
		
		private function runEnd_recycle():void
		{
			view.viewPoker.recycle();
			view.PokerTypePanel.hide();
		}
		
		private function onBankerSettleUpdateHandler():void
		{
			//appMedel.banker_settle_show = true;			
			view.bankerResultPanel.show(roomData.Banker_calcu_info.banker_calc_info_s,roomData.Banker_calcu_info.total_win_money);
			
			//Pop_banker_settle();
		}
		
		private function onbankerlist_upateHandler():void
		{			
			view.viewBankerPanel.set_bankerlist([["player1","player2","player3","player4","player5","player6","player7","player8","player9","player10"],"[G币达到",3]);
			//view.bnaklis.viewBankerPanel.set_list(appMedel.WaitBankList,appMedel.nick_name_64);
		}
		
		private function onbankerInfoHandler():void
		{
			//view.viewBankerPanel.loadingpic(bankerHandler);
			view.viewBankerPanel.newBanker(["dyson",5,"7894"])
			
		}
		
		override public function onInitialize():void 
		{ 
			trace("===========================init");
			
		}
		
		private function ontest(cmd:int):void 
		{
			trace("cmd");
			sentNotification(BullNotification.TestOrder,cmd);
		}
		
		/**
		 * 点击设置上的按钮 
		 */		
		private function onClick(e:Event):void
		{
			trace("onClick:" + e.target);
		
			switch(e.target)
			{
				case view.helpBtn:
					sentNotification(MusicSetMediator.SHOW_MUSIC_SET_PANEL);
					view.btn_display(!view.btnBg.visible);
				break;					
				case view.setupBtn:
					sentNotification(RuleMediator.SHOW_RULE_PANEL);
					view.btn_display(!view.btnBg.visible);
				break;
				
				case view.CarryInBtn:
					view.btn_display(!view.btnBg.visible);					
				break;
				
				case view.PlayerListBtn:
					view.btn_display(!view.btnBg.visible);
					
					
					view.ViewPlayerList.show();
				break;
				
				case view.optionBtn:
					view.btn_display(!view.btnBg.visible);
					
				break;
			}
		}		
		
        override public function handler(noti:INotification):void
		{
			switch(noti.getName())
			{
				case BullNotification.VIEW_INIT:
					view_init();
				break;
				case BullNotification.STATE_CHANGE:
					state_change();
				break;
				case BullNotification.HISTORY_NOTIFY:
					onHistoryUpdateHandler();
				break;
				
				case BullNotification.USER_NOTIFY:
					onPlayerListUpdateHandler();
				break;
				
				case BullNotification.CARD_NOTIFY:
					onDealDataHandler();
				break;				
				
				case BullNotification.BET_RSP:
					betRepHandler();
				break;	
				
				case BullNotification.BET_INFO_UPDATE:
					bet_otherHandler(noti.getBody() as Array);
				break;	
				
				
				case BullNotification.SETTLE_NOTIFY:
					onSettleUpdateHandler();
				break;
				
				
				case BullNotification.NEW_BANKER:
					onbankerInfoHandler();
				break;								
				case BullNotification.BANKER_CALCU:
					onBankerSettleUpdateHandler();
				break;				
				case BullNotification.BANKER_LIST:
					onbankerlist_upateHandler();
				break;
				
				
				case BullNotification.CASH_TAKEIN_RESPONES:
					cashViewHandler();
				break;
				
				case BullNotification.RoomSocketClose:
					dispose();
					break;
				case BullNotification.ExitRoomEvent:
					exitRoom();
				break;
				case BullNotification.Change_to_Lobby:
					real_exit_room();
				breq;
			}
		}
		
		public function state_change():void 
		{
			switch( roomData.State) 
			{
				case RoomData.START:
					view.start();
				break;
				case RoomData.BANKER:
					view.banker();
				break;
				case RoomData.BET:				
					view.bet();
				break;
				case RoomData.BET_CHECK:
					view.betCheck();
				break;
				case RoomData.DEAL:
					view.deal();
				break;
				case RoomData.END:
					view.end();
				break;
			}
		}
		
		private function view_init():void
		{
			//帶入再滑入
			view.showme();
		}
		
		private function betRepHandler():void
		{
			
			//隨後注區更新包,統一刷總金額,這裡只刷新 自己的金額
			if( roomData.State == RoomData.BET)
			{
				//顥示重新下注
				//game.ViewBetGroup.rebet_popup();
			}
			
		}
		
		public function onHistoryUpdateHandler():void 
		{
			view.viewRecord.histroy_notify(roomData.history_Win_info, roomData.history_lost_info, roomData.history_result_info);			
		}
		
		private function onPlayerListUpdateHandler():void
		{
			view.ViewPlayerList.update_data(roomData.playerList);
		}
		
		private function onDealDataHandler():void
		{
			if( roomData.State == AppMedel.DEAL)
			{
				view.viewPoker.set_data(roomData.card_info,view.PokerTypePanel,view.ViewWinLostEffect);
				view.viewPoker.play();
			}
			else
			{
				trace("deal poker in ");
			}
			
			//提示
			//var total:Number =0;
			//自己為庄家
			//if( appMedel.Banker_uid === appMedel.user_id)
			//{
				//var allbet:Array = appMedel.dataStartStatus.allBetClips;
				//for(var k:int =0;k<  allbet.length;k++)
				//{											
					//total += Number(appMedel.dataStartStatus.allBetClips[k]);					
				//}				
				//
				//if( total ==0) 	phase_tip("本局无人下注。",0);
				//else  phase_tip("总下注 " +GameUtil.formatMoney(total) +"，祝吉星高照！",0);
				//
			//}
			//else
			//{
				//沒下注
				//var mybet:Array = appMedel.dataStartStatus.myBetClips;
				//for(var i:int =0;i<  mybet.length;i++)
				//{						
					//total += Number(appMedel.dataStartStatus.myBetClips[i] );
				//}				
				//沒下注
				//if( total ==0) 	phase_tip("您没有参与本局下注",0);
				//else  phase_tip("总下注 " +GameUtil.formatMoney(total)  +"，祝吉星高照！",0);
			//}			
			//
			//LightAssetManager.getInstance().playSound(SoundNameManager.getInstance().dealpoker, 0,1);
		}
		
		
		public function bet_otherHandler(data:Array):void		
		{
			var myuid = data[0];
			var divid_100:Boolean = data[1];
			var bet_info:Array = data[2];
			var betinfo:SBetNotify_Bet;
			
			for (var i:int = 0; i < bet_info.length; i++)
			{
				betinfo = bet_info[i];
				var self:Boolean = betinfo.uid == myuid;
				var bet:Number = divid_100 == true? betinfo.value / 100 : betinfo.value;
				var po:int = betinfo.position - 1;		
				if (self)
				{
					//減注
					if ( bet < 0)
					{
						view.flySelfChipBack();
						roomData.Zone_self_bet[0] = 0;
						roomData.Zone_self_bet[1] = 0;
						roomData.Zone_self_bet[2] = 0;
						roomData.Zone_self_bet[3] = 0;
					}
					else
					{
						//下注
						var chips:Array = [];
						chips = get_coin_info(bet, po, self);
						add_selfbet(chips);
						roomData.Zone_self_bet[po] += bet;
					}					
				}
				else
				{
					//他人下注					
					if ( bet < 0)
					{
						//減注
						var chips:Array = [];
						chips = get_coin_info(bet, po, false);
						sub_otherbet(chips);
					}
					else
					{
						//下注
						var chips:Array = [];
						chips = get_coin_info(bet, po, false);
						add_otherbet(chips);
					}
				}
				
				
			}
			
			//總注區更新
			for (var i:int = 0; i < 4; i++)
			{
				trace("=====================roomData.Zone_self_bet[i]" +roomData.Zone_self_bet[i]);
				view.viewArea.update_total(i, roomData.Zone_Total_bet[i]);
				view.viewArea.update_self(i, roomData.Zone_self_bet[i]);
			}			
				
			trace("=====================bet notity over");
			
			//view.viewArea.zone_light(3);
			
			//num,idx
			//自己下注  //折分coin
			//var chips:Array = [];
			//chips = get_coin_info(3500, idx, true);
			//add_selfbet(chips);
			
			//自己取消 
			//view.flySelfChipBack();
			
			//他人下注 num,idx
			//var chips:Array = [];
			//chips = get_coin_info(5000, 0, false);
			//add_otherbet(chips);
			
			//他人取消 num,idx
			//var chips:Array = [];
			//chips = get_coin_info(1000, 0, false);
			//sub_otherbet(chips);	
			
			
			return;
			
			var data:Array = e.info;
			var position:int = data[0];
			var value:int = data[1];
			var zone_total:Number = data[2];
			var isMybet:Boolean = data[3];
			var IsSub:Boolean = data[4];
			var my_total:Number = data[5];
			var bet_info:SBetNotify_Bet = data[6];
			
			if ( isMybet)
			{
				if (IsSub) 
				{
					//cnacelOkHandler 處理
					game.viewArea.update_total(position,0);
					
					//每個注區金額更新
					game.viewArea.update_other_total(appMedel.dataStartStatus.allBetClips);
					
				}
				else if( appMedel.IsBetMax )
				{
					game.viewArea.my_batch_bet(value,position,my_total,zone_total);
				}
				else if( appMedel.IsRepeat )
				{
					//4包變一包					
					var bet:SBetNotify_Bet;
					for(var k:int =0;k< appMedel.sameBetinfo.length;k++)
					{
						bet = appMedel.sameBetinfo[k];
						var zone:Number =  appMedel.dataStartStatus.allBetClips[bet.position-1];
						var my:Number = appMedel.dataStartStatus.myBetClips[bet.position-1];
						
						var singlebet:Number = 0;
						if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
						{
							singlebet = bet.value /100; 
						}
						else singlebet  = bet.value ;
						
						game.viewArea.my_batch_bet(singlebet,bet.position -1,my,zone);
					}									
				}
				else
				{					
					//var chipVo:ChipVo = appMedel.chipVo;
					//game.viewArea.betcoin(chipVo,my_total ,zone_total);
					
					//有可能是下50,最大只能下30,變批量下
					game.viewArea.my_batch_bet(value,position,my_total,zone_total);
					
					
				}
			}
			else
			{
				//是 取消下注嗎				
				if (IsSub)
				{					
					value = -value;
					game.viewArea.other_bet_cancel(value,position,zone_total);
					
					//每個注區金額更新
					game.viewArea.update_other_total(appMedel.dataStartStatus.allBetClips);
				}			
				else
				{					
					//中途進入 ,沒有SBetNotify_Bet bet = null
					if( bet_info ==null)
					{
						//桌面COIN清理
						game.viewArea.clear_allChip();		
						
						for(var i:int =0;i< 4;i++)
						{
							var zonet:Number =  appMedel.dataStartStatus.allBetClips[i];
							var singlebet:Number = 0;
							if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
							{
								singlebet = zonet /100; 
							}
							else singlebet  = zonet ;
							
							game.viewArea.other_bet(i,singlebet ,zonet,isMybet);
							
							//TODO 更新自己的
							var my_half:Number = appMedel.dataStartStatus.myBetClips[i];							
							var mytotal:Number = 0;
							if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
							{
								mytotal = my_half /100; 
							}
							else mytotal  = my_half ;
							
							game.viewArea.half_in_update_self_bet_hint(mytotal,i);
						}
					}
					else
					{
						var betb:SBetNotify_Bet;
						for(var i:int =0;i< appMedel.sameBetinfo.length;i++)
						{
							betb = appMedel.sameBetinfo[i];
							var zonet:Number =  appMedel.dataStartStatus.allBetClips[betb.position-1];
							
							var singlebet:Number = 0;
							if( appMedel.roomParam.roomType != conf.ENRoomType.ROOM_TYPE_COIN )
							{
								singlebet = betb.value /100; 
							}
							else singlebet  = betb.value ;
							
							game.viewArea.other_bet(betb.position-1,singlebet ,zonet,isMybet);
						}				
					}
					//game.viewArea.other_bet(position,value,zone_total,isMybet);
				}
			}
			
			//前三名名單更新
			game.viewArea.set_zoneList(appMedel.TabPlayerList);
			
			//限額更新
			game.viewArea.update_limit(appMedel.roomParam.roomlimit,roomlimit);
			
			//明燈更新
			game.viewArea.update_lamp(appMedel.where_is_lamp);
			LightAssetManager.getInstance().playSound(SoundNameManager.getInstance().Coin, 0,1);
		}
		
		private function regFont(fontFileName:String,path:String):void
		{
			//結算字型
			var newFont:BitmapFont = new BitmapFont();
			var fnt:XmlDom = Light.loader.getRes(fontFileName);
			var fntTxt:Texture = Light.loader.getRes(path);
			newFont.parseFont(fnt, fntTxt);
			
			var pat:RegExp = /.fnt/;
			fontFileName = fontFileName.replace(pat,"");
			
			Text.registerBitmapFont(fontFileName, newFont);			
		}
		
		private function getPlayerInfoCallback(param:Object):void
		{
			trace("getPlayerInfoCallback!!!!!!!!!!!!!!!!!!");
			trace(param);
		}
		
		public function sendHeartBeat():void{
			startHeartCount();
			sendMsg();
		}
		
		private function sendMsg():void{
			if(num > 2){
				//提示断线了 正在为您重连，请稍等……
				clearTimer();
				roomSocketService.reconnect();
				return;
			}
			num++;
			sentNotification(BullNotification.ROOM_HEART_BEAT);
		}
		
		private function startHeartCount():void{
			if(!timer) {
				timer = new Timer();
				timer.loop(5000,this, sendMsg);
			}
		}
		private function clearTimer():void{
			if(!timer) return;
			timer.clear(this, sendMsg);
			timer = null;
			num = 0;
		}
		
		public function receiveHeartBeat():void
		{
			// TODO Auto Generated method stub
			num = 0;
		}
		
		private function onCarryInClick():void
		{
			sentNotification(BullNotification.GET_USER_BALANCE);
		}
		
		private function onUIShow():void {
			
			//view.viewSelectClip.set_data([100,500,1000,5000,10000,"max"]);
			
			//先别影藏 等数据请求回来再显示
			view.roomData = roomData;
			//view.userInfoData = userInfoData;
			roomData.initClipConfig();
			view.initSelectClip(hallData.join_room_idx);
			
			this.onCoinSelect(0);
			//roomData.bet_idx = 0;
			if ( hallData.join_room_idx <= 2)
			{
				roomData.Cash_Type = ENMoneyType.MONEY_TYPE_COIN;
			}
			else roomData.Cash_Type = ENMoneyType.MONEY_TYPE_CASH;
			
			
			
		}
		
		private function onUIHide():void{
			//视图被移除的时候  做一些清理工作 
			view.hideme();
		}
		
		private function onReturnClick():void{
			trace("onReturnClick exit room");
			var banker:Boolean = false;
			var self_totalbet:Number = 0;
			if (banker)
			{
				Alert.show(Light.language.getSrting("alert_msg10"),"",AlertCancelPanel, null, Handler.create(this, exitRoomCall));
			}
			else
			{
				//沒下注直接離開
				if( self_totalbet==0)exitRoom();				
				else
				{
					if ( roomData.State == RoomData.DEAL)
					{
						Alert.show(Light.language.getSrting("alert_msg10"),"",AlertCancelPanel, null, Handler.create(this, exitRoomCall));
					}
					if ( roomData.State == RoomData.BET)
					{
						Alert.show(Light.language.getSrting("alert_msg10"),"",AlertCancelPanel, null, Handler.create(this, exitRoomCall));
					}
				}
				
			}
			
				
		}
		
		private function exitRoomCall(data:int,flg:String):void{
			if(flg == "ok_btn"){
				exitRoom();
			}
		}
		
		public function exitRoom():void {
				
			
			sentNotification(BullNotification.Leave_Game);
			
		}
		
		public function real_exit_room()
		{
			perLoadService.loadHall();
			dispose();
		}
		
		private function dispose():void{
			//roomData.clear();
			//roomSocketService.close();
			//clearTimer();
			view.clear();
		}
		
		
		public function get view():BullScene
		{
			return getViewComponent() as BullScene;
		}

	}
}