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
			
			//0.3 0.3
			Banker_ani.visible = true;
			Banker_ani.alpha = 0;			
			Tween.to(Banker_ani, { x:212, y:150,alpha:1,scaleX:1 , scaleY:1 }, 1000, Ease.cubicOut, Handler.create(this, ani_mid));			
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
			//view.bankerBoard.set_data(["player",99999,7]);			
		}			
		
	}

}