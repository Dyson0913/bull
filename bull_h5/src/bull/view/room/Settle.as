package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	import com.lightUI.core.Light;
	import laya.filters.ColorFilter;
	
	import laya.events.Event;
	
	import ui.ui.room.SettleUI
	
	
	public class Settle extends SettleUI
	{		
		public function Settle() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();			
			
			Btn_ok.on(Event.CLICK, this, onClick);
			Btn_close.on(Event.CLICK, this, onClick);
			
			
		}
		
		private function onClick(e:Event):void
		{			
			this.visible = false;
			
			//TODO 
			//event(LightEvent.ITEM_CLICK,parseInt(s));			
		}
		
		public function set_data(data:Array):void
		{
			this.visible = true;
			
			Name.text = data[0];
			Curren_Money.text = data[1];
			
			Win_amount.font = "SettleWin";
			Lost_amount.font = "SettleLost";
			
			Lost_amount.text = "-¥1234.567890";
			Win_amount.text = "+¥1234.567890";
			
			
		}
		
		private function test():void
		{
			//view.InfoBoard.set_data(["name",99999]);			
			//view.InfoBoard.set_gray();
			//view.InfoBoard.set_orge();
		}			
		
	}

}