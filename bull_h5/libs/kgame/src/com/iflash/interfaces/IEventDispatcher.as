package com.iflash.interfaces
{
	public interface IEventDispatcher
	{
		function addEventListener(type:String, caller:*, listener:Function,arge:Array = null,useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		
		function addEventListenerOnce(type:String, caller:*, listener:Function,arge:Array = null):void
		
		function removeEventListener(type:String,caller:*, listener:Function, useCapture:Boolean=false):void
	}
}