package com.lightUI.manager.loader
{
	import laya.net.LoaderManager;
	
	public class LLoaderManager extends LoaderManager
	{
		private var _URLM:IURLManager;
		
		public function LLoaderManager()
		{
			super();
			_URLM = new URLManager();
		}
		
		public function enqueue(asset:String):void {
			if(String(asset).indexOf("http") == -1 && String(asset).indexOf("/") == -1 && String(asset).indexOf(".") == -1){
				if(_URLM) asset = _URLM.getURL(asset as String);
				else throw new Error("必须实现URLManager用来管理资源路径，你可以继承BaseURLManager，也可以实现IURLManager接口，在此管理类中管理所有的路径");
			}
		}
		
		override public function getRes(url:String):*{
			if(String(url).indexOf("http") == -1 && String(url).indexOf("/") == -1){
				url = _URLM.getURL(url);
			}
			return super.getRes(url);
		}
		
		public function loadConfig(info:* = null):void{
			URLM.loadConfig(info);
		}

		public function get URLM():IURLManager
		{
			if(_URLM) return _URLM;
			else throw new Error("必须实现URLManager用来管理资源路径，你可以继承BaseURLManager，也可以实现IURLManager接口，在此管理类中管理所有的路径");
		}

		public function set URLM(value:IURLManager):void
		{
			_URLM = value;
		}
	}
}