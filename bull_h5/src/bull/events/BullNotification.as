package bull.events
{
	public class BullNotification
	{
		public static const STARTUP:String  = "startup";
		public static const LOGIN:String  = "login";
		
		public static const PROTO_CREAT:String = "protoCreat";
		
		public static const CREAT_LOADING_PANEL:String = "creatLoadingPanel";
		public static const CREAT_LOADING_PANEL_OVER:String = "creatLoadingPanelOver";
		
		public static const SHOW_TIPLOADINGPANEL:String = "showTipLoadingPanel";
		
		public static const CREAT_HALL:String = "creatHall";
		public static const CREAT_HALL_OVER:String = "creatHallOver";
		
		
		public static const HALL_SOCKET_CONNECT:String = "hallSocketConnect";/////////////连接大厅服务器
		public static const HALL_SOCKET_CONNECT_COMPLETE:String = "hallSocketConnectComplete";//////////////连接大厅成功
		public static const HALL_SOCKET_CONNECT_FAILED:String = "hallSocketConnectFailed";//////////////////连接大厅失败
		
		public static const ROOM_SOCKET_CONNECT:String = "roomSocketConnect";/////////////连接房间服务器
		public static const ROOM_SOCKET_CONNECT_COMPLETE:String = "roomSocketConnectComplete";//////////////房间大厅成功
		public static const ROOM_SOCKET_CONNECT_FAILED:String = "roomSocketConnectFailed";//////////////////房间大厅失败
		
		public static const LOGIN_ROOM_RQS:String = "loginRoomRequest";//////////////////登录房间请求
		public static const LOGIN_HALL_RQS:String = "loginHallRequest";//////////////////登录大厅请求
		
		
		
		public static const SOCKET_CONNECT:String = "socketConnect";////////////////通知连接服务器 
		public static const ONLOGIN:String = "onLogin";/////////////////////////////登录成功   发送房间列表
		public static const START_ROOM_LIST:String = "startRoomList";///////////////开始请求房间列表
		public static const SCENCE_CHANGE:String = "scenceChange";//////////////////切换了场景
		
		public static const JOIN_ROOM_RQS:String = "joinRoomRqs";///////////////////请求加入房间
		public static const JOIN_ROOM_RSP:String = "joinRoomRsp";
		public static const ENTER_ROOM:String = "enterRoom";//////////////////////////加入房间   打开房间窗体
		public static const LOAD_DATA_MESSAGE:String= "loadDataMessage";//////////////////////////加载进度事件
		public static const SHOW_CARRY_IN_PANEL:String ="showCarryInPanel";//////////////////////////显示带入面板事件
		public static const SHOW_ALERT_PANEL:String ="showAlertPanel";//////////////////////////显示提示面板事件
		public static const GET_USER_BALANCE:String ="getUserBalance";//////////////////////////获取用户余额信息
		public static const ROUND_COMMIT_RSP:String="roundCommitRsp";/////////////////////////确认局下注返回消息
		public static const ROUND_SETTLEMENT_RSP:String="roundSettlementRsp";
		public static const Change_Scene:String = "car.Change_Scene"; //切换场景，主要是用于大厅和游戏场景切换
		
		public static const Scene_Hall:String = "Scene_Hall"; 	//大厅场景
		public static const Scene_Game:String = "Scene_Game";	//游戏场景
	}
}