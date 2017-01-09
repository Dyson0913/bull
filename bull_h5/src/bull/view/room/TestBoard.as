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
			var sName:String = e.target.name;
			var pattern:RegExp = /btn_/;
			sName = sName.replace(pattern, "");			
			//s = s.substr(4, );			
			
			event(LightEvent.ITEM_CLICK,parseInt(sName));			
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