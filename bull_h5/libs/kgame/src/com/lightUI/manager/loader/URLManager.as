package com.lightUI.manager.loader
{
	import com.iflash.events.EventDispatcher;
	import com.lightUI.events.LightEvent;
	
	import laya.net.Loader;
	import laya.utils.Browser;
	import laya.utils.Handler;

	public class URLManager extends EventDispatcher implements IURLManager
	{
		private var _config:Object;
		
		private var _configURL:String;
		
		public function URLManager()
		{
		}
		
		public function get version():String
		{
			return null;
		}
		
		public function set version(value:String):void
		{
		}
		
		public function get root():String
		{
			return "";
		}
		
		public function set root(value:String):void
		{
		}
		
		public function get configURL():String
		{
			return _configURL;
		}
		
		public function set configURL(value:String):void
		{
			_configURL = value;
		}
		
		//提供 一个key值
		public function getURL(name:String):String
		{
			//return root+_config[name]["url"]+"?v="+version;
			return getURLInfo(name)["url"];
		}
		
		public function getURLInfo(name:String):Object{
			var re:Object = _config[name];
			if(!re["isparse"]){
				if(Browser.onAndriod || Browser.onIOS){
					re["url"] = root+_config[name]["url"];
				}else{
					re["url"] = root+_config[name]["url"]+"?v="+version;
				}
				re["isparse"] = true;
			}
			return re;
		}
		
		public function getURLGroup(key:String):Array{
			var re:Array = _config.group[key];
			var name:String;
			for (var i:int = 0; i < re.length; i++) 
			{
				getURL(re[i]);
			}
			return _config[key];
		}
		
		public function loadConfig(info:* = null):void{
			if(info is Object && !(info is String)){
				//trace("is Object")
				this.config = info;
			}else if(info is String){
				//trace("is String",info)
				configURL = info;
				Laya.loader.load([{url:configURL,type:Loader.JSON}],Handler.create(this,onConfigURLLoaded));
			}else if(!info){
				//trace("no String")
				Laya.loader.load([{url:configURL,type:Loader.JSON}],Handler.create(this,onConfigURLLoaded));
			}else{
				throw new Error("URLManager 暂时不接受这格式");
			}
		}
		
		private function onConfigURLLoaded():void{
			//trace("onConfigURLLoaded",Laya.loader.getRes(configURL))
			loadConfig(Laya.loader.getRes(configURL));
			this.dispatchEvent(new LightEvent(LightEvent.COMPLETE));
		}

		public function get config():Object
		{
			return _config;
		}

		public function set config(value:Object):void
		{
			_config = value;
			this.version = _config.version;
		}

	}
}