package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import conf.SDealInfo;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import ui.ui.room.PokerUI
	
	public class Poker extends PokerUI
	{
		private var _pokerdata:Array = [];
		private var _PokerType:PokerTypeBoard;		
		
		//莊,閒1~~閒4
		private var _po:Array = [ [[609, 92, -2], [636, 92, -2], [663, 92, -1], [690, 92, 0], [718, 92, 1]],
								   [[221, 445, -6], [251, 445, -6], [281, 445, -6], [310, 445, -5], [340, 445, -4]],
								   [[479, 443, -3], [509, 443, -3], [538, 443, -2], [569, 443, -2], [599, 443, -1]],
								   [[733, 445, 0], [764, 445, 0], [793, 445, 0], [823, 445, 0], [854, 445, 0]],
								   [[987, 445, 1], [1018, 445, 3], [1047, 445, 3], [1078, 445, 3], [1109, 445, 3]]
		                         ];
		private var _scale:Array = [[0.43, 0.42], [0.46, 0.46], [0.46, 0.46], [0.46, 0.46], [0.46, 0.46]];
		
		private var _is_playing:Boolean = false;
		
		public function Poker() 
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();						
			
		}
		
		public function set_data(data:Array,pokertype:PokerTypeBoard,Wineffect:WinLostEffect,win_diplay:Array,winlose_data:Array):void
		{		
			//正在播放,不要再播放
			if ( this._is_playing) return;
			
			_pokerdata = data;
			_PokerType = pokertype;
			_PokerType.hide();						
			_PokerType.set_winlost(Wineffect);
			Wineffect.set_(win_diplay,winlose_data);
			
			
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
			
			this._is_playing = false;
		}
		
		public function play(rest_sce:int):void
		{
			this.visible = true;
			
			this._is_playing = true;
			
			//非完整時間(即中途進入),不做動畫,直接開到牌到定位
			if ( rest_sce < 13)
			{
				for (var i:int = 0; i < 5; i++)
				{
					var list:Array = _po[i];
					for (var j = 0; j < 5; j++)
					{					
						var p:Array = list[j];
						var sc:Array = _scale[i];
						Tween.to(this["poker_" + i + "_" + j], { x:p[0] , y:p[1], scaleX:sc[0], scaleY:sc[1], rotation :0 }, 10, Ease.cubicOut);
						
						var info:SDealInfo = _pokerdata[i];
						var idx:int =info["card" + (j + 1)];
						this["poker_" + i + "_" + j].index = idx;		
					}									
					
				}			
				return;
			}
			
			
			
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
			
			if ( idx_i == 4 && idx_j == 4)
			{
				for(var i:int =0;i< 5;i++)
				{
					for (var j = 0; j < 5; j++)
					{
						var info:SDealInfo = _pokerdata[i];
						var idx:int =info["card" + (j + 1)];
						this["poker_" + i + "_" + j].index = idx;
						
						Tween.to(this["poker_" + i + "_" + j], { x:this["poker_" + i + "_" + j].x  + (j*27)}, 500, Ease.cubicOut,Handler.create(this,ani_ok,[i,j]));						
					}
				}
			}
		}
		
		private function ani_ok(idx_i:int, idx_j:int ):void 
		{
			//上移牌型
			if ( idx_j == 4)
			{
				var info:SDealInfo = _pokerdata[idx_i];
				if (info.bull_type == 0)
				{
					//移一張
					this["poker_" + idx_i + "_" + 4].y -= 10;
				}
				else if (info.bull_type >= 1 && info.bull_type <= 9)
				{
					//移最右兩張
					this["poker_" + idx_i + "_" + 4].y -= 10;
					this["poker_" + idx_i + "_" + 3].y -= 10;
					
				}
				else
				{
					//移五張
					this["poker_" + idx_i + "_" + 0].y -= 10;
					this["poker_" + idx_i + "_" + 1].y -= 10;
					this["poker_" + idx_i + "_" + 2].y -= 10;
					this["poker_" + idx_i + "_" + 3].y -= 10;
					this["poker_" + idx_i + "_" + 4].y -= 10;
				}
				
			}
			
			
			if ( idx_i == 4 && idx_j == 4)
			{
				//開始報牌型
				_PokerType.set_data(_pokerdata);
			}
		}
		
		public function recycle():void
		{			
			for(var i:int =0;i< 5;i++)
			{
				for (var j = 0; j < 5; j++)
				{
					Tween.to(this["poker_" + i + "_" + j], { x:649,y:-156}, 500, Ease.cubicOut);						
				}
			}
			
			this._is_playing = false;
		}
		
		public function hide():void
		{
			this.visible = false;
		}
		
		private function test():void
		{
			//view.PokerSet.set_data([]);
			//view.PokerSet.play();
			//view.PokerSet.hide();
		}		
	}

}