package com.lightMVC.interfaces
{
	public interface INotification
	{
		function getName():String;
		function setName(value:String):void;
		function setBody( body:Object ):void;
		function getBody():Object;
		function toString():String;
	}
}