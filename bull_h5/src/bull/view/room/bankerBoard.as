package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import com.lightUI.core.Light;
	import laya.filters.ColorFilter;
	
	import laya.events.Event;
	
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
		}
		
		
		
		private function test():void
		{
			//view.bankerBoard.set_data(["player",99999,7]);			
		}			
		
	}

}