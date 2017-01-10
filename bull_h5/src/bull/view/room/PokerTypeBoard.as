package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import conf.SDealInfo;
	
	import laya.filters.BlurFilter;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import ui.ui.room.PokerTypeUI
	
	public class PokerTypeBoard extends PokerTypeUI
	{
		private var blurFilter:BlurFilter 
		private var _pokerdata:Array = [];
		
		private var _Wineffect:WinLostEffect = null;
		
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
		
		public function set_winlost(effect:WinLostEffect):void
		{
			_Wineffect = effect;
			_Wineffect.hide();
		}
		
		public function set_data(data:Array):void
		{
			this.hide();
			_pokerdata = data;
			
			for (var i:int = 0; i < 5; i++)
			{
				this["pokerType_" + i].filters = [blurFilter];
				this["pokerType_" + i]["odds"].font = "SettleWin";
				//TODO 牌型
				var info:SDealInfo = data[i];
				//this["pokerType_" + i]["Type"].index = 1;
				var de:int = i * 1500;
				
				
				Tween.to(this["pokerType_" + i], { x:this["pokerType_" + i].x+150}, 500, Ease.quintInOut,Handler.create(this,onCompleteHandler,[i,info.odds]),de);
			}
			
			
		}
		
		private function onCompleteHandler(i:int,odd:int):void 
		{
			this["pokerType_" + i].visible = true;
			this["pokerType_" + i].filters = [];
			this["pokerType_" + i]["multi"].scaleX = 1.5;
			this["pokerType_" + i]["multi"].scaleY = 1.5;
			this["pokerType_" + i]["multi"].alpha = 0;
			
			Tween.to(this["pokerType_" + i]["multi"], { scaleX:1, scaleY:1, alpha:1 }, 500, Ease.cubicOut);	
			
			this["pokerType_" + i]["odds"].scaleX = 1.5;
			this["pokerType_" + i]["odds"].scaleY = 1.5;
			this["pokerType_" + i]["odds"].alpha = 0;
			this["pokerType_" + i]["odds"].text = odd.toString();;
			Tween.to(this["pokerType_" + i]["odds"], {scaleX:1,scaleY:1,alpha:1}, 500, Ease.cubicOut,null,2);
			
			//庄家報完牌型
			trace("i=="+i);
			if (i == 4)
			{
				if ( _Wineffect != null)
				{
					_Wineffect.set_data(_pokerdata);
				}
				
			}
			
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
			//view.PokerTypePanel.set_data([[1, 7], [2, 1], [2, 10], [0, 7], [5, 0]]);
			//view.PokerTypePanel.hide();			
		}		
	}

}