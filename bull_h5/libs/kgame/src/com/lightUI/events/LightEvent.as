package com.lightUI.events
{
	import com.iflash.events.Event;

	/*
	* @author light
	* 上午9:07:24
	*/
	public class LightEvent extends Event
	{
		public static const CLOSE:String = "close";
		public static const ITEM_CLICK:String = "item_click";
		public static const CREATCOMPLETE:String = "creatComplete";
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		public static const TIME_OUT:String = "timeOut";
		
		
		public var data:Object;
		public function LightEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.data = data;
			super(type, bubbles, cancelable);
		}
	}
}