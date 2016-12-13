package BullHall.manager
{
	
	
	import BullHall.common.Common;
	
	import kg.core.manager.layerManager.LayerMask;

	public class LayerManager
	{
		private static  var _singleton:Boolean=true;
		private static  var _instance:LayerManager;
		
		public var loadingMask:LayerMask;
		
		public function LayerManager():void{
			if (_singleton) {
				throw new Error("只能用getInstance()来获取实例");
			}
		}
		public static function getInstance():LayerManager {
			if (!_instance) {
				_singleton=false;
				_instance=new LayerManager();
				_singleton=true;
			}
			return _instance;
		}
		
		public var root:DisplayObjectContainer
		private var _layerBottom:Sprite;
		private var _layerMiddle:Sprite;
		private var _layerTop:Sprite; // top基本是alert层
		private var _layerTopMask:Shape;
		
		public function init(root:DisplayObjectContainer):void{
			this.root = root;
			_layerBottom = new Sprite();
			_layerMiddle = new Sprite();
			_layerTop = new Sprite();
			
			root.addChild(_layerBottom);
			root.addChild(_layerMiddle);
			root.addChild(_layerTop);
			
			loadingMask = new LayerMask();
			loadingMask.init(root);
		}
	
		public function get layerBottom():Sprite
		{
			return _layerBottom;
		}
		
		public function get layerMiddle():Sprite
		{
			return _layerMiddle;
		}
		
		public function get layerTop():Sprite
		{
			return _layerTop;
		}
		
		public function showPopUp(disObj:DisplayObject):void
		{
			if(_layerTopMask == null)
			{
				_layerTopMask = new Shape();
				_layerTopMask.graphics.beginFill(0,0.5); 
				_layerTopMask.graphics.drawRect(0,0,Common.GameWidth,Common.GameHeight);
				_layerTopMask.graphics.endFill();
			}
			_layerTop.addChild(_layerTopMask);
			_layerTop.addChild(disObj);
		}
		
		public function hidePopUp(disObj:DisplayObject):void
		{
			if( _layerTop.contains(_layerTopMask) )
				_layerTop.removeChild(_layerTopMask);
			if( _layerTop.contains(disObj) )
				_layerTop.removeChild(disObj);
		}

		public function clear():void{
			loadingMask.clear();
		}
	}
}