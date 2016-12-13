package com.lightUI.components.alert
{
	import laya.events.EventDispatcher;

	/**
	 * @author light
	 * 创建时间：2015-9-24 下午1:59:07
	 * 
	 */
	public interface IAlertWindow
	{
		function set title(value:String):void
		function set msg(value:String):void
		function set data(value:Object):void
		function get data():Object;
		function on(type:String, caller:*, listener:Function, args:Array = null):EventDispatcher
		function event(type:String, data:* = null):Boolean
		function off(type:String, caller:*, listener:Function, onceOnly:Boolean = false):EventDispatcher
		//function close():void
	}
}