package com.lightUI.manager.languageManager
{
	public class LanguageManager
	{
		private var _type:String;
		
		public static const EN:String = "en";
		public static const CN:String = "cn";
		public static const TW:String = "tw";
		
		private var _language:Object;
		public function init(language:Object,type:String = "cn"):void{
			_language = language;
			_type = type;
		}
		
		public function getSrting(key:String):String{
			return _language[key][_type];
		}
		
		public function isInited():Boolean{
			if(_language) return true;
			return false;
		}
	}
}