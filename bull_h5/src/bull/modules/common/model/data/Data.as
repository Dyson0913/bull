package bull.modules.common.model.data
{
	import com.IProtobuf.Long;
	import laya.events.EventDispatcher;
	
	public class Data extends EventDispatcher
	{
		public static const NAME:String = "Data";
		
		public var states:int = 0;////////////////EGameStateType 标记是在大厅还是在房间
		
		public var hallData:HallData;
		public var roomData:RoomData;
		public var userInfoData:UserInfoData;
		public var appMedel:AppMedel;
		//public var carConfigData:CarConfigData;
		
		public var uid:Number;
		public var token:Long;
		
		public var truthLogin:Boolean;
		public var hallHeartBeat:Boolean;
		public var roomHeartBeat:Boolean;
		
		public var injector:Array = ["hallData","roomData","userInfoData",AppMedel.NAME];
		
		
		
		public function Data()
		{
			super();
		}
	}
}