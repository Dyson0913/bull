package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import com.lightUI.core.Light;
	import laya.filters.ColorFilter;
	
	import laya.utils.Tween;
	import laya.events.Event;
	
	import ui.ui.room.BetZoneUI
	
	
	public class BetZone extends BetZoneUI
	{		
		private var zone_flash_times:int = 0;
		
		public function BetZone() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();			
			
			for (var i:int = 0; i < 4; i++)
			{
				this["zone_" + i].on(Event.CLICK, this, onClick);
				this["total_amount_" + i]["bg_ani"].index = i;
				
			}	
			
		}
		
		private function onClick(e:Event):void
		{					
			
			var s:String = e.target.name;
			s = s.substr(5, 1);			
			
			var idx:int = parseInt(s);
			trace("idx = " + idx);
			
			//閃一下
			//this["zone_" + i].visible = true;
			
			
			
			//總數更新
			this["total_amount_" + idx].visible = true;
			this["total_amount_" + idx]["amount"].text = 1;
			this["total_amount_" + idx]["title"].visible = true;
			this["total_amount_" + idx]["light"].visible = true;
						
			//自己下注更新
			this["self_amount_" + idx]["amount"].font = "mybetFont";
			
			this["self_amount_" + idx].visible = true;
			this["self_amount_" + idx]["amount"].text = 10000;
			
			
			//TODO 
			//event(LightEvent.ITEM_CLICK,parseInt(s));			
		}
		
		public function set_data(data:Array):void
		{			
			this.visible = true;
			zone_flash_times = 0;
			for (var i:int = 0; i < 4; i++)
			{				
				this["total_amount_" + i].visible = false;
				this["zone_" + i].visible = false;
				this["self_amount_" + i].visible = false;
			}	
			
			//TODO 幣值符號
			var Isbanker:Boolean = true;
			if ( Isbanker)
			{
				BetLimit.visible = true;
				BetLimit.amount.font = "LimitFont";
				BetLimit.amount.text = data[0];
			}
			
			Laya.timer.loop(500, this, timerHandler);
			
		}
		
		public function timerHandler():void
		{
			zone_flash_times++;
			if (zone_flash_times == 5) Laya.timer.clear(this, timerHandler);
			
			for (var i:int = 0; i < 4; i++)
			{								
				this["zone_" + i].visible = !this["zone_" + i].visible;
			}	
		}
		
		
		public function hide():void
		{
			BetLimit.visible = false;
		}
		
		private function test():void
		{
			//view.BetZoneBoard.set_data([200]);
		}			
		
	}

}