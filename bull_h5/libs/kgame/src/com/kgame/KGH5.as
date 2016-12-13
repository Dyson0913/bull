package com.kgame
{
	import laya.utils.Browser;
	import laya.utils.Handler;

	public class KGH5
	{
		private var KGAPI:* = Browser.window.KGH5;
		
		public function KGH5()
		{
		}
		
		/**
		 * 获取用户余额信息 
		 * @param callBack  回调函数
		 * 
		 */		
		public function getUserBalance(callBack:Handler):void{
			__JS__("this.KGAPI.getUserBalance(callBack.method.bind(callBack.caller))");
		}
		
		/**
		 * 获取用户新手状态 
		 * @param callBack  回调函数
		 * 
		 */		
		public function getPlayerGuideStatus(callBack:Handler):void{
			__JS__("this.KGAPI.getUserBalance(callBack.method.bind(callBack.caller))");
		}
	}
}