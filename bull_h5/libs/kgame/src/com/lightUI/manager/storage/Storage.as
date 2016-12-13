package com.lightUI.manager.storage
{
	public class Storage
	{
		private var _clazz:Class;
		
		private var _items:Array = [];
		
		public function Storage(clazz:Class)
		{
			_clazz = clazz;
		}
		
		public function getObject():*{
			if(_items.length > 0){
				//Log.log(_clazz,"仓库有东西 ",_items.length);
				return _items.pop();
			} else{
				//Log.log(_clazz,"仓库没有有东西了 ",_items.length);
				return new _clazz();
			}
		}
		public function rebackObject(obj:*):void{
			//Log.log(_clazz,"还东西了 ",obj["name"],_items.length);
			_items.push(obj);
		}
		
		public function clear():void{
			_items = [];
		}
		
		public function get length():uint{
			return _items.length;
		}
		
		public function destroy():void
		{
			_items = null;
		}
		
		public function get clazz():Class
		{
			return _clazz;
		}
		
		public function set clazz(value:Class):void
		{
			_clazz = value;
		}
	}
}