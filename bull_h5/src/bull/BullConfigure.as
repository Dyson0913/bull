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
	
	//import light.car.modules.common.command.BetCancelCommand;
	//import light.car.modules.common.command.BetCommand;
	//import light.car.modules.common.command.BetSameAsLastTimeCommand;
	//import light.car.modules.common.command.CommitRoundCommand;
	
	//import light.car.modules.common.command.ConnectRoomCommand;
	//import light.car.modules.common.command.GetPlayerStateCommand;
	//import light.car.modules.common.command.HeartBeatCommand;
	//import light.car.modules.common.command.JoinRoomCommand;
	//import light.car.modules.common.command.LoginHallCommand;
	//import light.car.modules.common.command.LoginRoomCommand;
	//import light.car.modules.common.command.RoomConfigCommand;
	//import light.car.modules.common.command.RoomListCommand;
	//import light.car.modules.common.command.SettlementRoundCommand;
	//import light.car.modules.common.command.StartBetCommand;
	//import light.car.modules.common.command.TableInfoCommand;
	//import light.car.modules.common.mediator.AlertMediator;
	//import light.car.modules.common.mediator.AssetInMediator;
	//import light.car.modules.common.mediator.MusicSetMediator;
	//import light.car.modules.common.mediator.RuleMediator;
		
	
	//import light.car.modules.common.model.data.CarData;
	//import light.car.modules.common.model.data.HallData;
	//import light.car.modules.common.model.data.RoomData;
	//import light.car.modules.common.model.data.UserInfoData;
	//import light.car.modules.common.services.WebService;
	//import light.car.modules.hall.command.UserBalanceCommand;
	//import light.car.modules.hall.mediator.HallMediator;
	import bull.modules.BullHall.service.HallSocketService;
	
	//import light.car.modules.room.command.CarryInCommand;
	//import light.car.modules.room.command.EnterRoomCommand;
	//import light.car.modules.room.mediator.CarScenceMediator;
	//import light.car.modules.room.services.RoomSocketService;
	//import light.car.view.alert.AlertPanel;
	//import light.car.view.alert.MusicSetPanel;
	//import light.car.view.alert.RulePanel;
	//import light.car.view.hall.Hall;
	//import light.car.view.room.CarScene;
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
			//registerCommand( CarNotification.STARTUP, StartupCommand );	
			
			registerCommand(BullNotification.HALL_SOCKET_CONNECT, ConnectHallCommand);
			registerCommand(BullNotification.HALL_SOCKET_CONNECT_COMPLETE, ConnectHallCommand);
			registerCommand(BullNotification.HALL_SOCKET_CONNECT_FAILED, ConnectHallCommand);
			//
			//registerCommand(CarNotification.ROOM_SOCKET_CONNECT, ConnectRoomCommand);
			//registerCommand(CarNotification.ROOM_SOCKET_CONNECT_COMPLETE, ConnectRoomCommand);
			//registerCommand(CarNotification.ROOM_SOCKET_CONNECT_FAILED, ConnectRoomCommand);
			//
			//registerCommand(CarNotification.LOGIN_HALL_RQS, LoginHallCommand);
			//registerCommand(ENCSType.CS_TYPE_LOGIN_RSP.toString(), LoginHallCommand);
			//registerCommand(CarNotification.LOGIN_ROOM_RQS, LoginRoomCommand);
			//registerCommand(ENCSType.CS_TYPE_LOGIN_RSP.toString(), LoginRoomCommand);
			//
			//registerCommand(ENCSType.CS_TYPE_GET_PLAYER_ENTER_STATE_REQ.toString(), GetPlayerStateCommand);
			//registerCommand(ENCSType.CS_TYPE_GET_PLAYER_ENTER_STATE_RSP.toString(), GetPlayerStateCommand);
			//
			//registerCommand(ENCSType.CS_TYPE_ENTER_TABLE_REQ.toString(), JoinRoomCommand);
			//registerCommand(ENCSType.CS_TYPE_ENTER_TABLE_RSP.toString(), JoinRoomCommand);
			//registerCommand(CarNotification.ENTER_ROOM, EnterRoomCommand);
			//
			//registerCommand(CarNotification.GET_USER_BALANCE, UserBalanceCommand);
			
//			registerCommand(MessageID.ROOM_CONFIG_NOTIFY.toString(), RoomConfigCommand);
			
			//registerCommand(ENCSType.CS_TYPE_GET_TABLE_LIST_REQ.toString(), RoomListCommand);
			//registerCommand(ENCSType.CS_TYPE_GET_TABLE_LIST_RSP.toString(), RoomListCommand);
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
			//registerModel(new RoomSocketService(RoomSocketService.NAME));
			
			//registerModel(new WebService(WebService.NAME));
			//registerModel(new CarModel(CarModel.NAME,new CarData()));
			
			
			
			//asSingleton(CarData.NAME,CarData)
			//asSingleton(HallData.NAME,HallData);
			//asSingleton(RoomData.NAME,RoomData);
			//asSingleton(UserInfoData.NAME,UserInfoData);
			asSingleton(ConfigData.NAME,ConfigData);
		}
		
		private function initMediator():void{
			registerMediator(new SmallLoadingMediator(SmallLoadingMediator.NAME,SmallLoading));
			registerMediator(new TipsLoadMediator(TipsLoadMediator.NAME), TipsLoadPanel);
			//registerMediator(new HallMediator(HallMediator.NAME),Hall);
			//registerMediator(new CarScenceMediator(CarScenceMediator.NAME),CarScene);
			//registerMediator(new AssetInMediator(AssetInMediator.NAME),AssetsInPanel);
			//registerMediator(new AlertMediator(AlertMediator.NAME),AlertPanel);
			//registerMediator(new MusicSetMediator(MusicSetMediator.NAME),MusicSetPanel);
			//registerMediator(new RuleMediator(RuleMediator.NAME),RulePanel);
		}
	}
}