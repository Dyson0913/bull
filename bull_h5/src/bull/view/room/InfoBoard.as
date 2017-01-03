package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import com.lightUI.core.Light;
	import laya.filters.ColorFilter;
	
	import laya.events.Event;
	
	import ui.ui.room.InfoBoardUI
	
	
	public class InfoBoard extends InfoBoardUI
	{		
		public function InfoBoard() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();			
			
			Btn_CancelBet.on(Event.CLICK, this, onClick);
			Btn_SameBet.on(Event.CLICK, this, onClick);
			CarryIn.on(Event.CLICK, this, onClick);				
		}
		
		private function onClick(e:Event):void
		{					
			e.target			
			
			if ( e.target == Btn_CancelBet)
			{
				trace("Btn_CancelBet");
			}
			else if ( e.target == Btn_SameBet)
			{
				trace("Btn_SameBet");
			}
			else if ( e.target == CarryIn)
			{
				trace("CarryIn");
			}
			
			//TODO 
			//event(LightEvent.ITEM_CLICK,parseInt(s));			
		}
		
		public function set_data(data:Array):void
		{
			Name.text = data[0];
			Money.text = data[1];
			
			
		}
		
		public function set_gray():void
		{
			Btn_CancelBet.disabled = true;
			Btn_SameBet.disabled = true;
		}
		
		public function set_orge():void
		{
			Btn_CancelBet.disabled = false;
			Btn_SameBet.disabled = false;			
		}
		
		private function test():void
		{
			//view.InfoBoard.set_data(["name",99999]);			
			//view.InfoBoard.set_gray();
			//view.InfoBoard.set_orge();
		}			
		
	}

}