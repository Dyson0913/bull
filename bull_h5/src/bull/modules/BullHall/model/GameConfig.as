package BullHall.model
{
	
	
	import BullHall.common.Common;
	
	import kg.utils.Log;

	public class GameConfig
	{
		private var _xml:XML;
		
		
		public var injector:Array = ["UserInfoModel","HallAppMedel"];
		
		public var ip:String = "";
		public var port:uint = 58200;
		
		public function parseXMl(xml:XML):void{
			_xml = xml;
			if(!Common.isWeb){
				appMod.access_token = xml.test.userinfo.token;
				userInfo.user_id = xml.test.userinfo.user_id;
				userInfo.nick_name = xml.test.userinfo.name;
				appMod.timestamp = Long.fromNumber(Number(xml.test.userinfo.timeStamp));
				Log.debug = true;
			}
		}
		
		/**
		 * 设置Ip 
		 * @param _ip
		 * @param _port
		 */		
		public function setIp(_ip:String, _port:uint):void
		{
			if( _ip == "" )
			{
				this.ip = "10.63.7.63";
				this.port = 58200;
			}else{
				this.ip = _ip;
				this.port = _port;
			}
		}
		
	}
}