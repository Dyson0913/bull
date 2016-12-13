package com.iflash.events
{
	import laya.events.Event;
	
	public class Event extends laya.events.Event
	{
		public var bubbles:Boolean;
		public var cancelable:Boolean;
		
		public function Event(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super();
			super.type = type;
			this.bubbles = bubbles;
			this.cancelable = cancelable;
		}
		
		public function clone():com.iflash.events.Event
		{
			return new com.iflash.events.Event(type);
		}
	}
}