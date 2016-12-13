package BullHall.manager
{
	
	
	import car.mgr.GConfig;
	
	import kg.core.assetsloader.IURLManager;
	
	public class HallUrlManager implements IURLManager
	{
		private var _version:String;
		private var _root:String="";
		private var _urlXML:XML;
		
		private var _srcServer:String;
		
		private static  var _singleton:Boolean=true;
		private static  var _instance:HallUrlManager;
		public function HallUrlManager() {
			if (_singleton) {
				throw new Error("只能用getInstance()来获取实例");
			}
		}
		public static function getInstance():HallUrlManager{
			if (!_instance) {
				_singleton=false;
				_instance=new HallUrlManager();
				_singleton=true;
			}
			return _instance;
		}
		
		public function get urlXML():XML
		{
			return null;
		}
		
		public function set urlXML(value:XML):void
		{
		}
		
		public function get configURL():String
		{
			return _root + GConfig.get().carHallPath + "assets/hallUrlConfig.xml?"+version;
		}
		
		public function set configURL(value:String):void
		{
		}
		
		public function getPlayerHeadIcon(url:String):String{
			return _srcServer+url;
		}
		
		public function get versionURL():String{
			return "";//_root+"version.xml?"+Math.random();
		}
		
		public function get version():String
		{
			return _version;
		}
		
		public function set version(value:String):void
		{
			_version = value;
		}
		
		public function getURL(key:String):String
		{
			if(key.indexOf("http") == 0) return key;
			return _root + GConfig.get().carHallPath +_urlXML.url.(@n == key).@u+"?"+version;
		}
		
		public function getURLRequest(name:String):URLRequest
		{
			return null;
		}
		
		public function parceXML(xml:XML):void{
			_urlXML = xml;
		}

		public function get root():String
		{
			return _root;
		}

		public function set root(value:String):void
		{
			_root = value;
		}

		public function get srcServer():String
		{
			return _srcServer;
		}

		public function set srcServer(value:String):void
		{
			_srcServer = value;
		}

	}
}