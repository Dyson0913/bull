package bull
{
	import com.lightMVC.parrerns.Configure;
	import com.lightUI.KGameComponents.assetsInPanel.AssetsInPanel;	
	
	import bull.events.BullNotification;
	import bull.modules.common.mediator.SmallLoadingMediator;	
	import bull.modules.common.model.data.ConfigData;
	
	import bull.modules.perload.mediator.TipsLoadMediator;
	import bull.modules.perload.services.PreLoadService;
	
	import bull.modules.common.command.ConnectHallCommand;
	
	import bull.modules.common.command.LoginHallCommand;
	import bull.modules.common.command.RoomListCommand;
	
	//import light.car.modules.common.command.BetCancelCommand;
	//import light.car.modules.common.command.BetCommand;
	//import light.car.modules.common.command.BetSameAsLastTimeCommand;
	//import light.car.modules.common.command.CommitRoundCommand;
	
	import bull.modules.common.command.ConnectRoomCommand;	
	//import light.car.modules.common.command.HeartBeatCommand;
	import bull.modules.common.command.JoinRoomCommand;
	import bull.modules.common.command.LoginRoomCommand;	
	//import light.car.modules.common.command.RoomConfigCommand;
	
	//import light.car.modules.common.command.SettlementRoundCommand;
	//import light.car.modules.common.command.StartBetCommand;
	//import light.car.modules.common.command.TableInfoCommand;
	
	import bull.modules.common.mediator.AlertMediator;
	import bull.modules.common.mediator.AssetInMediator;	
	import bull.modules.common.mediator.MusicSetMediator;
	import bull.modules.common.mediator.RuleMediator;
		
	
	import bull.modules.common.model.data.Data;
	import bull.modules.common.model.data.HallData;
	//import bull.modules.common.model.data.RoomData;
	import bull.modules.common.model.data.UserInfoData;
	import bull.modules.common.services.WebService;
	import bull.modules.BullHall.command.UserBalanceCommand;
	import bull.modules.BullHall.mediator.HallMediator;
	import bull.modules.BullHall.service.HallSocketService;
	
	//import light.car.modules.room.command.CarryInCommand;
	import bull.modules.room.command.EnterRoomCommand;
	import bull.modules.room.mediator.BullScenceMediator;
	import bull.modules.room.services.RoomSocketService;
	import bull.view.alert.AlertPanel;
	import bull.view.alert.MusicSetPanel;
	import bull.view.alert.RulePanel;
	import bull.view.hall.Hall;
	import bull.view.room.BullScene;
	import bull.view.smallLoading.SmallLoading;
	import bull.view.tipsLoad.TipsLoadPanel;
	import bull.modules.common.model.BullProtoModel;
	
	import msg.ENCSType;
	
	public class BullConfigure extends Configure
	{
		public function BullConfigure()
		{
			super();
		}
		
		override public function configure():void{
			initCommand();
			initModel();
			initMediator();
		}
		
		private function initCommand():void{
			
			//大廳連接
			registerCommand(BullNotification.HALL_SOCKET_CONNECT, ConnectHallCommand);
			registerCommand(BullNotification.HALL_SOCKET_CONNECT_COMPLETE, ConnectHallCommand);
			registerCommand(BullNotification.HALL_SOCKET_CONNECT_FAILED, ConnectHallCommand);
			
			//大廳登入
			registerCommand(BullNotification.LOGIN_HALL_RQS, LoginHallCommand);
			registerCommand(ENCSType.CS_TYPE_LOGIN_RSP.toString(), LoginHallCommand);
			registerCommand(BullNotification.Leave_Game, LoginHallCommand);
			
			//要求桌列表
			registerCommand(ENCSType.CS_TYPE_GET_ROOM_LIST_REQ.toString(), RoomListCommand);
			registerCommand(ENCSType.CS_TYPE_GET_ROOM_LIST_RSP.toString(), RoomListCommand);
			
			//請求加入房間
			registerCommand(ENCSType.CS_TYPE_TRY_ENTER_TABLE_REQ.toString(), JoinRoomCommand);
			registerCommand(ENCSType.CS_TYPE_TRY_ENTER_TABLE_RSP.toString(), JoinRoomCommand);
			
			//向平台檢查金額
			registerCommand(BullNotification.GET_USER_BALANCE, UserBalanceCommand);
			
			//進入遊戲
			registerCommand(BullNotification.ENTER_ROOM, EnterRoomCommand);
			
			//連接遊戲SERVER
			registerCommand(BullNotification.ROOM_SOCKET_CONNECT, ConnectRoomCommand);
			registerCommand(BullNotification.ROOM_SOCKET_CONNECT_COMPLETE, ConnectRoomCommand);
			registerCommand(BullNotification.ROOM_SOCKET_CONNECT_FAILED, ConnectRoomCommand);		
			
			//遊戲登入
			registerCommand(BullNotification.LOGIN_ROOM_RQS, LoginRoomCommand);
			registerCommand(ENCSType.CS_TYPE_LOGIN_RSP.toString(), LoginRoomCommand);
			//			
			//
			
			
			//
			
			
//			registerCommand(MessageID.ROOM_CONFIG_NOTIFY.toString(), RoomConfigCommand);
			
			
			//
			//registerCommand(ENCSType.CS_TYPE_HEART_BEAT_REQ.toString(),  HeartBeatCommand);
			//registerCommand(ENCSType.CS_TYPE_HEART_BEAT_RSP.toString(),  HeartBeatCommand);
//			registerCommand(MessageID.ROOM_STAUS_TOTIFY.toString(), RoomStatusCommand);
//			registerCommand(MessageID.ROOM_STAUS_REQUEST.toString(), RoomStatusCommand);
//			registerCommand(MessageID.ROOM_STAUS_RESPONSE.toString(), RoomStatusCommand);
			
			//registerCommand(ENCSType.CS_TYPE_PLAYER_BET_REQ.toString(),BetCommand);
			//registerCommand(ENCSType.CS_TYPE_PLAYER_BET_RSP.toString(),BetCommand);
			//registerCommand(ENCSType.CS_TYPE_ROUND_SUM_BETS_NOTIFY.toString(),BetCommand);
			//registerCommand(ENCSType.CS_TYPE_PLAYER_SAVED_BET_REQ.toString(),BetSameAsLastTimeCommand);
			//registerCommand(ENCSType.CS_TYPE_PLAYER_SAVED_BET_RSP.toString(),BetSameAsLastTimeCommand);
			//
			//registerCommand(ENCSType.CS_TYPE_CARRY_IN_REQ.toString(),CarryInCommand);
			//registerCommand(ENCSType.CS_TYPE_CARRY_IN_RSP.toString(),CarryInCommand);
			
//			registerCommand(ENCSType.CS_TYPE_TABLE_INFO_NOTIFY.toString(), TableInfoCommand);
//			registerCommand(ENCSType.CS_TYPE_ROUND_SUM_BETS_NOTIFY.toString(), 
			
			//registerCommand(ENCSType.CS_TYPE_PLAYER_CANCEL_BET_REQ.toString(), BetCancelCommand);
			//registerCommand(ENCSType.CS_TYPE_PLAYER_CANCEL_BET_RSP.toString(),BetCancelCommand);
			
//			registerCommand(MessageID.USERINFO_REQUEST.toString(),UserInfoCommand);
//			registerCommand(MessageID.USERINFO_RESPONSE.toString(), UserInfoCommand);
			
			//registerCommand(ENCSType.CS_TYPE_TABLE_INFO_NOTIFY.toString(), TableInfoCommand);		//通知游戏桌信息
			//registerCommand(ENCSType.CS_TYPE_ROUND_START_NOTIFY.toString(),StartBetCommand);			//开始下注
			//registerCommand(ENCSType.CS_TYPE_ROUND_COMMIT_NOTIFY.toString(),CommitRoundCommand);		//确认下注
			//registerCommand(ENCSType.CS_TYPE_ROUND_CASH_NOTIFY.toString(),SettlementRoundCommand);			//开始结算
		}
		
		private function initModel():void{
			registerModel(new PreLoadService(PreLoadService.NAME));
			registerModel(new BullProtoModel(BullProtoModel.NAME));
			registerModel(new HallSocketService(HallSocketService.NAME));
			registerModel(new RoomSocketService(RoomSocketService.NAME));
			
			registerModel(new WebService(WebService.NAME));
			//registerModel(new CarModel(CarModel.NAME,new CarData()));
			
			
			
			asSingleton(Data.NAME,Data)
			asSingleton(HallData.NAME,HallData);
			//asSingleton(RoomData.NAME,RoomData);
			asSingleton(UserInfoData.NAME,UserInfoData);
			asSingleton(ConfigData.NAME,ConfigData);
		}
		
		private function initMediator():void{
			registerMediator(new SmallLoadingMediator(SmallLoadingMediator.NAME,SmallLoading));
			registerMediator(new TipsLoadMediator(TipsLoadMediator.NAME), TipsLoadPanel);
			registerMediator(new HallMediator(HallMediator.NAME),Hall);
			registerMediator(new BullScenceMediator(BullScenceMediator.NAME), BullScene);
			registerMediator(new AlertMediator(AlertMediator.NAME),AlertPanel);
			registerMediator(new AssetInMediator(AssetInMediator.NAME),AssetsInPanel);
			
			
			registerMediator(new MusicSetMediator(MusicSetMediator.NAME),MusicSetPanel);
			registerMediator(new RuleMediator(RuleMediator.NAME),RulePanel);
		}
	}
}