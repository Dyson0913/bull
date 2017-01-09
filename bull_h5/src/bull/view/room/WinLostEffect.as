package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import laya.ui.Label;
	
	import laya.filters.BlurFilter;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import ui.ui.room.WinLostEffectUI
	
	public class WinLostEffect extends WinLostEffectUI
	{
		
		public function WinLostEffect() 
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this.hide();
		}
		
		public function set_data(data:Array):void
		{
			this.hide();
			
			for (var i:int = 0; i < 4; i++)
			{
				var win:int = data[i];
				if ( win == 0) continue;
				
				var lableItem:Label;
				var str:String;
				
				//TODO 幣值符號
				if ( win >= 0) 
				{
					lableItem = this["Win_" + i];
					str = "+" + win.toString();
				}
				else
				{
					lableItem = this["Lost_" + i];
					str = win.toString();					
				}				
				lableItem.visible = true;
				lableItem.text = str;
				
				Tween.to(lableItem, { y:lableItem.y - 30,scaleY:1,scaleX:1 }, 500, Ease.quintInOut);
			}
			
			
		}		
		
		
		public function hide():void
		{			
			for(var i:int =0;i< 4;i++)
			{				
				this["Win_" + i].visible = false;
				this["Win_" + i].y = 233;
				this["Win_" + i].scaleY = 0.5;
				this["Win_" + i].scaleX = 0.5;
				this["Win_" + i].font = "bubbleWin";
				this["Win_" + i].text = "";
				
				this["Lost_" + i].visible = false;
				this["Lost_" + i].y = 233;
				this["Lost_" + i].scaleY = 0.5;
				this["Lost_" + i].scaleX = 0.5;
				this["Lost_" + i].font = "bubbleLost";
				this["Lost_" + i].text = "";
			}
		}
		
		
		private function test():void
		{
			//view.PokerSet.set_data([]);
			//view.PokerSet.play();
			//view.PokerSet.hide();
		}		
	}

}