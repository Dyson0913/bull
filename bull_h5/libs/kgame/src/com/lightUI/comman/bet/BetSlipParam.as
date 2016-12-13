package com.lightUI.comman.bet
{
	public class BetSlipParam
	{
		public var chips:Array;
		public var remainder:int;//////////////余数
		
		public function toString():String{
			return chips.join(",")+"remainder:"+remainder;
		}
	}
}