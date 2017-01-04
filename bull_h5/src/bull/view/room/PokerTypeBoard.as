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
			blurFilter.strength = 50;
			this.pokerType_0
		}
		
		public function set_data(data:Array):void
		{
			
			for (var i:int = 0; i < 5; i++)
			{
				this["pokerType_" + i].filters = [blurFilter];
				//TODO 牌型
				var info:Array = data[i];
				this["pokerType_" + i]["Type"].index = 1;
				var de:int = i * 1.5;
				this["pokerType_" + i].visible = true;
				Tween.to(this["pokerType_" + i], { x:this["pokerType_" + i]+200}, 2000, Ease.elasticIn,Handler.create(this,onCompleteHandler,[i,info[1]]),de);
					 
			}
		}
		
		private function onCompleteHandler(i:int,odd:int):void 
		{
			this["pokerType_" + i]["multi"].scaleX = 1.5;
			this["pokerType_" + i]["multi"].scaleY = 1.5;
			this["pokerType_" + i]["multi"].alpha = 0;
			
			Tween.to(this["pokerType_" + i]["multi"], { scaleX:1, scaleY:1, alpha:1 }, 500, Ease.cubicOut);	
			
			this["pokerType_" + i]["odds"].scaleX = 1.5;
			this["pokerType_" + i]["odds"].scaleY = 1.5;
			this["pokerType_" + i]["odds"].alpha = 0;
			this["pokerType_" + i]["odds"].text = odd;
			Tween.to(this["pokerType_" + i]["odds"], {scaleX:1,scaleY:1,alpha:1}, 500, Ease.cubicOut);						
				
		}
		
		private function set_poker_image(idx_i:int, idx_j:int ):void 
		{
			//var idx:int = _pokerdata[idx_i][idx_j];
			
			//TODO wait poker
			this["poker_" + idx_i + "_" + idx_j].index = 1;
			
			if ( idx_i == 4 && idx_j == 4)
			{
				for(var i:int =0;i< 5;i++)
				{
					for (var j = 0; j < 5; j++)
					{
						Tween.to(this["poker_" + i + "_" + j], { x:this["poker_" + i + "_" + j].x  + (j*27)}, 500, Ease.cubicOut,Handler.create(this,ani_ok,[i,j]));						
					}
				}
			}
		}
		
		private function ani_ok(idx_i:int, idx_i:int ):void 
		{
			if ( idx_i == 4 && idx_j == 4)
			{
				//TODO　報牌型
			}
		}
		
		public function hide():void
		{			
			for(var i:int =0;i< 5;i++)
			{
				for (var j = 0; j < 5; j++)
				{
					Tween.to(this["poker_" + i + "_" + j], { x:649,y:-156}, 500, Ease.cubicOut);						
				}
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