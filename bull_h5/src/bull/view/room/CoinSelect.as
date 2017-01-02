package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import com.lightUI.core.Light;
	import laya.filters.ColorFilter;
	
	import laya.events.Event;
	
	import ui.ui.room.BetChipUI
	
	
	public class CoinSelect extends BetChipUI
	{
		private var  _coinValue:Array = [];
		
		private var ligth_po:Array = [1,89,179,268,358,448];
		private var arror_po:Array = [35,123,213,302,392,483];
		private var _pre_idx:int = 0;
				
		private var grayscaleFilter:ColorFilter;
		
		public function CoinSelect() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();			
			
			for (var i:int = 0; i < 6; i++)
			{
				this["Coin_" + i].on(Event.CLICK, this, onClick);
			}			
			
			var grayscaleMat = [0.3086, 0.6094, 0.0820, 0, 0, 0.3086, 0.6094, 0.0820, 0, 0, 0.3086, 0.6094, 0.0820, 0, 0, 0, 0, 0, 1, 0];
			grayscaleFilter = new ColorFilter(grayscaleMat);			
			
		}
		
		private function onClick(e:Event):void
		{					
			var s:String = e.target.name;
			s = s.substr(5, 1);			
			
			var idx:int = parseInt(s);
			
			//相同,不作事
			if (idx == _pre_idx) return;
			
			//新的往上
			this["Coin_" + idx].y = 7;
			Coin_light.x = ligth_po[idx];
			Selcet_Arrow.x = arror_po[idx];			
			
			//舊的往下
			this["Coin_" + _pre_idx].y = 24;
			
			_pre_idx = idx;
			 
			//TODO 改變選定值
			//event(LightEvent.ITEM_CLICK,parseInt(s));			
		}
		
		public function set_data(data:Array):void
		{
			_coinValue.length = 0;
			_coinValue.push(data);
			
			var coinlist:Array = _coinValue[0];
			for (var i:int = 0; i < coinlist.length ; i++)
			{				
				this["Coin_"+i].source = Light.loader.getRes("res/gameScene/chip_" + coinlist[i] + ".png");
			}
			
		}
		
		public function set_gray():void
		{
			Coin_5.filters = [grayscaleFilter];
		}
		
		private function test():void
		{
			//view.BetChip.set_data([100,500,1000,5000,10000,"max"]);			
			//view.BetChip.set_gray();			
		}			
		
	}

}