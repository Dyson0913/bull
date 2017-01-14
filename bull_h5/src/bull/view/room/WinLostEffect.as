package bull.view.room 
{
	import com.IProtobuf.Long;
	import com.lightUI.events.LightEvent;
	import conf.SDealInfo;
	import laya.ui.Label;
	
	import laya.filters.BlurFilter;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import ui.ui.room.WinLostEffectUI
	
	public class WinLostEffect extends WinLostEffectUI
	{
		private var _winlose_data:Array = [];
		private var _winlose_display:Array = [];
		
		public function WinLostEffect() 
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			this.hide();
		}
		
		public function set_(display_data:Array,data:Array):void
		{
			_winlose_display = display_data;
			_winlose_data = data;
		}
		
		public function play():void
		{
			this.hide();
			
			for (var i:int = 0; i < 4; i++)
			{
				var win_amount:Long = _winlose_data[i];
				var display_amount:String = _winlose_display[i];
				
				var win:Number = 0;
				if ( win_amount.toNumber() != null) win = win_amount.toNumber();
				
				if ( win == 0) continue;
				
				var lableItem:Label;
				var str:String;
				
				
				if ( win >= 0) 
				{
					lableItem = this["Win_" + i];
					str = "+" + display_amount;
					lableItem.font = "bubbleWin";
				}
				else
				{
					lableItem = this["Lost_" + i];
					str = display_amount;
					lableItem.font = "bubbleLost";
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