package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import com.lightUI.core.Light;
	import laya.filters.ColorFilter;
	
	import laya.utils.Tween;
	import laya.events.Event;
	
	import ui.ui.room.BetAreaViewUI
	
	
	public class BetAreaView extends BetAreaViewUI
	{		
		private var zone_flash_times:int = 0;
		private var _isPlayerbanker:Boolean;
		private var _tableLimit:Number;
		
		public function BetAreaView() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();			
			
			for (var i:int = 0; i < 4; i++)
			{				
				this["total_amount_" + i]["bg_ani"].index = i;
			}	
			
		}
		
		private function onScenedown(e:Event):void
		{
			var sName:String = e.target.name;
			var pattern:RegExp = /Scene_/;
			sName = sName.replace(pattern, "");	
			var idx:int = parseInt(sName);
			trace("onSceneClick = " + idx);
			
			//閃一下
			this["zone_" + idx].visible = true;
			
			//TODO 下注
			event(LightEvent.ITEM_CLICK,idx);
		}
		
		private function onSceneup(e:Event):void
		{
			var sName:String = e.target.name;
			var pattern:RegExp = /Scene_/;
			sName = sName.replace(pattern, "");	
			var idx:int = parseInt(sName);
			
			//閃一下			
			this["zone_" + idx].visible = false;
			
			
		}
		
		public function set_(isPlayerbanker:Boolean,limit:Number):void
		{			
			hide();
			_isPlayerbanker = isPlayerbanker;
			_tableLimit = limit;
			
			this.visible = true;
			zone_flash_times = 0;
			for (var i:int = 0; i < 4; i++)
			{				
				this["total_amount_" + i].visible = false;
				this["zone_" + i].visible = false;
				this["self_amount_" + i].visible = false;
			}			
			
			Laya.timer.loop(500, this, timerHandler);
			
		}
		
		public function timerHandler():void
		{
			zone_flash_times++;
			if (zone_flash_times == 4)
			{
				//閃爍結束
				Laya.timer.clear(this, timerHandler);
				for (var i:int = 0; i < 4; i++)
				{					
					this["Scene_" + i].on(Event.MOUSE_DOWN, this, onScenedown);
					this["Scene_" + i].on(Event.MOUSE_UP, this, onSceneup);				
				}	
				BetLimit.visible = _isPlayerbanker;
				BetLimit.amount.font = "LimitFont";
				//TODO 幣值符號
				BetLimit.amount.text  = _tableLimit;
			}
			
			for (var i:int = 0; i < 4; i++)
			{								
				this["zone_" + i].visible = !this["zone_" + i].visible;
			}	
		}
				
		public function tablelimit_updata(rest:Number):void
		{
			if ( BetLimit.visible)
			{
				BetLimit.amount.text = rest.toString();
				var percent:Number = rest / _tableLimit ;
				if ( percent > 0.5) 
				{
					BetLimit.Green.width = 146 * percent;
				}
				else
				{
					BetLimit.Green.visible = false;
					BetLimit.Red.width = 73 * (percent*2);
				}
			}
		}
		
		public function update_total(idx:int,amount:Number ):void
		{
			//總數更新
			this["total_amount_" + idx]["title"].visible = true;
			this["total_amount_" + idx].visible = true;
			this["total_amount_" + idx]["amount"].text = amount.toString();			
			
			
		}
		
		public function update_self(idx:int, amount:Number ):void
		{
			//自己下注更新
			this["self_amount_" + idx]["amount"].font = "mybetFont";			
			this["self_amount_" + idx].visible = true;
			this["self_amount_" + idx]["amount"].text = amount.toString();
		}
		
		public function zone_light(idx:int):void
		{
			for (var i:int = 0; i < 4; i++)
			{	
				if ( idx == i) this["total_amount_" + i]["light"].visible = true;
				else this["total_amount_" + i]["light"].visible = false;
			}	
		}
		
		public function hide():void
		{
			for (var i:int = 0; i < 4; i++)
			{												
				this["Scene_" + i].off(Event.MOUSE_DOWN, this, onScenedown);
				this["Scene_" + i].off(Event.MOUSE_UP, this, onSceneup);				
				
				//總數
				this["total_amount_" + i]["title"].visible = false;
				this["total_amount_" + i].visible = false;
				this["total_amount_" + i]["amount"].text = "";	
				
				//自己下注				
				this["self_amount_" + i].visible = false;
				this["self_amount_" + i]["amount"].text = "";
				
			}	
			_isPlayerbanker = false;
		}
		
		private function test():void
		{
			//view.BetZoneBoard.set_data([200]);
		}			
		
	}

}