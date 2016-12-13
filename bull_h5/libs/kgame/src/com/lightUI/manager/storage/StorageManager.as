package com.lightUI.manager.storage
{
	import laya.utils.Dictionary;
	
	public class StorageManager
	{
		private static  var _singleton:Boolean=true;
		private static  var _instance:StorageManager;
		public function LayerManager():void{
			if (_singleton) {
				throw new Error("只能用getInstance()来获取实例");
			}
		}
		public static function getInstance():StorageManager {
			if (!_instance) {
				_singleton=false;
				_instance=new StorageManager();
				_singleton=true;
			}
			return _instance;
		}
		
		private var _storages:Dictionary = new Dictionary;
		
		public function creatStorage(name:String, clazz:Class):Storage{
			if(!_storages.get(name)) _storages.set(name,new Storage(clazz));
			
			return _storages.get(name);
		}
		public function getStorage(name:String):Storage{
			return _storages.get(name);
		}
		
		public function destroy():void
		{
			for (var key:String in _storages.keys) 
			{
				(_storages.get(key) as Storage).destroy();
				delete(_storages.get(key))
			}
			_storages = null;
		}
	}
}