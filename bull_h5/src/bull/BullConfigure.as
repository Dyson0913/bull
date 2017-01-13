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
	import bull.modules.common.command.HallHeartBeatCommand
	import bull.modules.common.command.RoomHeartBeatCommand;	
	import bull.modules.common.command.LoginHallCommand;
	import bull.modules.common.command.RoomListCommand;
	import bull.modules.common.command.TestCommand;
	
	//import light.car.modules.common.command.BetCancelCommand;
	//import light.car.modules.common.command.BetCommand;
	//import light.car.modules.common.command.BetSameAsLastTimeCommand;
	//import light.car.modules.common.command.CommitRoundCommand;
	
	import bull.modules.common.command.ConnectRoomCommand;	
	import bull.modules.common.command.TryJoinRoomCommand;
	import bull.modules.common.command.JoinRoomCommand;
	import bull.modules.common.command.LoginRoomCommand;	
	//import light.car.modules.common.command.RoomConfigCommand;
	
	//import light.car.modules.common.command.SettlementRoundCommand;
	//import light.car.modules.common.command.StartBetCommand;
	//import light.car.modules.common.command.TableInfoCommand;
	
	import bull.modules.room.command.StateCommand;
	import bull.modules.room.command.HistoryCommand;
	import bull.modules.room.command.UserNotifyCommand;
	import bull.modules.room.command.DealCardNotifyCommand;
	import bull.modules.room.command.SettleNotifyCommand;
	import bull.modules.room.command.BankerNotifyCommand;
	import bull.modules.room.command.BetNotifyCommand;
	
	import bull.modules.common.mediator.AlertMediator;
	import bull.modules.common.mediator.AssetInMediator;	
	import bull.modules.common.mediator.MusicSetMediator;
	import bull.modules.common.mediator.RuleMediator;
		
	
	import bull.modules.common.model.data.Data;
	import bull.modules.common.model.data.HallData;
	import bull.modules.common.model.data.RoomData;
	import bull.modules.common.model.data.UserInfoData;
	import bull.modules.common.model.data.AppMedel;
	import bull.modules.common.services.WebService;
	import bull.modules.BullHall.command.UserBalanceCommand;
	import bull.modules.BullHall.mediator.HallMediator;
	import bull.modules.BullHall.service.HallSocketService;
	
	import bull.modules.room.command.CarryInCommand;
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
			
			//大廳心跳
			registerCommand(BullNotification.HALL_HEART_BEAT.toString(),  HallHeartBeatCommand);
			registerCommand(ENCSType.CS_TYPE_HEART_BEAT_RSP.toString(),  HallHeartBeatCommand);
			
			registerCommand(BullNotification.Leave_Game, LoginHallCommand);
			registerCommand(ENCSType.CS_TYPE_EXIT_TABLE_RSP.toString(), LoginHallCommand);
			
			//要求桌列表
			registerCommand(ENCSType.CS_TYPE_GET_ROOM_LIST_REQ.toString(), RoomListCommand);
			registerCommand(ENCSType.CS_TYPE_GET_ROOM_LIST_RSP.toString(), RoomListCommand);
			
			//請求加入房間
			registerCommand(ENCSType.CS_TYPE_TRY_ENTER_TABLE_REQ.toString(), TryJoinRoomCommand);
			registerCommand(ENCSType.CS_TYPE_TRY_ENTER_TABLE_RSP.toString(), TryJoinRoomCommand);
			
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
			
			//遊戲心跳			
			registerCommand(BullNotification.ROOM_HEART_BEAT.toString(),  RoomHeartBeatCommand);
			registerCommand(ENCSType.CS_TYPE_HEART_BEAT_RSP.toString(),  RoomHeartBeatCommand);
			
			//加入房間
			registerCommand(ENCSType.CS_TYPE_ENTER_TABLE_REQ.toString(), JoinRoomCommand);
			registerCommand(ENCSType.CS_TYPE_ENTER_TABLE_RSP.toString(), JoinRoomCommand);
			
			
			//帶入
			registerCommand(ENCSType.CS_TYPE_CARRY_IN_REQ.toString(),CarryInCommand);
			registerCommand(ENCSType.CS_TYPE_CARRY_IN_RSP.toString(),CarryInCommand);
			
			//notify
			registerCommand(ENCSType.CS_TYPE_TIMER_NOTIFY.toString(), StateCommand);
			//registerCommand(ENCSType.CS_TYPE_GET_HISTORY_NOTIFY.toString(), HistoryCommand);
			//registerCommand(ENCSType.CS_TYPE_ALL_USER_INFO_NOTIFY.toString(), UserNotifyCommand);
			//registerCommand(ENCSType.CS_TYPE_ONE_USER_INFO_NOTIFY.toString(), UserNotifyCommand);
			registerCommand(ENCSType.CS_TYPE_BET_NOTIFY.toString(), BetNotifyCommand);
			registerCommand(ENCSType.CS_TYPE_DEAL_CARD_NOTIFY.toString(),DealCardNotifyCommand);
			registerCommand(ENCSType.CS_TYPE_CALCULATE_NOTIFY.toString(),SettleNotifyCommand);
			
			
			//上庄
			//registerCommand(ENCSType.CS_TYPE_BANKER_LIST_NOTIFY.toString(),BankerNotifyCommand);
			registerCommand(ENCSType.CS_TYPE_BANKER_NOTIFY.toString(),BankerNotifyCommand);
			//registerCommand(ENCSType.CS_TYPE_BANKER_CALCULATE_NOTIFY.toString(),BankerNotifyCommand);
			registerCommand(ENCSType.CS_TYPE_BANKER_REQ.toString(),BankerNotifyCommand);
			registerCommand(ENCSType.CS_TYPE_BANKER_RSP.toString(),BankerNotifyCommand);
			
			//下注
			registerCommand(ENCSType.CS_TYPE_BET_REQ.toString(),BetNotifyCommand);
			registerCommand(ENCSType.CS_TYPE_BET_RSP.toString(),BetNotifyCommand);
			registerCommand(BullNotification.BET_SAME, BetNotifyCommand);
			registerCommand(BullNotification.BET_CANCEL, BetNotifyCommand);
			
			registerCommand(BullNotification.TestOrder, TestCommand);
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
			asSingleton(RoomData.NAME,RoomData);
			asSingleton(UserInfoData.NAME,UserInfoData);
			asSingleton(ConfigData.NAME, ConfigData);
			asSingleton(AppMedel.NAME,AppMedel);
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