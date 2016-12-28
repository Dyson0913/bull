package com.lightUI.comman.bet
{
	public class BetSlipParam
	{
		public var chips:Array;
		public var remainder:int;//////////////余数    正常情况》=0   -1表示少于最低筹码 无法拆分   
		
		public function toString():String{
			return chips.join(",")+"remainder:"+remainder;
		}
	}
}