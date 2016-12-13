package com.lightMVC.interfaces
{
	public interface IModel extends INode
	{
//		function getModelName():String;
//		function setData( data:Object ):void;
//		function getData():Object; 
		
		function getData():Object;
		function setData(value:Object):void;
		function getModel(modelName:String):IModel;
		function getSingleton(clazzname:String):Object
		
		function onRegister( ):void;
		function onInitialize():void;
		function onRemove( ):void;
		function injector():void
		
			
		function setProxy(proxy:IProxy):void
		function sentNotification(notiName:String, body:Object = null):INode
	}
}