package com.lightUI.comman.bet
{
	/**
	 * 
	 * @author light-k
	 * 
	 */	
	public class RevokeParam
	{
		//如果是相同的筹码，需要从舞台移除掉
		public var remove:Array = [];
		
		//需要拆的整钱，需要从舞台移除掉
		public var split:Array = [];
		
		//新添加到舞台，不会被移除掉的
		public var add:Array = new Array;
		
		public function toString():String{
			var re:String = "remove: "+remove.toString()+"\n";
			re += "split: "+split.toString()+"\n";
			re += "add: "+add.toString()+"\n";
			return re;
		}
	}
}