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
		
		/**
		 * 返回大厅 
		 * @param callBack
		 * 
		 */		
		public function goBack(callBack:Handler):void{
			__JS__("this.KGAPI.goBack(callBack.method.bind(callBack.caller))");
		}
		
		/**
		 * 跳转到充值页面
		 * @param type     		cash：跳转到现金充值界面    coin
		 * @param callBack
		 * 
		 */		
		public function rechargeShow(type:String,callBack:Handler):void{
			__JS__("this.KGAPI.rechargeShow(callBack.method.bind(callBack.caller))");
		}
	}
}