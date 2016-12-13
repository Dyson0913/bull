package com.lightUI.core
{
	import com.lightUI.manager.LayerManager;
	import com.lightUI.manager.error.ErrorManager;
	import com.lightUI.manager.languageManager.LanguageManager;
	import com.lightUI.manager.loader.LLoaderManager;
	import com.lightUI.manager.scence.ScenceManager;
	import com.lightUI.manager.timer.Timer;
	
	import laya.display.Sprite;

	public class Light
	{
		public static var root:Sprite;
		
		public static var loader:LLoaderManager = new LLoaderManager();
//		public static var URL:URLManager = new URLManager();
		public static var scence:ScenceManager = new ScenceManager();
		public static var layer:LayerManager = new LayerManager();
		public static var error:ErrorManager = new ErrorManager();
		public static var language:LanguageManager = new LanguageManager();
		public static var timer:Timer = new Timer();
		
		public function Light()
		{
			super();
		}
		
		public static function init(root:Sprite):void{
			layer.init(root);
			Light.root = root;
		}
	}
}