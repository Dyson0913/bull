package com.lightUI.manager.error
{
	public class ErrorManager
	{
		public function ErrorManager()
		{
		}
		
		
		private var _error:Object;
		public function init(error:Object):void{
			_error = error;
		}
		
		public function getError(key:String):String{
			return _error[key]["value"]; 
		}
		
		public function isInited():Boolean{
			if(_error) return true;
			return false;
		}
	}
}