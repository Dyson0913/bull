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
			
			btn_0.on(Event.CLICK, this, onTestClick);
			btn_1.on(Event.CLICK, this, onTestClick);
			btn_2.on(Event.CLICK, this, onTestClick);
			btn_3.on(Event.CLICK, this, onTestClick);
			btn_4.on(Event.CLICK, this, onTestClick);
			btn_5.on(Event.CLICK, this, onTestClick);
			
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