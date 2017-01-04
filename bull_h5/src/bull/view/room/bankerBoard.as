package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import com.lightUI.core.Light;
	import laya.filters.ColorFilter;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import ui.ui.room.BankerBoardUI
	
	
	public class bankerBoard extends BankerBoardUI
	{		
		
		public function bankerBoard() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();			
			
			bankerapply.on(Event.CLICK, this, onClick);
			deapply.on(Event.CLICK, this, onClick);			
			
			bankerapply.on(Event.MOUSE_OVER, this, onOver);
			deapply.on(Event.MOUSE_OVER, this, onOver);
			
			bankerapply.on(Event.MOUSE_OUT, this, onOut);
			deapply.on(Event.MOUSE_OUT, this, onOut);
			
			listHint.visible = false;
			update_list(0);
		}
		
		private function onOver(e:Event):void
		{
			listHint.visible = true;
		}
		
		private function onOut(e:Event):void
		{
			listHint.visible = false;
		}
		
		private function onClick(e:Event):void
		{					
			e.target			
			
			if ( e.target == bankerapply)
			{
				trace("bankerapply");
			}
			else if ( e.target == deapply)
			{
				trace("deapply");
			}
			
			
			//TODO 
			//event(LightEvent.ITEM_CLICK,parseInt(s));			
		}
		
		public function set_data(data:Array):void
		{
			
			Title.text = data[0];
			BankerTimes.text = data[1];
			Money.text = data[2];
			var playerCnt:int = data[3];			
			
			
			Banker_ani.visible = true;
			Banker_ani.alpha = 0;			
			Tween.to(Banker_ani, { x:212, y:150, alpha:1, scaleX:1 , scaleY:1 }, 1000, Ease.cubicOut, Handler.create(this, ani_mid));			
			
			update_list(playerCnt, data[4],data[6]);
			listHint.title.text = data[5];
			
		}
		
		private function update_list(playerCnt:int,playerlist:Array,self_po:int):void
		{
			//沒人排隊
			if ( playerCnt == 0)
			{
				listHint.NoPlayer.visible = true;
				
				listHint.NextPoint.visible = false;
				listHint.Page.y = 126;				
				listHint.bg.height = 168;
				
				for (var i:int = 0; i < 10; i++)
				{
					listHint["player_" + i].text = "";
				}
				
				return;
			}
			
			//有人排隊
			listHint.NoPlayer.visible = false;			
			listHint.NextPoint.visible = true;
			
			for (var i:int = 0; i < playerCnt; i++)
			{
				listHint["player_" + i].text = (i + 1) + " " + playerlist[i];
				if ( i == self_po )
				{					
					listHint["player_" + i].color = "#b6c325";
				}
			}
			
			//二人以下不用動態拉伸
			if (playerCnt <= 2 ) return;
			
			//底版高度動態拉伸
			listHint.bg.height = 168 + (playerCnt - 2) * 28;
			listHint.Page.y = 126 + (playerCnt - 2) * 28;	
		}
		
		private function ani_mid( ):void 
		{			
			Tween.to(Banker_ani, { x:26, y:5, alpha:0, scaleX:0.3 , scaleY:0.3 }, 1000,Ease.cubicOut, Handler.create(this, ani_ok));			
		}
		
		private function ani_ok( ):void 
		{
			Banker_ani.visible = false;
			Banker_ani.x = 563;
			Banker_ani.y = 5;					
			Banker_ani.alpha = 0;		
		}
		
		
		private function test():void
		{			
		//	view.bankerPanel.set_data(["jjj",99999,"111",0,["player1","player2"],"[现金达到",-1]);
		//	view.bankerPanel.set_data(["jjj",99999,"111",6,["player1","player2","player3","player4","player5","player6","player7","player8","player9","player10"],"[G币达到",3]);
		}			
		
	}

}