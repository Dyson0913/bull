package com.lightUI.KGameComponents.assetsInPanel
{
	public class AssetsVO
	{
		//---------------输入 ----------------
		public var cash:Number = 0;			//现金
		public var nm:Number = 0;				//拟码
		public var coin:Number = 0;			//G币
		
		public var min:Number = 0;				//最小带入
		public var max:Number = 0;				//最大带入
		public var currency:Number = 0;		//带入类型
		
		public var amount_default:Number = 0;	//默认带入
		public var cash_step:Number = 0;		//现金步长
		public var coin_step:Number = 0;		//虚拟币步长
		
		
		//---------------输出 ----------------
		public var amount_cash:Number;
		public var amount_nm:Number;
		public var amount_coin:Number;
		public var amount_total:Number;
		
		public function clear():void{
			cash = 0;
			nm = 0;
			coin = 0;
			min = 0;
			max = 0;
			currency = 0;
			amount_default = 0;
			cash_step = 0;
			coin_step = 0;
			
			amount_cash = 0;
			amount_nm = 0;
			amount_coin = 0;
			amount_total = 0;
		}
		
		public function clone():AssetsVO{
			var re:AssetsVO = new AssetsVO();
			re.cash = this.cash;
			re.nm = this.nm;
			re.coin = this.coin;
			re.min = this.min;
			re.max = this.max;
			re.currency = this.currency;
			re.amount_default = this.amount_default;
			re.cash_step = this.cash_step;
			re.coin_step = this.coin_step;
			
			re.amount_cash = this.amount_cash;
			re.amount_nm = this.amount_nm;
			re.amount_coin = this.amount_coin;
			re.amount_total = this.amount_total;
			
			return re;
		}
	}
}