package com.lightUI.manager.loader
{
	import laya.events.EventDispatcher;
	import laya.net.LoaderManager;
	import laya.utils.Handler;
	
	public class LLoaderManager
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
		
		public function load(url:*, complete:Handler=null, progress:Handler=null, type:String=null, priority:int=1, cache:Boolean=true, group:String=null, ignoreCache:Boolean=false):LoaderManager{
			return Laya.loader.load(url,complete,progress,type,priority,cache,group,ignoreCache);
		}
		
		public function off(type:String, caller:*, listener:Function, onceOnly:Boolean=false):EventDispatcher{
			return Laya.loader.off(type,caller,listener,onceOnly);
		}
		
		public function offAll(type:String=null):EventDispatcher{
			return Laya.loader.offAll(type);
		}
			
		public function getRes(url:String):*{
			if(String(url).indexOf("http") == -1 && String(url).indexOf("/") == -1){
				url = _URLM.getURL(url);
			}
			return Laya.loader.getRes(url);
		}
		
		public function loadConfig():void{
			URLM.loadConfig();
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