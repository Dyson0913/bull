package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import ui.ui.room.PokerUI
	
	public class Poker extends PokerUI
	{
		private var _pokerdata:Array = [];
		
		private var _po:Array = [ [[609, 92, -2], [636, 92, -2], [663, 92, -1], [690, 92, 0], [718, 92, 1]],
								   [[221, 445, -6], [251, 445, -6], [281, 445, -6], [310, 445, -5], [340, 445, -4]],
								   [[479, 443, -3], [509, 443, -3], [538, 443, -2], [569, 443, -2], [599, 443, -1]],
								   [[733, 445, 0], [764, 445, 0], [793, 445, 0], [823, 445, 0], [854, 445, 0]],
								   [[987, 445, 1], [1018, 445, 3], [1047, 445, 3], [1078, 445, 3], [1109, 445, 3]]
		                         ];
		private var _scale:Array = [[0.43, 0.42], [0.46, 0.46], [0.46, 0.46], [0.46, 0.46], [0.46, 0.46]];
		
		public function Poker() 
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();						
			
		}
		
		public function set_data(data:Array):void
		{
			_pokerdata.length = 0;	
			_pokerdata = data;
			
			for (var i:int = 0; i < 5; i++)
			{
				var list:Array = _po[i];
				for (var j = 0; j < 5; j++)
				{
					var p:Array = list[j];
					this["poker_" + i + "_" + j].index = 0;					
					this["poker_" + i + "_" + j].x = 1114;					
					this["poker_" + i + "_" + j].y = 126;					
					this["poker_" + i + "_" + j].rotation = -65;
					this["poker_" + i + "_" + j].scaleX = 0.4;
					this["poker_" + i + "_" + j].scaleY = 0.4;
					this["poker_" + i + "_" + j].skewX = p[2];
				}
			}
		}
		
		public function play():void
		{
			this.visible = true;
			for (var i:int = 0; i < 5; i++)
			{
				var list:Array = _po[i];
				for (var j = 0; j < 5; j++)
				{					
					var p:Array = list[j];
					var sc:Array = _scale[i];
					Tween.to(this["poker_" + i + "_" + j], { x:p[0] , y:p[1],scaleX:sc[0], scaleY:sc[1],rotation :0 }, 1000, Ease.cubicOut,Handler.create(this,onCompleteHandler,[i,j]));
				}				 
			}
		}
		
		private function onCompleteHandler(idx_i:int, idx_j:int):void 
		{
			if ( idx_i == 4 && idx_j == 4)
			{
				for(var i:int =0;i< 5;i++)
				{
					for (var j = 0; j < 5; j++)
					{
						Tween.to(this["poker_" + i + "_" + j], { x:this["poker_" + i + "_" + j].x  - (j*27)}, 500, Ease.cubicOut,Handler.create(this,set_poker_image,[i,j]));						
					}
				}
			}
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
		
		private function ani_ok(idx_i:int, idx_j:int ):void 
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