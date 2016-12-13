package com.lightUI.utils
{
	import laya.utils.Dictionary;

	public class DictionaryUtils
	{
		public function DictionaryUtils()
		{
		}
		
		public static function destroy(dic:Dictionary):void{
			var keys:Array = getKeys(dic);
			for each (var i:Object in keys) 
			{
				delete(dic[i]);
			}
		}
		
		public static function isEmpty(dic:Dictionary):Boolean{
			for each (var i:Object in dic) 
			{
				return false;
			}
			return true
		}
		
		public static function getKeys(dic:Dictionary):Array{
			var keys:Array = [];
			for(var key:* in dic) 
			{
				keys.push(key)
			}
			return keys;
		}
		
		public static function toArray(dic:Dictionary):Array{
			var re:Array = [];
			for(var key:* in dic) 
			{
				re.push(dic[key])
			}
			return re;
		}
	}
}