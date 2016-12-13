package com.lightUI.comman.bet
{
	public class BetInfoVO
	{
		public var value:int;
		public var rate:int;
		public var count:int;
		
		public function BetInfoVO(value:int = 0,rate:int = 0):void{
			this.value = value;
			this.rate = rate;
		} 
		
		public function clone():BetInfoVO{
			var re:BetInfoVO = new BetInfoVO();
			re.value = this.value;
			re.rate = this.rate;
			re.count = this.count;
			return re;
		}
		
		public function toString():String{
			return "["+value+"]";
		}
	}
}