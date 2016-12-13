package BullHall.manager
{
	import kg.utils.MyMath;
	
	import worker.URLParam;

	public class SoundNameManager
	{
		public var Lobby_BGM:String = "Lobby_BGM";	//背景音乐

	
		private var _sounds:Vector.<URLParam> = new Vector.<URLParam>;
		
		private static  var _singleton:Boolean=true;
		private static  var _instance:SoundNameManager;
		public function SoundNameManager():void{
			if (_singleton) {
				throw new Error("只能用getInstance()来获取实例");
			}
		}
		public static function getInstance():SoundNameManager {
			if (!_instance) {
				_singleton=false;
				_instance=new SoundNameManager();
				_singleton=true;
				
			}
			return _instance;
		}
		
		public function parseXML(sounds:XMLList):void{
			//trace(xsounds)
			var info:URLParam;
			for each (var xml:XML in sounds) 
			{
				info = new URLParam();
				info.name = xml.@n;
				_sounds.push(info);
			}
		}
		
		public function getName(name:String):String{
			var infos:Array = [];
			for each (var info:URLParam in _sounds) 
			{
				trace(info.name);
				if(info.name.indexOf(name) == 0) infos.push(info.name);
			}
			var re:String = MyMath.randomFromArray(infos);
			if(re != "undefined"){
				return re;
			}
			return "";
		}
		
	}
}