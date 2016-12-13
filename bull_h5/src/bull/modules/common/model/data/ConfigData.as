package bull.modules.common.model.data
{
	public class ConfigData
	{
		public static const NAME:String = "ConfigData";
		
		public var ip:String;
		public var port:int;
		public var zone:String;
		public var debug:Boolean;
		
		private var _configData:Object;

		public function get configData():Object
		{
			return _configData;
		}

		public function set configData(value:Object):void
		{
			_configData = value;
			ip = _configData.ip;
			port = _configData.port;
			zone = _configData.zone;
			debug = _configData.debug;
		}

	}
}