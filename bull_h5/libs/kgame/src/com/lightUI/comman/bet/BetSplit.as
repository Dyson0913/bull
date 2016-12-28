package com.lightUI.comman.bet
{
	
	
	/**
	 * 
	 * @author light-k
	 * 
	 * example:
	 * var split:BetSplit = new BetSplit();
	 * split.splitBet(1500);
	 * 
	 * 
	 *
	 *  public static var type1ChipArr:Array = [
	 *	new BetInfoVO(1,1),
	 *		new BetInfoVO(5,1),
	 *		new BetInfoVO(10,7),
	 *		new BetInfoVO(20,1),
	 *		new BetInfoVO(50,5),
	 *		new BetInfoVO(100,999)
	 *	];
	 *	
	 *	public static var type2ChipArr:Array = [
	 *		new BetInfoVO(10,1),
	 *		new BetInfoVO(50,1),
	 *		new BetInfoVO(100,7),
	 *		new BetInfoVO(500,1),
	 *		new BetInfoVO(1000,5),
	 *		new BetInfoVO(5000,999)
	 *	];
	 * 
	 * 
	 */	
	public class BetSplit
	{
		private var _betConfig:Array = [];
		
		private var _bets:Array;
		private var _remainder:int;
		
		public function BetSplit()
		{
			
		}
		
		
		
		/**
		 * 撤销筹码
		 * @param chips
		 * @param revoke
		 * @return 
		 * 
		 */		
		public function revoke(chips:Array,revoke:Array):Array{
			chips.sort(sortOnPrice);
			
			var re:Array = [];
			var rl:int = revoke.length;
			for (var i:int = 0; i < rl; i++) 
			{
				re.push(revokeHandler(chips,revoke[i]));
			}
			return re;
		}
		
		private function revokeHandler(chips:Array,revoke:BetInfoVO):RevokeParam{
			//优先找替换筹码  然后是找零  最后是凑整
			var re:RevokeParam = new RevokeParam();
			
			var slip:Array;
			
			var cl:int = chips.length;
			
			for (var i:int = 0; i < cl; i++) 
			{
				if(chips[i].value == revoke.value){
					re.remove.push(revoke.clone());
					chips.splice(i,1);
					trace("找到替换筹码",chips,"\n",re);
					return re;
				}else if(chips[i].value > revoke.value){
					re.split.push(chips[i]);
					re.add = splitBet(chips[i].value - revoke.value).chips;
					chips.splice(i,1);
					//chips = chips.concat(re.add);
					chips = concatVector(chips,re.add);
					chips.sort(sortOnPrice);
					trace("需要找零",chips,"\n",re);
					
					return re;
				}
			}
			
			
			//var removeIndex:Vector.<int> = new Vector.<int>();
			var value:int = revoke.value;
			var temp:int = 0;
			for (var j:int = cl - 1; j >= 0; j--) 
			{
				temp = value - chips[j].value;
				if(temp > 0){
					value = temp;
					re.remove.push(chips[j]);
					chips.splice(j,1);
				}else if(temp == 0){
					value = temp;
					re.remove.push(chips[j]);
					chips.splice(j,1);
					trace("凑整： ",re)
					return re;
				}else {
					
				}
			}
			trace("数据可能有错误");
			
			return null;
		}
		private function sortOnPrice(a:BetInfoVO, b:BetInfoVO):Number {
			var av:int = a.value;
			var bv:int = b.value;
			
			if(av > bv) {
				return 1;
			} else if(av < bv) {
				return -1;
			} else  {
				//a == b
				return 0;
			}
		}
		private function concatVector(v1:Array,v2:Array):Array{
			var l:int = v2.length;
			for (var i:int = 0; i < l; i++) 
			{
				v1.push(v2[i]);
			}
			return v1;
			
		}
		
		public function getMinChip():BetInfoVO{
			return _betConfig[0];
		}
		public function getChip(value):BetInfoVO{
			for (var i:int = 0; i < _betConfig.length; i++) 
			{
				if((_betConfig[i] as BetInfoVO).value == value) return _betConfig[i];
			}
			return null;
		}
		public function getChipByID(id:int):BetInfoVO{
			if(id <= _betConfig.length) return _betConfig[id];
			return null;
		}
		
		public function sunOfChips(chips:Array):int{
			var l:int = chips.length;
			var sun:int = 0;
			for (var i:int = 0; i < l; i++) 
			{
				sun += (chips[i] as BetInfoVO).value;
			}
			return sun;
		}
		
		/**
		 * 将整体的注额拆分成筹码 
		 * @param value	整体注额
		 * @return 		拆分后的筹码数组
		 * 
		 */		
		public function splitBet(value:int = 2000):BetSlipParam{
			var re:BetSlipParam = new BetSlipParam();
			
			if(value < _betConfig[0].value){
				re.remainder = -1;
				return re;
			}
			
			_bets = [];
			
			splitBetHandler(value);
			re.chips = _bets;
			re.remainder = _remainder;
			clear();
			return re;
		}
		private function splitBetHandler(value:int = 2000):Boolean{
			if(value == 0){
				return true;
			}
			
			var minchip:BetInfoVO = getMinChip();
			var tempvalue:int = value;
			
			var n:int;
			var l:int = _betConfig.length;
			
			for (var i:int = 0; i < l; i++) 
			{
				n = _betConfig[i].rate;
				for (var j:int = 0; j < n; j++) 
				{
					tempvalue = value - _betConfig[i].value;
					if(tempvalue >= minchip.value){
						_bets.push(_betConfig[i].clone());
						value = tempvalue;
						trace("继续分",_betConfig[i],tempvalue)
					}else if(tempvalue < minchip.value && tempvalue >= 0){
						_bets.push(_betConfig[i].clone());
						value = tempvalue;
						_remainder = tempvalue;
						trace("分完了",_remainder);
						return true;
					}else{
						return splitBetHandler(value);
					}
				}
			}
			
			
			return splitBetHandler(value);
		}
		
		public function clear():void{
			_bets = null;
			//isover = false;
			_remainder = NaN;
		}
		
		public function get betConfig():Array
		{
			return _betConfig;
		}
		
		public function set betConfig(value:Array):void
		{
			_betConfig = value;
			_betConfig.sort(sorton);
		}
		private function sorton(d1:BetInfoVO, d2:BetInfoVO):int{
			if(d1.value > d2.value){
				return 1;
			}else if(d1.value < d2.value){
				return -1;
			}else{
				return 0;
			}
		}
	}
}