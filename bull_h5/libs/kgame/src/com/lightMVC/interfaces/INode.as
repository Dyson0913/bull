package com.lightMVC.interfaces
{
	public interface INode
	{
		function getName():String;
//		function setProxy(proxy:IProxy):void
//		function sentNotification(notiName:String, body:Object = null):INode
		function getInjector():Array;
		
		function get isInitialize():Boolean;
		
		function set isInitialize(value:Boolean):void;
	}
}