package com.lightUI.manager.loader
{
	import com.iflash.events.EventDispatcher;
	import com.lightUI.events.LightEvent;
	
	import laya.net.Loader;
	import laya.net.URL;
	import laya.utils.Handler;

	public class URLManager extends EventDispatcher implements IURLManager
	{
		private var _config:Object;
		
		private var _rootURL:String = "";
		private var _versionURL:String = "files.fst";
		private var _configURL:String = "URL.json";
		
		
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
			return _rootURL;
		}
		
		public function set root(value:String):void
		{
			_rootURL = value;
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
			return _rootURL+getURLInfo(name)["url"];
		}
		
		public function getURLInfo(name:String):Object{
			return _config[name];
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
		
		
		public function loadConfig():void{
			loadFile();
		}

		
		
		private function loadFile():void{
			//先加载版本信息
			var t_str : String = _rootURL+_versionURL+"?" + getRandStr(6);//每次更新随机，保证文件都是最新的
			//Laya.loader.load( t_str, new Handler( this, onFilesLoaded),new Handler(this,onFilesProgress), Loader.BUFFER );
			UpdateManager.Instance().LoadFile( t_str, Handler.create( this, onFileLoaded), null );
		}
		private function onFileLoaded():void{
			loadURL(_rootURL + _configURL);
		}
		
		
//		//加载URL地址信息
//		private function loadURL():void{
//			var t_str : String = _rootURL+_configURL;
//			Laya.loader.load( t_str, new Handler( this, onFilesLoaded),new Handler(this,onFilesProgress), Loader.JSON );	
//		}
		
		
		
		
	
		
	
		
		/**
		 * 得到一个随机的字符串长度.---注意：返回的string.length与既定的_slen有不符合的情况 ；
		 * @param	_slen
		 * @return
		 */
		public function getRandStr( slen : int ) : String {
			if ( slen < 1 ) slen = 1;
			
			var t_num : Number = Math.random();
			var arr : Array = (t_num.toPrecision( slen )).split( '.' );
			
			return arr[1];
		}
		
		public function loadURL(info:* = null):void{
			if(info is Object && !(info is String)){
				//trace("is Object")
				this.config = info;
			}else if(info is String){
				//trace("is String",info)
				configURL = info;
				Laya.loader.load([{url:configURL,type:Loader.JSON}],Handler.create(this,onURLLoaded));
			}else if(!info){
				//trace("no String")
				Laya.loader.load([{url:configURL,type:Loader.JSON}],Handler.create(this,onURLLoaded));
			}else{
				throw new Error("URLManager 暂时不接受这格式");
			}
		}
		
		private function onURLLoaded():void{
			//trace("onConfigURLLoaded",Laya.loader.getRes(configURL))
			loadURL(Laya.loader.getRes(configURL));
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
//			URL.version = this.version
			
			//trace(_config);
			for(var i:String in _config) 
			{
				//trace("set config",i,this.version)
				if(i != "group" && i != "scence" && i != "version"){
					URL.version[_config[i]] = this.version;
				}
			}
		}

	}
}