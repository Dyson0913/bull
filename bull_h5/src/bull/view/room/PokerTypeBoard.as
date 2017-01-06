package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	
	import laya.filters.BlurFilter;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import ui.ui.room.PokerTypeUI
	
	public class PokerTypeBoard extends PokerTypeUI
	{
		private var blurFilter:BlurFilter 
			
		
		public function PokerTypeBoard() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();						
			blurFilter = new BlurFilter();
			blurFilter.strength = 5;			
		}
		
		public function set_data(data:Array):void
		{
			this.hide();
			
			for (var i:int = 0; i < 5; i++)
			{
				this["pokerType_" + i].filters = [blurFilter];
				this["pokerType_" + i]["odds"].font = "SettleWin";
				//TODO 牌型
				var info:Array = data[i];
				//this["pokerType_" + i]["Type"].index = 1;
				var de:int = i * 1500;
				
				this["pokerType_" + i].visible = true;
				Tween.to(this["pokerType_" + i], { x:this["pokerType_" + i].x+200}, 500, Ease.quintInOut,Handler.create(this,onCompleteHandler,[i,info[1]]),de);
			}
			
			
		}
		
		private function onCompleteHandler(i:int,odd:int):void 
		{
			this["pokerType_" + i].filters = [];
			this["pokerType_" + i]["multi"].scaleX = 1.5;
			this["pokerType_" + i]["multi"].scaleY = 1.5;
			this["pokerType_" + i]["multi"].alpha = 0;
			
			Tween.to(this["pokerType_" + i]["multi"], { scaleX:1, scaleY:1, alpha:1 }, 500, Ease.cubicOut);	
			
			this["pokerType_" + i]["odds"].scaleX = 1.5;
			this["pokerType_" + i]["odds"].scaleY = 1.5;
			this["pokerType_" + i]["odds"].alpha = 0;
			this["pokerType_" + i]["odds"].text = odd;
			Tween.to(this["pokerType_" + i]["odds"], {scaleX:1,scaleY:1,alpha:1}, 500, Ease.cubicOut,null,2);
				
		}
		
		
		
		public function hide():void
		{			
			var init_po:Array = [81, 368, 651, 904, 467];
			for(var i:int =0;i< 5;i++)
			{
				this["pokerType_" + i].visible = false;
				this["pokerType_" + i].x = init_po[i];
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