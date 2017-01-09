package bull.view.room 
{
	import com.lightUI.events.LightEvent;
	
	import laya.events.Event;
	
	import ui.ui.room.TestUI
	
	public class TestBoard extends TestUI
	{
		
		public function TestBoard() 
		{
			super();
			
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			trace("TestBoard Init");
			
			
			for (var i:int = 0; i < 15; i++)
			{
				this["btn_" + i].on(Event.CLICK, this, onTestClick);				
			}
		}
		
		private function onTestClick(e:Event):void
		{			
			var s:String = e.target.name;
			s = s.substr(4, 1);			
			
			event(LightEvent.ITEM_CLICK,parseInt(s));			
		}
		
		public function hide():void
		{
			trace("TestBoard hide");
		}
		
		public function show():void
		{
			trace("TestBoard show");
		}
		
	}

}