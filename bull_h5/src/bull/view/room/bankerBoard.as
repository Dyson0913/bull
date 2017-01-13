package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import com.lightUI.core.Light;
	import laya.filters.ColorFilter;
	
	import laya.events.Event;
	import laya.utils.Tween;
	import laya.utils.Ease;
	import laya.utils.Handler;
	
	import ui.ui.room.BankerPanelUI
	
	
	public class bankerBoard extends BankerPanelUI
	{		
		
		public function bankerBoard() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();			
			
			btnBanker.on(Event.CLICK, this, onClick);
			btndeBanker.on(Event.CLICK, this, onClick);			
			
			btnBanker.on(Event.MOUSE_OVER, this, onOver);
			btndeBanker.on(Event.MOUSE_OVER, this, onOver);
			
			btnBanker.on(Event.MOUSE_OUT, this, onOut);
			btndeBanker.on(Event.MOUSE_OUT, this, onOut);
			
			
			hide();
			
			update_list([],-1);
		}
		
		public function hide():void
		{
			BankerTimes.text = "";
			textFix_text_0.text = "";
			Point.text = "";
			txtname.text = "";
			mcHintBoard.visible = false;
		}
		
		private function onOver(e:Event):void
		{
			mcHintBoard.visible = true;
		}
		
		private function onOut(e:Event):void
		{
			mcHintBoard.visible = false;
		}
		
		private function onClick(e:Event):void
		{			
			event(LightEvent.ITEM_CLICK,e.target.name);			
		}
		
		public function set_bankerlist(data:Array):void
		{				
			update_list(data[0],data[2]);			
			mcHintBoard.title.text = data[1];
		}		
		
		public function bankerinfo_update(data:Array):void
		{			
			txtname.text = data[0];
			BankerTimes.text = data[1];			
			Point.text = data[2];		
			
			//系統坐庄,""坐庄字樣不顥示
			if ( BankerTimes.text == "")
			{
				textFix_text_0.visible = false;
			}
			else textFix_text_0.visible = true;
			
		}
		
		public function newBanker(name:String):void
		{
			mc_bankerAni.mcHead.loadImage("http://statics.kgame63.com/common/images/avatars/1.png", 0, 0, 143, 139);			
			
			mc_bankerAni.visible = true;
			mc_bankerAni.alpha = 0;			
			
			mc_bankerAni["Name"].text = name;
			Tween.to(mc_bankerAni, { x:212, y:150, alpha:1, scaleX:1 , scaleY:1 }, 1000, Ease.cubicOut, Handler.create(this, ani_mid));
		}
		
		private function ani_mid( ):void 
		{			
			Tween.to(mc_bankerAni, { x:26, y:5, alpha:0, scaleX:0.3 , scaleY:0.3 }, 1000,Ease.cubicOut, Handler.create(this, ani_ok));
		}
		
		private function ani_ok( ):void 
		{
			mc_bankerAni.visible = false;
			mc_bankerAni.x = 563;
			mc_bankerAni.y = 5;					
			mc_bankerAni.alpha = 0;
			
			//source 指定沒用
			Head.loadImage("http://statics.kgame63.com/common/images/avatars/1.png", 0, 0, 60, 60);
		}
		
		
		
		private function update_list(playerlist:Array,self_po:int):void
		{
			//沒人排隊			
			var playerCnt:int = playerlist.length;
			if ( playerCnt == 0)
			{
				mcHintBoard.NoPlayer.visible = true;
				
				mcHintBoard.NextPoint.visible = false;
				mcHintBoard.Page.y = 126;				
				mcHintBoard.bg.height = 168;
				mcHintBoard.limitHint.y = 156;
				
				for (var i:int = 0; i < 10; i++)
				{
					mcHintBoard["player_" + i].text = "";
				}
				
				return;
			}
			
			//有人排隊
			mcHintBoard.NoPlayer.visible = false;			
			mcHintBoard.NextPoint.visible = true;
			
			for (var i:int = 0; i < playerCnt; i++)
			{
				mcHintBoard["player_" + i].text = (i + 1) + " " + playerlist[i];
				if ( i == self_po )
				{					
					mcHintBoard["player_" + i].color = "#b6c325";
				}
			}
			
			//二人以下不用動態拉伸
			if (playerCnt <= 2 ) return;
			
			//底版高度動態拉伸
			mcHintBoard.bg.height = 168 + (playerCnt - 2) * 28;
			mcHintBoard.Page.y = 126 + (playerCnt - 2) * 28;	
			mcHintBoard.limitHint.y = 156 + (playerCnt - 2) * 28;
		}
		
		
		public function apply_banker(value:Boolean):void
		{
			btnBanker.visible = value;
			btndeBanker.visible = !value;
		}
		
		private function test():void
		{			
			//view.viewBankerPanel.set_bankerlist([["player1","player2","player3","player4","player5","player6","player7","player8","player9","player10"],"[G币达到",3]);		
			//view.viewBankerPanel.newBanker("dyson",5,"7894")
		}			
		
	}

}