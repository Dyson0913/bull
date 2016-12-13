package bull.core
{
	import com.lightUI.manager.loader.URLManager;
	
	public class BullURLManager extends URLManager
	{
		private static  var _singleton:Boolean=true;
		private static  var _instance:CarURLManager;
		public function CarURLManager() {
			if (_singleton) {
				throw new Error("只能用getInstance()来获取实例");
			}
		}
		public static function getInstance():BullURLManager{
			if (!_instance) {
				_singleton=false;
				_instance=new BullURLManager();
				_singleton=true;
			}
			return _instance;
		}
		
		override public function get configURL():String{
			return "res/config/BullURL.json";
		}
	}
}