package com.lightUI.events
{
	import com.iflash.events.Event;
	
	public class WindowEvent extends Event
	{
		public static const CLOSE:String = "close";
		
		public var data:Object;
		
		public function WindowEvent(type:String, data:String = "", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
}