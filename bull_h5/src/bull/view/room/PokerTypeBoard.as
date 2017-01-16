package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import conf.SDealInfo;
	import laya.ui.Image;
	
	import laya.filters.BlurFilter;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import ui.ui.room.PokerTypeUI
	
	public class PokerTypeBoard extends PokerTypeUI
	{
		private var blurFilter:BlurFilter 		
		
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
			
			var order:Array = [1, 2, 3, 4, 0];
			for (var i:int = 0; i < 5; i++)
			{
				this["pokerType_" + i].filters = [blurFilter];
				this["pokerType_" + i]["odds"].font = "SettleWin";
				
				var type_idx:int = 0;
				var info:SDealInfo = data[order[i]];
								
				if ( info.bull_type >= 12 && info.bull_type <= 24 ) type_idx = 12;
				if ( info.bull_type == 25 ) type_idx = 13;
				else type_idx = info.bull_type;
				
				//牛牛以上有效果
				if (type_idx >= 10) 
				{
					this["pokerType_" + i]["shine"].visible = true;
					if (　i == 0 ) Laya.timer.frameLoop(1, this, animate_0);	
					if (　i == 1 ) Laya.timer.frameLoop(1, this, animate_1);
					if (　i == 2 ) Laya.timer.frameLoop(1, this, animate_2);
					if (　i == 3 ) Laya.timer.frameLoop(1, this, animate_3);	
					if (　i == 4 ) Laya.timer.frameLoop(1, this, animate_4);
					
					
				}
				
				this["pokerType_" + i]["Type"].index = type_idx
				
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
			if (i == 4)
			{
				if ( _Wineffect != null)
				{
					_Wineffect.play();
				}
				
			}
			
		}
		
		
		private function animate_0():void 
		{
			pokerType_0.shine.rotation += 2;			
		}
		
		private function animate_1():void 
		{
			pokerType_1.shine.rotation += 2;			
		}
		
		private function animate_2():void 
		{
			pokerType_2..shine.rotation += 2;			
		}
		
		private function animate_3():void 
		{
			pokerType_3.shine.rotation += 2;			
		}
		
		private function animate_4():void 
		{
			pokerType_4.shine.rotation += 2;
		}
		
		public function hide():void
		{			
			var init_po:Array = [81, 368, 651, 904, 467];
			for(var i:int =0;i< 5;i++)
			{
				this["pokerType_" + i].visible = false;
				this["pokerType_" + i].x = init_po[i];
				this["pokerType_" + i]["shine"].visible = false;
			}
			
			//光效果關閉
			timer.clear(this, animate_0);
			timer.clear(this, animate_1);
			timer.clear(this, animate_2);
			timer.clear(this, animate_3);
			timer.clear(this, animate_4);
		}
		
		
		private function test():void
		{
			//view.PokerTypePanel.set_data([[1, 7], [2, 1], [2, 10], [0, 7], [5, 0]]);
			//view.PokerTypePanel.hide();			
		}		
	}

}