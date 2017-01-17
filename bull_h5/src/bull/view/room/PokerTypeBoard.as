package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import conf.ENBullType;
	import conf.SDealInfo;
	import laya.ui.Image;
	
	import laya.filters.BlurFilter;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import bull.core.SoundPath;
	import laya.media.SoundManager;
	
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
			var fix_po:Array = [210, 475, 730, 990, 617];			
			
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
				Tween.to(this["pokerType_" + i], { x:fix_po[i] }, 500, Ease.quintInOut, Handler.create(this, onCompleteHandler, [i, info.odds, info.bull_type]), de);			
				
			}
			
			
		}
		
		private function onCompleteHandler(i:int,odd:int,type:int):void 
		{
			var multi_x:int = 0;
			var odd_x:int = 0;
			if (type == 11 || type == 25 || type ==10)
			{
				multi_x = 171;
				odd_x = 202;
			}
			else if ( type >= 12 && type <= 24)
			{
				multi_x = 156;
				odd_x = 191;
			}
			else 
			{
				multi_x = 127;
				odd_x = 162;
			}
			
			this["pokerType_" + i].visible = true;
			this["pokerType_" + i].filters = [];
			
			this["pokerType_" + i]["multi"].alpha = 0;
			this["pokerType_" + i]["odds"].alpha = 0;
								
			if ( type > ENBullType.BULL_TYPE_NOP)
			{
				this["pokerType_" + i]["multi"].x = multi_x;
				this["pokerType_" + i]["multi"].scaleX = 1.5;
				this["pokerType_" + i]["multi"].scaleY = 1.5;				
				
				Tween.to(this["pokerType_" + i]["multi"], { scaleX:1, scaleY:1, alpha:1 }, 500, Ease.cubicOut);	
				
				this["pokerType_" + i]["odds"].x = odd_x;
				this["pokerType_" + i]["odds"].scaleX = 1.5;
				this["pokerType_" + i]["odds"].scaleY = 1.5;				
				this["pokerType_" + i]["odds"].text = odd.toString();;
				Tween.to(this["pokerType_" + i]["odds"], { scaleX:1, scaleY:1, alpha:1 }, 500, Ease.cubicOut, null, 2);
			}
			
			//報牌型
			playsound_type(i==4,type)
			
			//庄家報完牌型			
			if (i == 4)
			{
				if ( _Wineffect != null)
				{
					_Wineffect.play();
				}
				
			}
			
		}
		
		private function playsound_type(banker:Boolean,kind:int):void
		{
			var playsound:String;
			
			// 10: 牛牛, 11:花牛,12~14:四炸,25:小牛
			//庄家
			if( banker)
			{
			    if (kind ==0) 	playsound = SoundPath.Bull_g_None;
				else if (kind ==1) 	playsound = SoundPath.Bull_g_1;
				else if (kind ==2) 	playsound = SoundPath.Bull_g_2;
				else if (kind ==3) 	playsound = SoundPath.Bull_g_3;
				else if (kind ==4) 	playsound = SoundPath.Bull_g_4;
				else if (kind ==5) 	playsound = SoundPath.Bull_g_5;
				else if (kind ==6) 	playsound = SoundPath.Bull_g_6;
				else if (kind ==7) 	playsound = SoundPath.Bull_g_7;
				else if (kind ==8) 	playsound = SoundPath.Bull_g_8;
				else if (kind ==9) 	playsound = SoundPath.Bull_g_9;
				else if (kind ==10) playsound = SoundPath.Bull_g_10;
				else if (kind ==11) playsound = SoundPath.Bull_g_fiveDoll;
				else if (kind >=12 && kind<=24 ) playsound = SoundPath.Bull_g_fourBomb;
				else if (kind ==25 ) playsound = SoundPath.Bull_b_fiveSmall;
			}
			else
			{
				if (kind ==0) 		playsound = SoundPath.Bull_b_None;
				else if (kind ==1) 	playsound = SoundPath.Bull_b_1;
				else if (kind ==2) 	playsound = SoundPath.Bull_b_2;
				else if (kind ==3) 	playsound = SoundPath.Bull_b_3;
				else if (kind ==4) 	playsound = SoundPath.Bull_b_4;
				else if (kind ==5) 	playsound = SoundPath.Bull_b_5;
				else if (kind ==6) 	playsound = SoundPath.Bull_b_6;
				else if (kind ==7) 	playsound = SoundPath.Bull_b_7;
				else if (kind ==8) 	playsound = SoundPath.Bull_b_8;
				else if (kind ==9) 	playsound = SoundPath.Bull_b_9;
				else if (kind ==10) playsound = SoundPath.Bull_b_10;
				else if (kind ==11) playsound = SoundPath.Bull_b_fiveDoll;
				else if (kind >=12 && kind<=24 ) playsound = SoundPath.Bull_b_fourBomb;
				else if (kind ==25 ) playsound =SoundPath.Bull_b_fiveSmall;
			}
			
			SoundManager.playSound(playsound);
			
			//牛牛,五花,五小有額外另一音效
			if( kind == 10 || kind == 11 || kind ==25)
			{
				SoundManager.playSound(SoundPath.Bull_10_effect);	
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
			var init_po:Array = [60, 325, 580, 840,467];
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
			
			Tween.clearAll(this);
		}
		
		private function test():void
		{
			//view.PokerTypePanel.set_data([[1, 7], [2, 1], [2, 10], [0, 7], [5, 0]]);
			//view.PokerTypePanel.hide();			
		}		
	}

}