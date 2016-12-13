package com.lightUI.events
{
	public class ScenceManagerEvent extends LightEvent
	{
		public static const UI_CREATED:String = "uiCreated";////////////////UI视图被创建的时候调用
		public static const UI_SHOW:String = "uiShow";
		public static const UI_HIDE:String = "uiHide";
		public static const UI_DESTROY:String = "uiDestroy";
		public static const SCENCE_COMPLETE:String = "scenceComplete";//////////场景被创建
		public static const SCENCE_PROGRESS:String = "scenceProgress";
		
		public function ScenceManagerEvent(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, data, bubbles, cancelable);
		}
	}
}