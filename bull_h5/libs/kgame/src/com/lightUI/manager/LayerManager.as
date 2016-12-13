package com.lightUI.manager
{
	import laya.display.Sprite;

	public class LayerManager
	{
		public var loadingMask:LayerMask = new LayerMask();
		
		public var scence:Sprite;
		public var top:Sprite;
		
		public function LayerManager()
		{
		}
		
		public function init(root:Sprite):void{
			loadingMask.init(root);
			scence = new Sprite();
			top = new Sprite();
			root.addChild(scence);
			root.addChild(top);
		}
	}
}