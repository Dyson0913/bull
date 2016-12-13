package bull.core
{
	import com.lightUI.manager.LayerManager;
	import com.lightUI.manager.LayerMask;

	public class BullLayerManager extends LayerManager
	{
		private static  var _singleton:Boolean=true;
		private static  var _instance:CarLayerManager;
		public function CarLayerManager() {
			if (_singleton) {
				throw new Error("只能用getInstance()来获取实例");
			}
		}
		public static function getInstance():BullLayerManager{
			if (!_instance) {
				_singleton=false;
				_instance=new BullLayerManager();
				_singleton=true;
			}
			return _instance;
		}
		
		public var loading:LayerMask = new LayerMask();
	}
}